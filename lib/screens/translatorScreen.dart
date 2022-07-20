import 'package:flutter/material.dart';
import '../widgets/choose_language.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({Key? key}) : super(key: key);

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
