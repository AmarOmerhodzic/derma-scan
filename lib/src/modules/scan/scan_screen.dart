import 'dart:convert';
import 'dart:io';
import 'package:derma_scan/src/components/custom_appbar.dart';
import 'package:derma_scan/src/constants/color.dart';
import 'package:derma_scan/src/data/models/response/slika_response_model.dart';
import 'package:derma_scan/src/helpers/shared_preferences.dart';
import 'package:derma_scan/src/modules/scan/image_preview.dart';
import 'package:derma_scan/src/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanScreen extends StatefulWidget {
  ScanScreen({Key? key}) : super(key: key);

  @override
  ScanScreenState createState() => ScanScreenState();
}

class ScanScreenState extends State<ScanScreen> {
  List<SlikaResponse> recentImages = [];
  final ImageService imageService = ImageService();
  String? korisnikId;

  @override
  void initState() {
    super.initState();
    _loadKorisnikAndRecentImages();
  }

  Future<void> _loadKorisnikAndRecentImages() async {
    korisnikId = await SharedPreferencesHelper.getDeviceId();

    if (korisnikId != null) {
      await _loadRecentImages();
    }
  }

  Future<void> _loadRecentImages() async {
    if (korisnikId == null) return;

    try {
      final images = await imageService.getLastThreeSlike(korisnikId!);
      setState(() {
        recentImages = images;
      });
    } catch (e) {
      debugPrint("Error loading recent images: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Skeniraj mladež'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Pratite svoju kožu s lakoćom',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Kliknite ispod da skenirate svoj mladež',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            const Icon(Icons.camera, size: 80, color: Colors.grey),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(180, 50),
                backgroundColor: ColorConstants.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, '/takePictureScreen');
              },
              child: const Text(
                'Kliknite za skeniranje',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 80),

            // Section: Scan History
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Nedavna skeniranja',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 10),

            Container(
              height: 150,
              width: double.infinity,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: recentImages.isEmpty
                  ? const Center(
                      child: Text(
                        'Nema dostupnih skeniranja',
                        style: TextStyle(color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: recentImages.length,
                      itemBuilder: (context, index) {
                        final img = recentImages[index];
                        return Container(
                          width: 110,
                          margin: const EdgeInsets.only(right: 8),
                          child: GestureDetector(
                            onTap: () {
                              debugPrint("Tapped on image: ${img.id}");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      PreviewOfImageScreen(imageId: img.id),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 2,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(8)),
                                    child: Image.memory(
                                      base64Decode(img.slikaBaseEncoded ?? ''),
                                      height: 90,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const SizedBox(
                                        height: 90,
                                        child: Center(
                                            child: Icon(Icons.broken_image)),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 6, vertical: 4),
                                    child: Text(
                                      img.opis ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
            ),
            const Spacer(),
            const Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Važna napomena:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                Text(
                  'Skeniranja su informativnog karaktera i ne zamjenjuju profesionalni pregled.',
                  style: TextStyle(fontSize: 14, color: Colors.black),
                ),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
