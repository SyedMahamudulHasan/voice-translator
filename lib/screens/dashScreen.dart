import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:edvive_task1_syed_mahamudul_hasan/screens/translatorScreen.dart';
import 'package:flutter/material.dart';
import 'homeScreem.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  int _page = 0;
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  final List<Widget> screens = const [
    HomeScreen(),
    TranslatorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          items: const [
            Icon(
              Icons.home_outlined,
              size: 30,
            ),
            Icon(
              Icons.mic,
              size: 30,
            ),
          ],
          onTap: (index) {
            // final navBarState = _bottomNavigationKey.currentState;
            // navBarState?.setPage(index);
            setState(() {
              _page = index;
            });
          },
        ),
        appBar: AppBar(
          title: const Text("Flutter Translator"),
        ),
        body: screens[_page]);
  }
}
