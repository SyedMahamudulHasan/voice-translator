// ignore_for_file: avoid_print

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_error.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import '../models/appcontroller.dart';
import '../widgets/choose_language.dart';

class TranslatorScreen extends StatefulWidget {
  const TranslatorScreen({Key? key}) : super(key: key);

  @override
  State<TranslatorScreen> createState() => _TranslatorScreenState();
}

class _TranslatorScreenState extends State<TranslatorScreen> {
  TranslateProvider? _translateProvider;
  final _speech = stt.SpeechToText();
  Timer? _timer;
  String? _speechText;

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

  Future<void> _initSpeech() async {
    bool available = await _speech.initialize(
        onStatus: _statusListener, onError: _errorListener);

    if (available) {
      // _startTimer();
      _startListening();
    } else {
      print('Something went wrong');
    }
  }

  void _errorListener(SpeechRecognitionError error) {
    print("${error.errorMsg} - ${error.permanent}");
  }

  void _statusListener(String status) {
    print(status);
  }

  Future<void> _startListening() async {
    await _speech.listen(
        onResult: _onSpeechResult,
        localeId: _translateProvider?.firstLanguage.code);
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    if (!result.finalResult && _speech.lastStatus != "notListening") {
      _startTime();
    }
    setState(() {
      _speechText = result.recognizedWords;
      print(_speechText);
    });
  }

  _startTime() {
    if (_timer != null) {
      _timer?.cancel();
    }
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick == 3) {
        timer.cancel();
        _speech.stop();
        //Navigator.pop(context, _speechText);
      }
    });
  }

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
              child: Text(
                _speechText ?? "Talk Now",
                style: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w300,
                  fontSize: 22,
                ),
              ),
            ),
          ),
          Container(),
          const ChooseLanguage(),
          RecordButton()
        ],
      ),
    );
  }
}
