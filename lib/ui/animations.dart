import 'dart:math';
import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' hide Colors;
import 'package:auto_size_text/auto_size_text.dart';


class AnimateText extends StatefulWidget {

  final String text;
  AnimateText({ Key key , this.text}) : super(key : key);

  @override
  _AnimateTextState createState() => _AnimateTextState();
}

class _AnimateTextState extends State<AnimateText>
    with SingleTickerProviderStateMixin {
      
  Animation animation;
  AnimationController controller;

   @override
  void didUpdateWidget(AnimateText oldWidget) {
    if(widget.text == "\$0")
    controller.reset();
    controller.forward();
    super.didUpdateWidget(oldWidget);
  }

  @override
  void initState() {
    super.initState();
    controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..addListener(() => setState(() {}));
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translation(getTranslation()),
      child: AutoSizeText(
        widget.text,
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 100.0, color: Colors.white),
        maxLines: 1,
      ),
      /*your layout widget here*/
    );
  }
  Vector3 getTranslation() {
  double progress = controller.value;
  double offset = sin(progress * pi * 10);
  return Vector3(offset, 0.0, 0.0);
}
@override
  void dispose() {
    super.dispose();
    controller.dispose();
  }
}
