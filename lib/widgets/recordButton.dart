import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class RecordButton extends StatefulWidget {
  const RecordButton(
      {Key? key, required this.onPressed, required this.isActive})
      : super(key: key);
  final Function(bool) onPressed;
  final bool isActive;
  @override
  State<RecordButton> createState() => _RecordButtonState();
}

class _RecordButtonState extends State<RecordButton>
    with TickerProviderStateMixin {
  late Animation<double> _animation;
  late Animation<double> _animation2;
  late AnimationController _controller;
  late AnimationController _controller2;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _controller2 = AnimationController(
            vsync: this, duration: const Duration(seconds: 2))
          ..repeat();
        _animation2 =
            CurvedAnimation(parent: _controller2, curve: Curves.linear);
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }

  Widget _buttonWave(Animation<double> animation) {
    return Center(
      child: ScaleTransition(
        scale: animation,
        alignment: Alignment.center,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              width: 3,
              color: Colors.red,
              style: BorderStyle.solid,
            ),
          ),
          height: 140,
          width: 140,
        ),
      ),
    );
  }

  Widget _displaysButtonWave2() {
    if (widget.isActive && _animation2 != null) {
      return _buttonWave(_animation2);
    } else {
      return const SizedBox(
        height: 140,
        width: 140,
      );
    }
  }

  Widget _displaysButtonWave1() {
    if (widget.isActive && _animation != null) {
      return _buttonWave(_animation);
    } else {
      return const SizedBox(
        height: 140,
        width: 140,
      );
    }
  }

  Widget _displaysRecordingButton() {
    return Container(
      margin: EdgeInsets.only(top: 35),
      child: ButtonTheme(
        minWidth: 70.0,
        height: 70.0,
        child: ElevatedButton(
          onPressed: () {
            widget.onPressed(widget.isActive);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            elevation: widget.isActive ? null : 0,
            primary: widget.isActive ? Colors.red : const Color(0xFFededed),
          ),
          child: const Icon(
            Icons.mic,
            color: Colors.white,
            size: 40,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _displaysButtonWave1(),
        _displaysButtonWave2(),
        Center(
          child: _displaysRecordingButton(),
        ),
      ],
    );
  }
}
