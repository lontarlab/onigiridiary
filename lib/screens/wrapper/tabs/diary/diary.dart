import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/diary_tambah.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/providers/diary_provider.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/resources/models/diary_model.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/resources/databases/diary_database.dart';
import 'package:provider/provider.dart';

class DiaryScreen extends StatelessWidget {
  const DiaryScreen({Key? key}) : super(key: key);

  Widget _buildListDiary(DiaryModel diary) {
    return Card(
      color: Colors.amber[50],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Consumer<DiaryProvider>(
                  builder: (_, diaryProvider, __) {
                    return Image.asset(
                      diaryProvider.fillingImage(diary.feeling),
                      width: 60,
                    );
                  },
                ),
                Text(
                  diary.feeling!,
                  style: const TextStyle(
                    color: Colors.pink,
                  ),
                ),
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.yellow[700],
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                      children: [
                        const Text(
                          'Waktu',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            ': ${diary.datePost}',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
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
                      children: [
                        Text(
                          'Lokasi',
                          style: TextStyle(
                            color: Colors.purple[700],
                          ),
                        ),
                        const SizedBox(width: 16.0),
                        Expanded(
                          child: Text(
                            ': Unknown',
                            style: TextStyle(
                              color: Colors.purple[800],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    diary.note!,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.pink,
                      fontFamily: 'IndieFlower',
                      fontSize: 18,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiaryProvider(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                'assets/images/onigiri_diary_bg.png',
              ),
            ),
          ),
          child: StreamBuilder<QuerySnapshot<DiaryModel>>(
            stream: DiaryDatabase().streamDiary(),
            builder: (_, snapshot) {
              if (!snapshot.hasData) {
                return const Center(child: Text('loading...'));
              }
              List<DocumentSnapshot<DiaryModel>> listDiary =
                  snapshot.data!.docs;
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: listDiary.length,
                itemBuilder: (_, index) {
                  DiaryModel diary = listDiary[index].data()!;
                  return _buildListDiary(diary);
                },
              );
            },
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.pink[200],
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => const AddDiaryScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}
