import 'package:flutter/material.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/resources/models/diary_model.dart';

class DiaryProvider with ChangeNotifier {
  final DiaryModel? diary;

  DiaryProvider({this.diary}) {
    if (diary != null) {
      feeling = diary!.feeling!;
      noteController = TextEditingController(text: diary!.note!);
    }
  }

  List<String> get feelings => [
        'Senang',
        'Sedih',
        'Marah',
      ];

  String? _feeling;
  String? get feeling => _feeling;
  set feeling(String? newValue) {
    _feeling = newValue;
    notifyListeners();
  }

  TextEditingController _noteController = TextEditingController();
  TextEditingController get noteController => _noteController;
  set noteController(TextEditingController newValue) {
    _noteController = newValue;
    notifyListeners();
  }

  String fillingImage(String? feeling) {
    switch (feeling) {
      case 'Senang':
        return 'assets/images/onigiri_diary_senang.png';
      case 'Sedih':
        return 'assets/images/onigiri_diary_sedih.png';
      case 'Marah':
        return 'assets/images/onigiri_diary_marah.png';
      default:
        return 'assets/images/onigiri_diary_senyum.png';
    }
  }
}
