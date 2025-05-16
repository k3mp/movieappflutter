import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color color;
  final Color? textColor;
  final TextStyle? textStyle;

  const MyButton({
    Key? key,
    required this.onPressed,
    required this.label,
    required this.color,
    this.textColor,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // Wrap ElevatedButton with SizedBox
      width: double.infinity, // Set the width to maximum available
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          padding: const EdgeInsets.symmetric(vertical: 15),
          textStyle: textStyle?.copyWith(fontSize: 18) ??
              const TextStyle(fontSize: 18),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
