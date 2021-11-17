import 'package:cloud_firestore/cloud_firestore.dart';

class DiaryModel {
  final String? felling;
  final String? note;
  final DateTime? datePost;

  DiaryModel({
    this.felling,
    this.note,
    this.datePost,
  });

  factory DiaryModel.fromData(DocumentSnapshot doc) {
    return DiaryModel(
      felling: doc.get('felling'),
      note: doc.get('note'),
      datePost: doc.get('datePost'),
    );
  }

  Map<String, dynamic> toData() {
    return {
      'felling': felling,
      'note': note,
      'datePost': datePost,
    };
  }
}
