import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:onigiridiary/screens/splash/splash.dart';
import 'package:onigiridiary/screens/wrapper/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
