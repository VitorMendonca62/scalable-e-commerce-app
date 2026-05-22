import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/core/theme/colors.dart';
import 'package:scalable_e_commerce_app/core/theme/spacing.dart';

class FormButton extends StatelessWidget {
  const FormButton({super.key, required this.onPressed, required this.text});

  final VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14),
        backgroundColor: AppColors.foreground,
        side: BorderSide(width: 0, color: Colors.transparent),
        overlayColor: AppColors.primaryForeground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppBorder.radius),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: AppColors.primaryForeground,
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
    );
  }
}
