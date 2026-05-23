import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/core/theme/spacing.dart';
import 'package:scalable_e_commerce_app/core/theme/typography.dart';

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
        backgroundColor: Theme.of(context).colorScheme.primary,
        side: BorderSide(
          width: 0,
          color: Theme.of(context).colorScheme.outline,
        ),
        overlayColor: Theme.of(context).colorScheme.onSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppBorder.radius),
        ),
      ),
      child: Text(
        text,
        style: AppTypography.labelLarge.copyWith(
          color: Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
