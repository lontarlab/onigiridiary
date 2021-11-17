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
            appBar: AppBar(
              backgroundColor: Colors.red[100],
              title: Image.asset(
                'assets/images/onigiri_diary_logo.png',
                height: 50,
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.event,
                    color: Colors.pink[200],
                  ),
                ),
              ],
            ),
            body: PageView(
              controller: wrapperProvider.pageController,
              onPageChanged: (index) {
                wrapperProvider.currentIndex = index;
              },
              children: const [
                HomeScreen(),
                DiaryScreen(),
                TipsScreen(),
                CalenderScreen(),
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
              items: [
                BottomNavigationBarItem(
                  label: 'Beranda',
                  icon: const Icon(Icons.home),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.pink[200],
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Diary',
                  icon: const Icon(
                    Icons.menu_book,
                  ),
                  activeIcon: Icon(
                    Icons.menu_book,
                    color: Colors.pink[200],
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Tips',
                  icon: const Icon(
                    Icons.wb_sunny,
                  ),
                  activeIcon: Icon(
                    Icons.wb_sunny,
                    color: Colors.pink[200],
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Kalender',
                  icon: const Icon(
                    Icons.event,
                  ),
                  activeIcon: Icon(
                    Icons.event,
                    color: Colors.pink[200],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
