import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double height;
  final double width;
  final Color backgroundColor;
  final double borderRadius;
  final Widget childs;

  const CustomButton(
      {super.key,
      required this.childs,
      required this.onPressed,
      this.height = 50,
      this.width = double.infinity,
      this.backgroundColor = const Color.fromARGB(255, 57, 57, 57),
      this.borderRadius = 15});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius))),
        onPressed: onPressed,
        child: childs,
      ),
    );
  }
}
