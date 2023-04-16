import 'package:flutter/cupertino.dart';

class BigText extends StatelessWidget {
  final Color color;
  final String text;
  final double size;
  final TextOverflow overflow;

  const BigText({Key? key,
    required this.text,
    this.color=const Color(0xFF332d2b),
    this.overflow = TextOverflow.ellipsis,
    this.size=20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size,
        color: color,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}