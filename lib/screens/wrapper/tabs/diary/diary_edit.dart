import 'package:flutter/material.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/providers/diary_provider.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/resources/databases/diary_database.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/resources/models/diary_model.dart';
import 'package:provider/provider.dart';

class EditDiaryScreen extends StatelessWidget {
  final DiaryModel diary;

  const EditDiaryScreen(this.diary, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiaryProvider(diary: diary),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: const Text('Edit Diary'),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Perasaan saya sekarang:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Container(
              padding: const EdgeInsets.all(10),
              height: 45,
              decoration: BoxDecoration(
                border: Border.all(width: 1.5, color: Colors.pink[200]!),
                borderRadius: BorderRadius.circular(3),
              ),
              child: Consumer<DiaryProvider>(
                builder: (_, DiaryProvider diaryProvider, __) {
                  return DropdownButtonFormField<String>(
                    value: diaryProvider.feeling,
                    isDense: true,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    iconEnabledColor: Colors.black,
                    decoration: const InputDecoration.collapsed(
                      hintText: 'Bagaimana perasaan anda?',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    selectedItemBuilder: (_) {
                      return List.generate(
                        diaryProvider.feelings.length,
                        (index) {
                          return Text(
                            'Merasa ' + diaryProvider.feelings[index],
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          );
                        },
                      );
                    },
                    items: List.generate(
                      diaryProvider.feelings.length,
                      (index) {
                        return DropdownMenuItem<String>(
                          value: diaryProvider.feelings[index],
                          child: Text(
                            'Merasa ' + diaryProvider.feelings[index],
                            style: const TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                    onChanged: (String? value) {
                      diaryProvider.feeling = value!;
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 8.0),
            const Text(
              'Catatan saya hari ini:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 8.0),
            Consumer<DiaryProvider>(
              builder: (context, diaryProvider, child) {
                return TextFormField(
                  controller: diaryProvider.noteController,
                  maxLines: 5,
                  keyboardType: TextInputType.multiline,
                  validator: (text) {},
                  decoration: InputDecoration(
                    hintText: 'Tuliskan catatan disini',
                    contentPadding: const EdgeInsets.all(10.0),
                    border: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.pink[200]!,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.pink[200]!,
                      ),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.5,
                        color: Colors.pink[200]!,
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 8.0),
            Consumer<DiaryProvider>(
              builder: (_, diaryProvider, __) {
                return ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Colors.pink[200]!,
                    ),
                  ),
                  onPressed: () async {
                    if (diaryProvider.feeling != null &&
                        diaryProvider.noteController.text.isNotEmpty) {
                      await DiaryDatabase().update(
                        diary.docId!,
                        data: DiaryModel(
                          feeling: diaryProvider.feeling,
                          note: diaryProvider.noteController.text,
                          datePost: DateTime.now(),
                        ).toData(),
                      );
                      Navigator.of(context).pop();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Inputan harus terisi semua!'),
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Edit',
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
