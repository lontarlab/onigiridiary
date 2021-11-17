import 'package:flutter/material.dart';
import 'package:onigiridiary/screens/splash/providers/splash_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => SplashProvider(context),
      child: Scaffold(
        body: Consumer<SplashProvider>(
          builder: (context, splashProvider, child) {
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    'assets/images/onigiri_diary_bg.png',
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Center(
                    child: Image(
                      image: AssetImage('assets/images/onigiri_diary_logo.png'),
                      width: 200,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.event),
                      Text(
                        "Your cute simple jurnal.",
                        style: TextStyle(
                          fontFamily: 'IndieFlower',
                          fontSize: 20,
                        ),
                      )
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
