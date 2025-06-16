import 'dart:io';
import 'package:derma_scan/src/components/custom_button.dart';
import 'package:derma_scan/src/modules/scan/result_screen.dart';
import 'package:derma_scan/src/services/image_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../components/custom_appbar.dart';
import '../../constants/color.dart';

class TakePictureScreen extends StatefulWidget {
  @override
  _TakePictureScreenState createState() => _TakePictureScreenState();
}

class _TakePictureScreenState extends State<TakePictureScreen> {
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  bool loader = false;

  @override
  void initState() {
    super.initState();
    _openCamera();
  }

  Future<void> _openCamera() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        setState(() {
          _imageFile = File(pickedFile.path);
        });
      } else {
        Navigator.of(context).pop(); // User canceled camera
      }
    } catch (e) {
      print('Error opening camera: $e');
      Navigator.of(context).pop();
    }
  }

  Future<void> _analyzeImage() async {
    if (_imageFile != null) {
      setState(() {
        loader = true;
      });
      try {
        final result = await ImageService().sendImageForAnalyze(_imageFile!);
        setState(() {
          loader = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                result: result,
                imageFile: _imageFile,
              ),
            ));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Error analyzing image")),
        );
        setState(() {
          loader = false;
        });
      }
    }
  }

  void _retakeImage() {
    setState(() {
      _imageFile = null;
    });
    _openCamera();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Skeniraj mladež'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  "Pošaljite sliku na analizu ili skenirajte ponovo",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 40),
            _imageFile != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _imageFile!,
                      width: 300,
                      height: 300,
                      fit: BoxFit.cover,
                    ),
                  )
                : const CircularProgressIndicator(),
            const SizedBox(height: 70),
            if (_imageFile != null) ...[
              loader
                  ? const CircularProgressIndicator()
                  : Column(
                      children: [
                        CustomButton(
                          text: 'Analiziraj',
                          isActive: true,
                          textColor: ColorConstants.secondary,
                          bodyColor: ColorConstants.primary,
                          buttonWidth: MediaQuery.of(context).size.width - 90,
                          function: _analyzeImage,
                        ),
                        const SizedBox(height: 30),
                        CustomButton(
                          text: 'Ponovno skeniranje',
                          isActive: true,
                          textColor: ColorConstants.primary,
                          bodyColor: ColorConstants.secondary,
                          buttonWidth: MediaQuery.of(context).size.width - 90,
                          function: _retakeImage,
                        ),
                      ],
                    ),
            ],
          ],
        ),
      ),
    );
  }
}
