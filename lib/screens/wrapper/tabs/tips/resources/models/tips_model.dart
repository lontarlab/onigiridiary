import 'package:cloud_firestore/cloud_firestore.dart';

class TipsModel {
  final String? title;
  final String? content;
  final DateTime? datePost;

  TipsModel({
    this.title,
    this.content,
    this.datePost,
  });

  factory TipsModel.fromData(DocumentSnapshot doc) {
    return TipsModel(
      title: doc.get('title'),
      content: doc.get('content'),
      datePost: doc.get('datePost'),
    );
  }

  Map<String, dynamic> toData() {
    return {
      'title': title,
      'content': content,
      'datePost': datePost,
    };
  }
}
