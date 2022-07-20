import 'dart:ffi';

import 'package:get/get.dart';

class AppController extends GetxController {
  dynamic historyList = [].obs;

  int get historyListLength => historyList.length;

  void addHistiry(String textSpeech, String translatedSpeech) {
    historyList.add({
      "textSpeech": textSpeech,
      "translatedSpeech": translatedSpeech,
    });
  }
}
