import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frontend/utils/dimensions.dart';

class AppIcon extends StatelessWidget {

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon({Key? key,
    required this.icon,
    this.backgroundColor = const Color(0xFFF8FBFE),
    this.iconColor = const Color(0xFF3C3C3C),
    this.size = 40
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size / 2),
          color: backgroundColor
        ),
        child: Icon(
          icon,
          color: iconColor,
          size: Dimensions.newsDetailIconSize
        ),
      ),
    );
  }
}
