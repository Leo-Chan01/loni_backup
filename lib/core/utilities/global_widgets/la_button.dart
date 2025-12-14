import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loni_africa/core/utilities/extension/num_extension.dart';

// ignore: must_be_immutable
class AhiaomaButton extends StatelessWidget {
  final Function()? onPressButton;
  final String buttonText;
  final double buttonWidth;
  Color textColor;
  Color buttonColor;
  bool isLoading;
  double? insidePadding;

  AhiaomaButton({
    super.key,
    required this.onPressButton,
    required this.buttonText,
    required this.buttonWidth,
    required this.textColor,
    required this.buttonColor,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 55.h,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressButton,
        style: ButtonStyle(
          elevation: const WidgetStatePropertyAll(0),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
          ),
          backgroundColor: WidgetStatePropertyAll(buttonColor),
          foregroundColor: WidgetStatePropertyAll(textColor),
          padding: WidgetStatePropertyAll(
            EdgeInsets.symmetric(
              horizontal: insidePadding ?? 16.w,
              vertical: 12.h,
            ),
          ),
        ),
        child: isLoading
            ? CircularProgressIndicator.adaptive(
                valueColor: AlwaysStoppedAnimation<Color>(textColor),
              )
            : Text(buttonText, style: 14.w400, textAlign: TextAlign.center),
      ),
    );
  }
}
