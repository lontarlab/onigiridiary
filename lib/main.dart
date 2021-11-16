import 'package:flutter/material.dart';
import 'package:onigiridiary/screens/splash/splash.dart';
import 'package:onigiridiary/screens/wrapper/wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Onigiri Diary',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const SplashScreen(),
      onGenerateRoute: (settings) {
        // final arguments = settings.arguments!;
        switch (settings.name) {
          case 'wrapper':
            return MaterialPageRoute(builder: (context) {
              return const WrapperScreen();
            });
          default:
            return null;
        }
      },
    );
  }
}
