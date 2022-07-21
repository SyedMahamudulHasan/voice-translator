import 'package:edvive_task1_syed_mahamudul_hasan/models/appcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  HistoryScreen({Key? key}) : super(key: key);

  final AppController _appController = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(body: Obx(() {
      return _appController.historyListLength == 0

          ///=======================================================>empty list ui part
          ? const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Hey Buddy!, I can translate whatever you say, but you didn't say something..",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            )

          ///=======================================================>showing the hestory list
          : ListView.builder(
              itemCount: _appController.historyListLength,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  width: size.width,
                  // height: size.height * 0.20,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(_appController.historyList[index]['textSpeech']),
                        Text(_appController.historyList[index]
                            ['translatedSpeech']),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    subtitle: Row(
                      children: [
                        const Text('English to Bangla'),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(_appController.historyList[index]['time']),
                      ],
                    ),
                    trailing: const Icon(Icons.star_border_outlined),
                  ),
                );
              });
    }));
  }
}
