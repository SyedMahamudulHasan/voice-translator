import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);

  @override
  State<ChooseLanguage> createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  final _firstLanguage = "English";
  final _secondLanguage = "Bangla";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.10,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          bottom: BorderSide(
            width: 0.5,
            color: Colors.grey.shade500,
          ),
        ),
      ),
      child: Row(
        children: [
          languageButton(_firstLanguage),
          Material(
            color: Colors.white,
            child: IconButton(
              icon: Icon(
                Icons.compare_arrows,
                color: Colors.grey.shade700,
              ),
              onPressed: () {
                Get.snackbar(
                    'Error message', 'Language switching is comeing soon...',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Colors.tealAccent);
              },
            ),
          ),
          languageButton(_secondLanguage)
        ],
      ),
    );
  }

  Expanded languageButton(String language) {
    return Expanded(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Get.snackbar(
                'Error message', 'Language switching is comeing soon...',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.tealAccent);
          },
          child: Center(
            child: Text(
              language,
              style: TextStyle(
                color: Colors.blue.shade600,
                fontSize: 15.0,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
