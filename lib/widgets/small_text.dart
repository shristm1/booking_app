import 'package:flutter/cupertino.dart';

class SmallText extends StatelessWidget {

  final Color color;
  final String text;
  final double size;
  final double height;

  const SmallText({Key? key,
    required this.text,
    this.color=const Color(0xFFE5E5E5),
    this.size=14,
    this.height=1.2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.justify,
      style: TextStyle(
        fontFamily: 'Roboto',
        fontSize: size,
        color: color,
        height: height,
      ),
    );
  }
}
