import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class RecorderButton extends StatefulWidget {
  const RecorderButton({Key? key, required this.color, required this.iconData})
      : super(key: key);
  final Color color;
  final IconData iconData;

  @override
  State<RecorderButton> createState() => _RecorderButtonState();
}

class _RecorderButtonState extends State<RecorderButton> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: widget.color,
      ),
      child: RawMaterialButton(
        onPressed: () {},
        fillColor: Colors.white,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        child: Icon(widget.iconData),
      ),
    );
  }
}

//Color.fromARGB(255, 98, 93, 93),