import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edvive_task1_syed_mahamudul_hasan/screens/homeScreem.dart';
import 'package:edvive_task1_syed_mahamudul_hasan/screens/translatorScreen.dart';
import 'package:flutter/material.dart';

class BottonNavBar extends StatelessWidget {
  BottonNavBar({Key? key}) : super(key: key);

  final int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> screens = const [
    HomeScreen(),
    TranslatorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      key: _bottomNavigationKey,
      items: const [
        Icon(
          Icons.home_outlined,
          size: 30,
        ),
        Icon(
          Icons.record_voice_over_sharp,
          size: 30,
        ),
      ],
      onTap: (index) {
        print(index);
        if (index == 0) {
          Navigator.pushNamed(context, '/translator');
        } else {
          Navigator.pop(context);
        }
      },
    );
  }
}
