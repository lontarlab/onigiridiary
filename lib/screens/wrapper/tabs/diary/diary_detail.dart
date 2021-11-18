import 'package:flutter/material.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/providers/diary_provider.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/resources/models/diary_model.dart';
import 'package:provider/provider.dart';

class DetailDiaryScreen extends StatelessWidget {
  final DiaryModel diary;

  const DetailDiaryScreen(this.diary, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiaryProvider(),
      child: Scaffold(
        body: Container(
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/onigiri_diary_bg.png',
              ),
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Consumer<DiaryProvider>(
                    builder: (context, diaryProvider, child) {
                      return Image.asset(
                          diaryProvider.fillingImage(diary.feeling));
                    },
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3.0,
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.pink[300],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Text(
                      '${diary.feeling}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3.0,
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple[400],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Waktu',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          ': ${diary.datePost}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 3.0,
                      horizontal: 8.0,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.purple[100],
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Lokasi',
                          style: TextStyle(
                            color: Colors.purple[700],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Text(
                          ': Unknown',
                          style: TextStyle(
                            color: Colors.purple[800],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    '${diary.note}',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.amber[900]!,
                      fontFamily: 'IndieFlower',
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
