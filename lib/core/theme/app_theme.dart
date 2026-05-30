import 'package:flutter/material.dart';
import 'package:scalable_e_commerce_app/core/theme/colors.dart';
import 'package:scalable_e_commerce_app/core/theme/typography.dart';

class AppTheme {
  static final ColorScheme ligthColorSchema = ColorScheme(
    brightness: Brightness.light,

    primary: AppColors.primary,
    onPrimary: AppColors.primaryForeground,

    secondary: AppColors.secondary,
    onSecondary: AppColors.secondaryForeground,

    surface: AppColors.background,
    onSurface: AppColors.foreground,

    surfaceContainer: AppColors.muted,
    onSurfaceVariant: AppColors.mutedForeground,

    outline: AppColors.border,
    outlineVariant: AppColors.disableBorder,

    error: AppColors.destructive,
    onError: AppColors.destructiveForeground,
  );

  static final ThemeData ligth = ThemeData(
    scaffoldBackgroundColor: AppTheme.ligthColorSchema.surface,
    textTheme: AppTypography.textTheme.apply(
      bodyColor: AppTheme.ligthColorSchema.onSurface,
      displayColor: AppTheme.ligthColorSchema.onSurface,
    ),
    colorScheme: AppTheme.ligthColorSchema,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: AppTheme.ligthColorSchema.onSecondary,
      selectionColor: AppTheme.ligthColorSchema.onSecondary.withValues(
        alpha: 0.2,
      ),
      selectionHandleColor: AppTheme.ligthColorSchema.onSecondary,
    ),
    fontFamily: AppTypography.fontFamily,
  );
}
