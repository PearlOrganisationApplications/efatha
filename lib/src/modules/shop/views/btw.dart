import 'package:efatha_tv/src/core/values/app_colors.dart';
import 'package:flutter/material.dart';

import 'package:loading_animation_widget/loading_animation_widget.dart';

class AppButton extends StatelessWidget {
  final String title;
  final double? height;
  final double? width;
  final Function() onPressed;
  final bool isLoading;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? ContainerPadding;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;
  final bool? isDisabled;
  final double? fontSize;
  final double? fontHeight;
  final FontWeight? fontWeight;
  final Widget? widget;
  final GlobalKey? buttonKey;
  final double radius;
  final double? elevation;
  final Color? disabledTextColor;

  const AppButton({
    super.key,
    required this.onPressed,
    this.title = "Sign up",
    this.height,
    this.width,
    this.padding,
    this.fontHeight,
    this.ContainerPadding,
    this.color = AppColors.appcolor,
    this.radius = 8,
    this.textColor,
    this.disabledTextColor,
    this.borderColor = const Color(0xFFDDDDDD),
    this.fontSize = 16,
    this.elevation,
    this.widget,
    this.fontWeight = FontWeight.w500,
    this.isDisabled = false,
    this.isLoading = false,
    this.buttonKey,
  });

  @override
  Widget build(BuildContext context) {
    final bool disabled = isDisabled == true || isLoading;

    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16),
      child: InkWell(
        key: buttonKey,
        onTap: disabled ? null : onPressed,
        borderRadius: BorderRadius.circular(radius),
        splashColor: Colors.white.withOpacity(0.2),
        child: Container(
          padding: ContainerPadding ?? EdgeInsets.symmetric(horizontal: 0),
          width: width ?? 357,
          height: height ?? 48,
          decoration: BoxDecoration(
            color: disabled
                ? (color ?? AppColors.appcolor).withOpacity(0.6)
                : color,
            borderRadius: BorderRadius.circular(radius),
            border: Border.all(
              color: borderColor ?? const Color(0xFFDDDDDD),
              width: 0.5,
            ),
            boxShadow: elevation != null && elevation! > 0
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: elevation!,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : [],
          ),
          child: Center(
            child: isLoading
                ? LoadingAnimationWidget.hexagonDots(
                    color: Colors.white,
                    size: 30,
                  )
                : title.isNotEmpty
                ? Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      height: fontHeight,
                      fontSize: fontSize,
                      color: disabled
                          ? disabledTextColor ?? Colors.white
                          : textColor ?? Colors.white,
                      fontWeight: fontWeight,
                    ),
                  )
                : widget,
          ),
        ),
      ),
    );
  }
}
