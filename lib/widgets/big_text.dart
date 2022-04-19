import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  FontWeight fontWeight;
  int maxLines;

  BigText({Key? key,
    this.color = const Color(0xFF3C3C3C),
    required this.text,
    this.size = 20,
    this.fontWeight = FontWeight.w400,
    this.overflow = TextOverflow.ellipsis,
    this.maxLines = 2
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight
      )
    );
  }
}
