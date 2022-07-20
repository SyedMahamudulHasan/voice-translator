import 'package:edvive_task1_syed_mahamudul_hasan/widgets/botton_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../widgets/choose_language.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const BottonNavBar(),
        appBar: AppBar(
          title: const Text("Flutter Translator"),
        ),
        body: Column());
  }
}
