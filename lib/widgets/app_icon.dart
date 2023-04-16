import 'package:booking_app/utils/colors.dart';
import 'package:flutter/material.dart';

class AppIcon extends StatelessWidget {

  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final double size;

  const AppIcon({Key? key,
    required this.icon,
    this.backgroundColor=AppColors.buttonColor,
    this.iconColor=AppColors.secondaryTextColor,
    this.size=40,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundColor
      ),
      child: Icon(
          icon,
        color: iconColor,
        size: 25,
      ),
    );
  }
}
