import 'dart:convert';
import 'dart:io';
import 'package:derma_scan/src/data/models/response/album_response_model.dart';
import 'package:derma_scan/src/data/models/response/slika_response_model.dart';
import 'package:derma_scan/src/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:derma_scan/src/components/custom_appbar.dart';
import 'package:derma_scan/src/modules/scan/image_preview.dart';
import '../../helpers/shared_preferences.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  bool isLoading = true;
  bool isGroupSelected = false;
  AlbumResponse? selectedAlbum;
  List<AlbumResponse> albums = [];
  List<SlikaResponse> images = [];

  final ImageService imageService = ImageService();

  @override
  void initState() {
    super.initState();
    _loadAlbums();
  }

  Future<void> _loadAlbums() async {
    setState(() => isLoading = true);

    final deviceId = await SharedPreferencesHelper.getDeviceId();
    if (deviceId == null) {
      setState(() => isLoading = false);
      return;
    }

    final fetchedAlbums = await imageService.getAlbumsByUser(deviceId);
    setState(() {
      albums = fetchedAlbums;
      isLoading = false;
      isGroupSelected = false;
      selectedAlbum = null;
      images = [];
    });
  }

  Future<void> _loadImagesForAlbum(AlbumResponse album) async {
    setState(() {
      isLoading = true;
      isGroupSelected = true;
      selectedAlbum = album;
    });

    final fetchedImages = await imageService.getSlikeByAlbum(album.id);
    setState(() {
      images = fetchedImages;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Historija'),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : isGroupSelected
              ? _buildImagesList()
              : _buildAlbumList(),
    );
  }

  Widget _buildAlbumList() {
    return ListView.builder(
      itemCount: albums.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final album = albums[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            title: Text(album.naziv ?? ''),
            subtitle: Text('Kreirano: ${_formatDate(album.datumKreiranja)}'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _loadImagesForAlbum(album),
          ),
        );
      },
    );
  }

  Widget _buildImagesList() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            'Album: ${selectedAlbum?.naziv ?? ''}',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: TextButton(
            onPressed: _loadAlbums,
            child: const Text('Nazad'),
          ),
        ),
        if (images.isEmpty)
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text('Nije pronađena nijedna slika za ovaj album.'),
          ),
        if (images.isNotEmpty)
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(12),
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.75,
              children: images.map((img) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => PreviewOfImageScreen(imageId: img.id),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(8)),
                          child: Image.memory(
                            base64Decode(
                                img.slikaBaseEncoded), // decode directly
                            height: 170,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                const SizedBox(
                              height: 170,
                              child: Center(child: Icon(Icons.broken_image)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 6),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                _formatDate(img.datumKreiranja),
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              if (img.opis != null)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    img.opis!,
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.black87),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
      ],
    );
  }

  String _formatDate(dynamic value) {
    try {
      if (value == null || value.toString().isEmpty) return 'Unknown';
      final parsedDate = DateTime.tryParse(value.toString());
      if (parsedDate == null) return 'Invalid date';
      return DateFormat('yyyy-MM-dd HH:mm').format(parsedDate);
    } catch (_) {
      return 'Invalid date';
    }
  }
}
