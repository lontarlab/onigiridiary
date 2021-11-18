import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:onigiridiary/screens/wrapper/tabs/tips/resources/models/tips_model.dart';

class TipsDatabase {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String collectionPath = 'tips';

  Future create(TipsModel tipsModel) async {
    await firestore.collection(collectionPath).doc().set(
          tipsModel.toData(),
        );
  }

  Stream<QuerySnapshot<TipsModel>> streamDiary({
    String? status,
  }) {
    return firestore
        .collection(collectionPath)
        .orderBy('datePost', descending: true)
        .withConverter<TipsModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return TipsModel.fromData(snapshot);
      },
      toFirestore: (TipsModel model, _) {
        return model.toData();
      },
    ).snapshots();
  }

  Future<QuerySnapshot<TipsModel>> readDiaries() async {
    return await firestore.collection(collectionPath).withConverter<TipsModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return TipsModel.fromData(snapshot);
      },
      toFirestore: (TipsModel model, _) {
        return model.toData();
      },
    ).get();
  }

  Future<DocumentSnapshot<TipsModel>> readDiary(String docId) async {
    return await firestore
        .collection(collectionPath)
        .doc(docId)
        .withConverter<TipsModel>(
      fromFirestore: (DocumentSnapshot<Map<String, dynamic>> snapshot, _) {
        return TipsModel.fromData(snapshot);
      },
      toFirestore: (TipsModel model, _) {
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
