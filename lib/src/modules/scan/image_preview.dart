import 'dart:convert';
import 'package:derma_scan/src/components/custom_button.dart';
import 'package:derma_scan/src/components/custom_webview.dart';
import 'package:derma_scan/src/constants/color.dart';
import 'package:derma_scan/src/data/models/request/slika_update_request_model.dart';
import 'package:derma_scan/src/data/models/response/slika_response_model.dart';
import 'package:derma_scan/src/modules/history/history_screen.dart';
import 'package:derma_scan/src/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/custom_appbar.dart';

class PreviewOfImageScreen extends StatefulWidget {
  final String? imageId; // changed to string because API uses string ID

  PreviewOfImageScreen({Key? key, this.imageId}) : super(key: key);

  @override
  PreviewOfImageScreenState createState() => PreviewOfImageScreenState();
}

class PreviewOfImageScreenState extends State<PreviewOfImageScreen> {
  String formattedDate = '';
  String note = '';
  String prediction = '';
  String? imageBaseEncoded;
  bool isFromSavedImage = false;
  final TextEditingController _noteController = TextEditingController();
  bool isEditEnabled = false;

  final ImageService imageService = ImageService();

  @override
  void initState() {
    super.initState();

    if (widget.imageId != null) {
      _loadImageDetails(widget.imageId!);
      isFromSavedImage = true;
    }
  }

  Future<void> _loadImageDetails(String id) async {
    try {
      final SlikaResponse image = await imageService.getSlikaById(id);
      setState(() {
        prediction = image.rezultat ?? '';
        note = image.opis ?? '';
        imageBaseEncoded = image.slikaBaseEncoded;
        formattedDate = _formatDate(image.datumKreiranja);
        _noteController.text = note;
      });
    } catch (e) {
      debugPrint("Error loading image details: $e");
    }
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

  Future<void> _confirmUpdateNote() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Ažuriraj napomenu'),
        content:
            const Text('Jeste li sigurni da želite ažurirati ovu napomenu?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text(
                'Otkaži',
                style: TextStyle(color: Colors.black),
              )),
          ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.secondary),
              child: const Text(
                'Ažuriraj',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );

    if (confirmed == true && widget.imageId != null) {
      try {
        var model = SlikaUpdateRequest(opis: _noteController.text.trim());
        await imageService.updateSlika(widget.imageId!, model);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Note updated successfully')),
        );
        setState(() {
          isEditEnabled = false;
          note = _noteController.text.trim();
        });
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Error while updating, please try again.')),
        );
        setState(() {
          isEditEnabled = false;
        });
      }
    }
  }

  Future<void> _confirmDeleteImage() async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Obriši sliku'),
        content: const Text('Jeste li sigurni da želite obrisati sliku?'),
        actions: [
          TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: const Text(
                'Otkaži',
                style: TextStyle(color: Colors.black),
              )),
          ElevatedButton(
              onPressed: () => Navigator.pop(context, true),
              style:
                  ElevatedButton.styleFrom(backgroundColor: Colors.redAccent),
              child: const Text(
                'Obriši',
                style: TextStyle(color: Colors.white),
              )),
        ],
      ),
    );

    if (confirmed == true && widget.imageId != null) {
      try {
        await imageService.deleteSlika(widget.imageId!);
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Scan deleted')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Error while deleting image, please try again.')),
        );
      }
    }
  }

  String getPredictionResultWord(String rawPrediction) {
    if (rawPrediction.toLowerCase().contains('benign')) {
      return 'Nisu uočeni znaci zabrinutosti';
    } else if (rawPrediction.toLowerCase().contains('malignant')) {
      return 'Preporučuje se konsultacija sa ljekarom';
    }
    return 'Nepoznati rezultat';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Detalji skeniranja'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Datum: $formattedDate',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold)),
              const SizedBox(height: 16),
              if (imageBaseEncoded != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.memory(
                    base64Decode(imageBaseEncoded!),
                    fit: BoxFit.cover,
                  ),
                ),
              const SizedBox(height: 16),
              const Text(
                'Rezultat predviđanja:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                getPredictionResultWord(prediction),
                style: TextStyle(
                  fontSize: 16,
                  color: prediction.toLowerCase().contains('malignant')
                      ? Colors.red
                      : Colors.green,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Važna napomena:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        setState(() {
                          isEditEnabled = !isEditEnabled;
                        });
                      },
                      icon: Icon(
                        isEditEnabled ? Icons.cancel : Icons.edit,
                        color: isEditEnabled ? Colors.redAccent : Colors.black,
                      ))
                ],
              ),
              TextField(
                controller: _noteController,
                enabled: isEditEnabled,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Enter note...',
                ),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => WebviewComponent(
                        'https://www.skincancer.org/skin-cancer-information/melanoma/',
                        '',
                        100,
                      ),
                    ),
                  );
                },
                child: const Text(
                  'Saznajte o znakovima malignih madeža',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 24),
              if (isFromSavedImage)
                Row(
                  children: [
                    isEditEnabled
                        ? Expanded(
                            child: CustomButton(
                              text: 'Ažuriraj',
                              isActive: isEditEnabled,
                              textColor: Colors.white,
                              bodyColor: ColorConstants.secondary,
                              buttonWidth: MediaQuery.of(context).size.width,
                              function: _confirmUpdateNote,
                            ),
                          )
                        : const SizedBox.shrink(),
                    const SizedBox(width: 12),
                    Expanded(
                      child: CustomButton(
                        text: 'Obriši',
                        isActive: true,
                        textColor: Colors.white,
                        bodyColor: Colors.redAccent,
                        buttonWidth: MediaQuery.of(context).size.width,
                        function: _confirmDeleteImage,
                      ),
                    ),
                  ],
                )
            ],
          ),
        ),
      ),
    );
  }
}
