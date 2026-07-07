import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController? controller;
  final bool isObscured;
  final int maxLines;
  final Widget? suffixIcon;
  final bool readOnly;

  // Customizable properties
  final Color borderColor;
  final Color focusedBorderColor;
  final Color fillColor;
  final double borderRadius;

  const AppTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.isObscured = false,
    this.maxLines = 1,
    this.suffixIcon,
    this.readOnly = false,
    this.borderColor = const Color(0xFFBDBDBD),
    this.focusedBorderColor = Colors.blue,
    this.fillColor = const Color(0xFFF8F8F8),
    this.borderRadius = 12,
  });

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(color: borderColor),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.outfit(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.grey.shade700,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isObscured,
          maxLines: maxLines,
          readOnly: readOnly,
          style: GoogleFonts.outfit(fontSize: 15),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.outfit(
              fontSize: 14,
              color: Colors.grey.shade400,
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            filled: true,
            fillColor: fillColor,
            suffixIcon: suffixIcon,
            border: border,
            enabledBorder: border,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(color: focusedBorderColor, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}
