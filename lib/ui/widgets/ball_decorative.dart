import 'package:flutter/material.dart';
import 'package:my_fest/ui/style/pallete.dart';

class BallDecorative extends StatelessWidget {
  final double left;
  final double bottom;
  final double right;
  final double top;
  final double size;

  final Color firstColor;
  final Color secondColor;

  const BallDecorative(
      {super.key,
      required this.left,
      this.bottom = 0,
      required this.right,
      required this.top,
      required this.size,
      required this.firstColor,
      required this.secondColor});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left,
      bottom: bottom,
      right: right,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(100)),
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              firstColor,
              secondColor,
            ],
          ),
        ),
      ),
    );
    ;
  }
}
