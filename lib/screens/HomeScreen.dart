import 'package:edvive_task1_syed_mahamudul_hasan/widgets/botton_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/choose_language.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottonNavBar(),
      appBar: AppBar(
        title: const Text("Flutter Translator"),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text('Enter Text'),
            ),
          ),
          Expanded(child: Text('Output')),
          const ChooseLanguage(),
          Expanded(child: Text('Speaker')),
        ],
      ),
    );
  }
}
