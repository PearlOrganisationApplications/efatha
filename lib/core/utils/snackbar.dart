import 'package:bidya/core/utils/custom_text.dart';
import 'package:flutter/material.dart';

snackBar<Widget>(
  BuildContext context,
  String title, [
  backgroundColor = Colors.black,
]) {
  return ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: CText(textColor: Colors.white, title),
      ),
    );
}
