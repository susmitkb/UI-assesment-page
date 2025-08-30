// lib/theme/theme.dart
import 'package:flutter/material.dart';
import '../constants/colors.dart';

ThemeData buildTheme() {
  final base = ThemeData(useMaterial3: true);
  final scheme = ColorScheme.fromSeed(
    seedColor: AppColors.maroon,
    brightness: Brightness.light,
    primary: AppColors.maroon,
    onPrimary: Colors.white,
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    surfaceTint: Colors.transparent,
    secondary: AppColors.maroon,
    outline: AppColors.outline,
  );

  return base.copyWith(
    colorScheme: scheme,
    scaffoldBackgroundColor: AppColors.scaffold,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.onSurface,
      elevation: 0.5,
      centerTitle: true,
      surfaceTintColor: AppColors.surface,
      titleTextStyle: TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.onSurface,
      ),
    ),
    cardTheme: const CardThemeData(
      color: AppColors.surface,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
      elevation: 0,
    ),
    dividerColor: AppColors.outline,
    textTheme: const TextTheme(
      titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: AppColors.onSurface),
      bodyMedium: TextStyle(fontSize: 14, color: AppColors.onSurfaceVariant),
      bodySmall: TextStyle(fontSize: 12, color: AppColors.onSurfaceVariant),
    ),
    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.surface,
      surfaceTintColor: AppColors.surface,
      indicatorColor: AppColors.maroon.withOpacity(0.12),
      labelTextStyle: WidgetStateProperty.resolveWith(
            (s) => TextStyle(
          fontSize: 12,
          fontWeight: s.contains(WidgetState.selected) ? FontWeight.w600 : FontWeight.w500,
        ),
      ),
      iconTheme: WidgetStateProperty.resolveWith(
            (s) => IconThemeData(
          color: s.contains(WidgetState.selected) ? AppColors.maroon : AppColors.iconInactive,
          size: 26,
        ),
      ),
    ),
  );
}
