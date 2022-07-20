import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade400,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
              top: 40,
              left: 15,
              right: 10,
            ),
            width: MediaQuery.of(context).size.width * 0.80,
            height: MediaQuery.of(context).size.height * 0.40,
            decoration: BoxDecoration(
              color: Colors.blue.shade400,
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(30),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                // ignore: unnecessary_const
                const Text.rich(
                  TextSpan(
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(text: 'Hello, '),
                      TextSpan(
                        text: 'Buddy',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "What can I translate for you today?",
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                ),
              ),
              // child: Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: [
              //     Row(
              //       children: [
              //         chooseMethod(),
              //         chooseMethod(),
              //       ],
              //     ),
              //     Row(
              //       children: [
              //         chooseMethod(),
              //         chooseMethod(),
              //       ],
              //     ),
              //   ],
              // ),
            ),
          )
        ],
      ),
    );
  }

  InkWell chooseMethod() {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 100,
        width: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.blueAccent,
            )),
        child: Column(children: [
          Image.network('https://static.thenounproject.com/png/66759-200.png'),
          const Text('Text')
        ]),
      ),
    );
  }
}
