import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/core/theme/colors.dart';
import 'package:scalable_e_commerce_app/core/theme/spacing.dart';

class FormInput extends StatefulWidget {
  const FormInput({
    super.key,
    required this.controller,
    required this.labelText,
    required this.hintText,
    required this.validator,
    required this.keyboardType,
    this.isPasswordField = false,
    this.isDisabled = false,
    this.minLines = 1,
    this.maxLines = 1,
  });

  final TextEditingController controller;
  final String labelText;
  final String hintText;
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.foreground,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 4),
        TextFormField(
          controller: widget.controller,
          style: const TextStyle(color: AppColors.foreground, fontSize: 16),
          obscureText: obscureText,
          validator: widget.validator,
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
                    ),
                  )
                : null,

            contentPadding: EdgeInsets.symmetric(
              horizontal: 12,
              vertical: 8 + (widget.isPasswordField ? 0 : 6.5),
            ),
            isDense: true,

            hintText: widget.hintText,
            hintStyle: const TextStyle(color: AppColors.mutedForeground),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppBorder.radius),
              borderSide: BorderSide(
                color: AppColors.foreground,
                width: AppBorder.width,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppBorder.radius),
              borderSide: BorderSide(
                color: AppColors.ring,
                width: AppBorder.focusedWidth,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppBorder.radius),
              borderSide: BorderSide(
                color: AppColors.destructive,
                width: AppBorder.width,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppBorder.radius),
              borderSide: BorderSide(
                color: AppColors.destructive,
                width: AppBorder.focusedWidth,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(AppBorder.radius),
              borderSide: BorderSide(
                color: AppColors.foreground,
                width: AppBorder.width,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
