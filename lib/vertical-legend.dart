import 'package:flutter/material.dart';

class Vlegend extends StatelessWidget {
  final Color? color;
  final String? text;
  final bool isSquare;
  final double? size;
  final Color? textColor;

  const Vlegend({
    Key? key,
    this.color,
    this.text,
    this.isSquare = false,
    this.size = 10,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          "$text",
          style: TextStyle(
              fontSize: size, fontWeight: FontWeight.w400, color: textColor),
        )
      ],
    );
  }
}
