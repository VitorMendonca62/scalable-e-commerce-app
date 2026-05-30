import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/core/theme/spacing.dart';
import 'package:scalable_e_commerce_app/core/theme/typography.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    this.focusNode,
    this.textInputAction,
    this.onFieldSubmitted,
    this.isPasswordField = false,
    this.isDisabled = false,
    this.minLines = 1,
    this.maxLines = 1,
    this.errorText,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
  final String? errorText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final void Function(String)? onFieldSubmitted;
  final String? Function(String?) validator;
  final bool isPasswordField;
  final TextInputType keyboardType;
  final bool isDisabled;
  final int minLines;
  final int maxLines;

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  late bool obscureText;

  @override
  void initState() {
    super.initState();
    obscureText = widget.isPasswordField;
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: AppTypography.titleSmall.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          style: AppTypography.bodyLarge.copyWith(
            color: widget.isDisabled
                ? colorScheme.onSurface.withValues(alpha: 0.7)
                : colorScheme.onSurface,
          ),
          obscureText: obscureText,
          validator: widget.validator,
          focusNode: widget.focusNode,
          textInputAction: widget.textInputAction,
          onFieldSubmitted: widget.onFieldSubmitted,
          keyboardType: widget.keyboardType,
          enabled: !widget.isDisabled,
          minLines: widget.minLines,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            suffixIcon: widget.isPasswordField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        if (widget.isPasswordField) {
                          obscureText = !obscureText;
                        }
                      });
                    },
                    icon: Icon(
                      obscureText ? Icons.visibility_off : Icons.visibility,
                      color: colorScheme.onSurfaceVariant,
                    ),
                  )
                : null,

            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8 + (widget.isPasswordField ? 0 : 6.5),
            ),
            isDense: true,

            filled: widget.isDisabled,
            fillColor: colorScheme.surfaceContainer,

            errorText: widget.errorText,

            hintText: widget.hintText,
            hintStyle: AppTypography.bodyMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppBorder.radius),
              borderSide: BorderSide(
                color: colorScheme.outline,
                width: AppBorder.width,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppBorder.radius),
              borderSide: BorderSide(
                color: colorScheme.primary,
                width: AppBorder.focusedWidth,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppBorder.radius),
              borderSide: BorderSide(
                color: colorScheme.error,
                width: AppBorder.width,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppBorder.radius),
              borderSide: BorderSide(
                color: colorScheme.onError,
                width: AppBorder.focusedWidth,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppBorder.radius),
              borderSide: BorderSide(
                color: colorScheme.outlineVariant,
                width: AppBorder.width,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
