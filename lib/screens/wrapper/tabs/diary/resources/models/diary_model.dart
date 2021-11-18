import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryModel {
  final String? feeling;
  final String? note;
  final DateTime? datePost;

  DiaryModel({
    this.feeling,
    this.note,
    this.datePost,
  });

  factory DiaryModel.fromData(DocumentSnapshot doc) {
    return DiaryModel(
      feeling: doc.get('feeling'),
      note: doc.get('note'),
      datePost: doc.get('datePost').toDate(),
    );
  }

  Map<String, dynamic> toData() {
    return {
      'feeling': feeling,
      'note': note,
      'datePost': datePost,
    };
  }
}
