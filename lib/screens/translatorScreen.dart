// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:translator/translator.dart';

import '../widgets/choose_language.dart';
import '../widgets/recordButton.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({Key? key}) : super(key: key);

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  final _speech = stt.SpeechToText();
  Timer? _timer;
  String? _speechText;

  final translator = GoogleTranslator();
  var _translation;
  bool _isTranlated = false;

  @override
  void initState() {
    super.initState();
    _initSpeech();
  }

  @override
  void deactivate() {
    _timer?.cancel();
    _speech.cancel();
    _speech.stop();
    super.deactivate();
  }

  /// initiating  speech to talk
  Future<void> _initSpeech() async {
    bool available = await _speech.initialize(
        onStatus: _statusListener, onError: _errorListener);

    if (available) {
      _startTimer();
      _startListening();
    } else {
      print('Something went wrong');
    }
  }

  ///printing some status and error msg from initspeech.
  void _errorListener(SpeechRecognitionError error) {
    print("${error.errorMsg} - ${error.permanent}");
  }

  void _statusListener(String status) {
    print("status - $status");
  }

  /// Each time to start a speech recognition session
  Future<void> _startListening() async {
    await _speech.listen(onResult: _onSpeechResult, localeId: 'en');
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    if (!result.finalResult && _speech.lastStatus != "notListening") {
      _startTimer();
    }
    setState(() {
      _speechText = result.recognizedWords;
      print(_speechText);
    });
  }

  ///using timer to recoall the speech and stop it dynamicaly.
  _startTimer() {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 3) {
        timer.cancel();
        _speech.stop();
        _translateSpeech();
      }
    });
  }

// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  Future<void> _stopListening() async {
    await _speech.stop();
    setState(() {});
  }

  ///translating what we record from mic.
  Future<void> _translateSpeech() async {
    ///show snackbar if error
    if (_speechText == null) {
      Get.snackbar('Error Message',
          'Plsease reload the page and speek what you need to translate',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.tealAccent);
    }
    _translation = await translator.translate(
        _speechText ?? "Sorry i didn't hear you.",
        from: 'en',
        to: 'bn');
    setState(() {
      _translation;
      // _translateProvider?.isTranslating = true;
      _isTranlated = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ///===============================================> speek text
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            padding: const EdgeInsets.only(
              left: 16.0,
              right: 16.0,
              top: 16.0,
              bottom: 20.0,
            ),
            child: Text(
              _speechText ?? "Listening...",
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w300,
                fontSize: 22,
              ),
            ),
          ),
          const Divider(
            height: 10,
          ),

          ///===================================================> translated text
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.15,
            padding: const EdgeInsets.only(
                left: 16.0, right: 16.0, top: 16.0, bottom: 20.0),
            child: Text(
              _isTranlated ? _translation.toString() : "Translating...",
              style: const TextStyle(
                color: Colors.black54,
                fontWeight: FontWeight.w300,
                fontSize: 22,
              ),
            ),
          ),
          const ChooseLanguage(),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.10,
          ),

          ///=========================================================> bottom button
          _speech.isNotListening
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RecorderButton(
                      iconData: Icons.mic_off,
                      color: Colors.green.shade900.withOpacity(0.5),
                      onClick: _stopListening,
                    ),
                    RecorderButton(
                      color: Colors.grey.shade100,
                      iconData: Icons.history_outlined,
                      speechText: _speechText,
                      TranslateText: _translation.toString(),
                    )
                  ],
                )
              : RecorderButton(
                  iconData: Icons.mic,
                  color: Colors.deepOrangeAccent.shade700.withOpacity(0.5),
                  onClick: _startListening,
                ),
        ],
      ),
    );
  }
}
