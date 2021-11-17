import 'package:flutter/material.dart';

class TipsScreen extends StatelessWidget {
  const TipsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(
              'assets/images/onigiri_diary_bg.png',
            ),
          ),
        ),
        child: const Center(
          child: Text('Tips'),
        ),
      ),
    );
  }
}
