import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class BottonNavBar extends StatelessWidget {
  const BottonNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedNavigationBar(
      items: const [
        Icon(
          Icons.home_outlined,
          size: 30,
        ),
        Icon(
          Icons.record_voice_over_sharp,
          size: 30,
        ),
      ],
      onTap: (index) {
        print(index);
      },
    );
  }
}
