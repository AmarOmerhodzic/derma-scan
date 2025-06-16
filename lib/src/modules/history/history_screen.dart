import 'dart:io';
import 'package:derma_scan/src/modules/scan/image_preview.dart';
import 'package:flutter/material.dart';
import 'package:derma_scan/src/components/custom_appbar.dart';
import 'package:derma_scan/src/data/db/db_helper.dart';
import 'package:intl/intl.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({Key? key}) : super(key: key);

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen> {
  bool isLoading = true;
  bool isGroupSelected = false;
  int? selectedGroupId;
  String? selectedGroupName;
  List<Map<String, dynamic>> groups = [];
  List<Map<String, dynamic>> images = [];

  @override
  void initState() {
    super.initState();
    _loadGroups();
  }

  Future<void> _loadGroups() async {
    setState(() => isLoading = true);
    final db = await DBHelper().database;
    final result = await db.query('groups');
    setState(() {
      groups = result;
      isLoading = false;
      isGroupSelected = false;
      selectedGroupId = null;
      images = [];
    });
  }

  Future<void> _loadImagesForGroup(int groupId, String groupName) async {
    setState(() {
      isLoading = true;
      isGroupSelected = true;
      selectedGroupId = groupId;
      selectedGroupName = groupName;
    });
    final db = await DBHelper().database;
    final result = await db.query('images',
        where: 'group_id = ?', whereArgs: [groupId], orderBy: 'date DESC');
    await Future.delayed(const Duration(milliseconds: 300)); // simulate loading
    setState(() {
      images = result;
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
              : _buildGroupList(),
    );
  }

  Widget _buildGroupList() {
    return ListView.builder(
      itemCount: groups.length,
      padding: const EdgeInsets.all(16),
      itemBuilder: (context, index) {
        final group = groups[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            title: Text(group['name']),
            subtitle: Text(
              'Kreirano: ${_formatDate(group['created_at'])}',
            ),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => _loadImagesForGroup(group['id'], group['name']),
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
            'Album: $selectedGroupName',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          trailing: TextButton(
            onPressed: _loadGroups,
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
                    debugPrint("Tapped on image: ${img['path']}");
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            PreviewOfImageScreen(imageId: img['id']),
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
                          child: Image.file(
                            File(img['path']),
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
                                _formatDate(img['date']),
                                style: const TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.w500),
                              ),
                              if (img['note'] != null &&
                                  img['note'].toString().isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(top: 4),
                                  child: Text(
                                    img['note'],
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
