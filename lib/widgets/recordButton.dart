import 'package:edvive_task1_syed_mahamudul_hasan/models/appcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class RecorderButton extends StatelessWidget {
  RecorderButton(
      {Key? key,
      required this.color,
      required this.iconData,
      this.onClick,
      this.speechText,
      this.TranslateText})
      : super(key: key);
  final Color color;
  final IconData iconData;
  final speechText;
  final TranslateText;
  final Future<void>? onClick;

  final AppController _appController = Get.put(AppController());
  String formattedDate =
      DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: RawMaterialButton(
        onPressed: () {
          if (speechText != null && TranslateText != null) {
            _appController.addHistiry(speechText, TranslateText, formattedDate);
          }

          onClick;
        },
        fillColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        child: Icon(iconData),
      ),
    );
  }
}
