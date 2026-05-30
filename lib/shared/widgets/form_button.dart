import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/core/theme/spacing.dart';
import 'package:scalable_e_commerce_app/core/theme/typography.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.onPressed,
    required this.formKey,
    required this.isLoading,
    this.labelString,
    this.labelWidget,
  });

  final VoidCallback onPressed;
  final GlobalKey<FormState> formKey;
  final bool isLoading;
  final String? labelString;
  final Widget? labelWidget;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return FilledButton(
      onPressed: () async {
        FocusScope.of(context).unfocus();

        if (!formKey.currentState!.validate()) {
          return;
        }

        onPressed();
      },
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(vertical: 14),
        backgroundColor: isLoading
            ? colorScheme.primary.withValues(alpha: 0.7)
            : colorScheme.primary,
        side: BorderSide(width: 0, color: colorScheme.outline),
        overlayColor: colorScheme.onSecondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(AppBorder.radius),
        ),
      ),
      child: isLoading
          ? labelWidget
          : Text(
              labelString!,
              style: AppTypography.labelLarge.copyWith(
                color: colorScheme.onPrimary,
              ),
            ),
    );
  }
}
