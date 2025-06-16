import 'dart:io';
import 'package:derma_scan/src/components/custom_button.dart';
import 'package:derma_scan/src/components/custom_webview.dart';
import 'package:derma_scan/src/constants/color.dart';
import 'package:derma_scan/src/data/db/db_helper.dart';
import 'package:derma_scan/src/helpers/shared_preferences.dart';
import 'package:derma_scan/src/modules/history/history_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../components/custom_appbar.dart';
import '../../data/models/response/mole_prediction_response_model.dart';

class ResultScreen extends StatefulWidget {
  final MolePredictionResponse? result;
  final File? imageFile;

  ResultScreen({Key? key, this.result, this.imageFile}) : super(key: key);

  @override
  ResultScreenState createState() => ResultScreenState();
}

class ResultScreenState extends State<ResultScreen> {
  late String formattedDate;

  @override
  void initState() {
    super.initState();
    formattedDate = DateFormat('yyyy-MM-dd HH:mm').format(DateTime.now());
  }

  void _saveScan() async {
    final db = await DBHelper().database;
    List<Map<String, dynamic>> groups = await db.query('groups');
    final List<String> groupList =
        groups.map((g) => g['name'] as String).toList();

    bool useExistingGroup = groupList.isNotEmpty;
    final TextEditingController newGroupController = TextEditingController();
    final TextEditingController noteController = TextEditingController();
    String? selectedGroup;
    final prediction = widget.result?.result ?? 'Unknown';
    final probability = (widget.result?.confidence ?? 0).toStringAsFixed(2);

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Sačuvaj skeniranje'),
          content: StatefulBuilder(
            builder: (context, setModalState) {
              return SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (groupList.isNotEmpty)
                      SwitchListTile(
                        title: const Text(
                          'Koristi postojeći album',
                          style: TextStyle(fontSize: 12),
                        ),
                        value: useExistingGroup,
                        activeTrackColor: ColorConstants.primary,
                        onChanged: (val) {
                          setModalState(() => useExistingGroup = val);
                        },
                      ),
                    if (useExistingGroup && groupList.isNotEmpty)
                      DropdownButtonFormField<String>(
                        value: selectedGroup,
                        hint: const Text('Odaberite album'),
                        items: groupList.map((group) {
                          return DropdownMenuItem(
                            value: group,
                            child: Text(group),
                          );
                        }).toList(),
                        onChanged: (val) {
                          setModalState(() => selectedGroup = val);
                        },
                      )
                    else
                      TextField(
                        controller: newGroupController,
                        decoration:
                            const InputDecoration(labelText: 'Novi album'),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      'Put slike:\n${widget.imageFile?.path ?? 'N/A'}',
                      style: const TextStyle(fontSize: 12),
                    ),
                    const SizedBox(height: 8),
                    TextField(
                      controller: noteController,
                      decoration: const InputDecoration(labelText: 'Napomena'),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text(
                'Otkaži',
                style: TextStyle(color: Colors.black),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                final group = useExistingGroup
                    ? selectedGroup
                    : newGroupController.text.trim();
                final note = noteController.text.trim();

                if (group == null || group.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Molimo unesite naziv albuma')),
                  );
                  return;
                }

                // Save to shared preferences
                if (widget.imageFile?.path != null) {
                  await SharedPreferencesHelper.saveImagePath(
                      widget.imageFile!.path);
                }

                // Get group ID (or insert new group)
                int groupId;
                final existing = await db
                    .query('groups', where: 'name = ?', whereArgs: [group]);
                if (existing.isNotEmpty) {
                  groupId = existing.first['id'] as int;
                } else {
                  groupId = await db.insert('groups', {
                    'name': group,
                    'created_at': DateTime.now().toIso8601String(),
                  });
                }

                // Insert image entry
                await db.insert('images', {
                  'group_id': groupId,
                  'path': widget.imageFile?.path ?? '',
                  'note': note,
                  'date': DateTime.now().toIso8601String(),
                  'result': '$prediction ($probability%)',
                });

                Navigator.pop(context);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryScreen(),
                    ));

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Skeniranje je uspješno sačuvano')),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: ColorConstants.secondary),
              child: Text(
                'Sačuvaj',
                style: TextStyle(color: ColorConstants.primary),
              ),
            ),
          ],
        );
      },
    );
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
    final prediction = widget.result?.result ?? 'Unknown';
    final probability = (widget.result?.confidence ?? 0).toStringAsFixed(2);

    return Scaffold(
      appBar: CustomAppBar(title: 'Rezultat'),
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
              if (widget.imageFile != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(widget.imageFile!),
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
                  color: prediction.toLowerCase() == 'malignant'
                      ? Colors.red
                      : Colors.green,
                ),
              ),
              const SizedBox(height: 24),
              const Text(
                'Važna napomoena:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const Text(
                'Skeniranja su informativnog karaktera i ne zamjenjuju profesionalni pregled.',
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebviewComponent(
                            'https://www.skincancer.org/skin-cancer-information/melanoma/',
                            '',
                            100)),
                  );
                },
                child: const Text(
                  'Saznajte o znakovima malignih madeža',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Sačuvaj skeniranje',
                isActive: true,
                textColor: ColorConstants.primary,
                bodyColor: ColorConstants.secondary,
                buttonWidth: MediaQuery.of(context).size.width - 90,
                function: _saveScan,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
