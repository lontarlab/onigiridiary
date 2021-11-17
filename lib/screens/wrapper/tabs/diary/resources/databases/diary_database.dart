import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/resources/models/diary_model.dart';

class DiaryDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collectionPath = 'diaries';

  Future create(DiaryModel diaryModel) async {
    await firestore.collection(collectionPath).doc().set(
          diaryModel.toData(),
        );
  }

  Stream<QuerySnapshot<DiaryModel>> streamDiary({
    String? status,
  }) {
    return firestore
        .collection(collectionPath)
        .orderBy('datePost', descending: true)
        .withConverter<DiaryModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return DiaryModel.fromData(snapshot);
      },
      toFirestore: (DiaryModel model, _) {
        return model.toData();
      },
    ).snapshots();
  }

  Future<QuerySnapshot<DiaryModel>> readDiaries() async {
    return await firestore.collection(collectionPath).withConverter<DiaryModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return DiaryModel.fromData(snapshot);
      },
      toFirestore: (DiaryModel model, _) {
        return model.toData();
      },
    ).get();
  }

  Future<DocumentSnapshot<DiaryModel>> readDiary(String docId) async {
    return await firestore
        .collection(collectionPath)
        .doc(docId)
        .withConverter<DiaryModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return DiaryModel.fromData(snapshot);
      },
      toFirestore: (DiaryModel model, _) {
        return model.toData();
      },
    ).get();
  }

  Future update(
    String docId, {
    required Map<String, dynamic> data,
  }) async {
    return await firestore.collection(collectionPath).doc(docId).update(data);
  }

  Future delete(String docId) async {
    return await firestore.collection(collectionPath).doc(docId).delete();
  }
}
