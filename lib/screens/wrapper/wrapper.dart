import 'package:flutter/material.dart';
import 'package:onigiridiary/screens/wrapper/providers/wrapper_provider.dart';
import 'package:onigiridiary/screens/wrapper/tabs/beranda/beranda.dart';
import 'package:onigiridiary/screens/wrapper/tabs/diary/diary.dart';
import 'package:onigiridiary/screens/wrapper/tabs/kalender/kalender.dart';
import 'package:onigiridiary/screens/wrapper/tabs/tips/tips.dart';
import 'package:provider/provider.dart';

class WrapperScreen extends StatelessWidget {
  const WrapperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => WrapperProvider(),
      child: Consumer<WrapperProvider>(
        builder: (context, wrapperProvider, child) {
          return Scaffold(
            body: PageView(
              controller: wrapperProvider.pageController,
              onPageChanged: (index) {
                wrapperProvider.currentIndex = index;
              },
              children: const [
                HomeScreen(),
                DiaryScreen(),
                CalenderScreen(),
                TipsScreen(),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: wrapperProvider.currentIndex,
              onTap: (index) {
                wrapperProvider.currentIndex = index;
                wrapperProvider.pageController.jumpToPage(index);
                debugPrint(index.toString());
              },
              type: BottomNavigationBarType.fixed,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Beranda',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.menu_book,
                  ),
                  label: 'Diary',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.event,
                  ),
                  label: 'Kalender',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.wb_sunny,
                  ),
                  label: 'Tips',
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
