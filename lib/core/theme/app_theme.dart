import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,

    scaffoldBackgroundColor: AppColors.background,

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary,
    ).copyWith(
      primary: AppColors.navSelected,
    ),
    

   navigationBarTheme: NavigationBarThemeData(
      indicatorColor: AppColors.navIndicator,

      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.navSelected);
        }

        return const IconThemeData(color: AppColors.navUnselected);
      }),

      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.navSelected,
            fontWeight: FontWeight.w600,
          );
        }

        return const TextStyle(
          color: AppColors.navUnselected,
          );
      }),
    ),
  );
}
