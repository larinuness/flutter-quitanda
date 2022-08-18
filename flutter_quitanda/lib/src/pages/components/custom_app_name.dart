import 'package:flutter/material.dart';

class CustomAppName extends StatelessWidget {
  final Color? greenTitleColor;
  final double textSize;

  const CustomAppName({
    Key? key,
    this.greenTitleColor,
    this.textSize = 30,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: TextStyle(
          fontSize: textSize,
        ),
        children: [
          TextSpan(
            text: 'Green',
            style: TextStyle(color: greenTitleColor ?? Colors.green),
          ),
          const TextSpan(
            text: 'grocer',
            style: TextStyle(
              color: Color.fromARGB(255, 132, 18, 10),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
