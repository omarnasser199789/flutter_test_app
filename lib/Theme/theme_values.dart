import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(14, 178, 154, 1);

  static const double borderRadius = 12.0;

  static const Color scaffoldBgLight = Color.fromRGBO(246, 246, 246, 1);
  static const Color cardColorLight = Color.fromRGBO(255, 255, 255, 1);

  static const Color scaffoldBgDark = Color(0xFF0F0F0F);
  static const Color cardColorDark = Color(0xFF2D2D2D);

  static const Color disabledColor = Color.fromRGBO(165, 165, 165, 1);
  static const Color canvasColorLight = Color.fromRGBO(18, 18, 18, 1);

  // Roboto TextStyle helper
  static TextStyle _robotoStyle(
      double fontSize, {
        FontWeight fontWeight = FontWeight.w400,
        Color color = Colors.black,
      }) =>
      GoogleFonts.roboto(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );

  // DM Sans TextStyle helper
  static TextStyle _dMSansStyle(
      double fontSize, {
        FontWeight fontWeight = FontWeight.w400,
        Color color = Colors.black,
      }) =>
      GoogleFonts.dmSans(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      );

  /// Light Theme
  static ThemeData getLightTheme() {
    final base = ThemeData.light();

    return base.copyWith(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBgLight,
      cardColor: cardColorLight,
      disabledColor: disabledColor,
      canvasColor: canvasColorLight,
      brightness: Brightness.light,
      elevatedButtonTheme: _getElevatedButtonTheme(primaryColor),
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.light),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected) ? primaryColor : Colors.transparent,
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        contentTextStyle: TextStyle(
          color: canvasColorLight,
          fontFamily: GoogleFonts.roboto().fontFamily,
          fontWeight: FontWeight.bold,
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        color: cardColorLight.withOpacity(0.9),
      ),
      textTheme: TextTheme(
        displayLarge: _robotoStyle(57),
        displayMedium: _robotoStyle(32, fontWeight: FontWeight.w800),//I'm using
        displaySmall: _robotoStyle(36),
        headlineLarge: _robotoStyle(32),
        headlineMedium: _robotoStyle(28),
        headlineSmall: _robotoStyle(20, fontWeight: FontWeight.w400),//I'm using
        titleLarge: _robotoStyle(20, fontWeight: FontWeight.w500),
        titleMedium: _robotoStyle(16, fontWeight: FontWeight.w400),//I'm using
        titleSmall: _robotoStyle(14, fontWeight: FontWeight.w400),//I'm using
        labelLarge: _robotoStyle(13, fontWeight: FontWeight.w700),
        bodyLarge: _robotoStyle(15),
        labelMedium: _robotoStyle(14),
        labelSmall: _dMSansStyle(14,  fontWeight: FontWeight.w400),
        bodyMedium: _dMSansStyle(14, fontWeight: FontWeight.w700),
        bodySmall: _dMSansStyle(12, fontWeight: FontWeight.w700),//I'm using
      ),
    );
  }

  /// Dark Theme
  static ThemeData getDarkTheme() {
    return ThemeData(
      useMaterial3: true,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: scaffoldBgDark,
      cardColor: cardColorDark,
      brightness: Brightness.dark,
      elevatedButtonTheme: _getElevatedButtonTheme(primaryColor),
      colorScheme: ColorScheme.fromSeed(seedColor: primaryColor, brightness: Brightness.dark),
      canvasColor: Colors.white.withOpacity(0.87),
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
              (states) => states.contains(MaterialState.selected) ? primaryColor : cardColorDark,
        ),
      ),
      cardTheme: CardTheme(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        color: scaffoldBgDark,
      ),
      textTheme: TextTheme(
        displayLarge: _robotoStyle(57, color: Colors.white),
        displayMedium: _robotoStyle(32, color: Colors.white, fontWeight: FontWeight.w800),//I'm using
        displaySmall: _robotoStyle(36, color: Colors.white),
        headlineLarge: _robotoStyle(32, color: Colors.white),
        headlineMedium: _robotoStyle(28, color: Colors.white),
        headlineSmall: _robotoStyle(20, color: Colors.white, fontWeight: FontWeight.w400),//I'm using
        titleLarge: _robotoStyle(18, fontWeight: FontWeight.w500, color: Colors.white),
        titleMedium: _robotoStyle(16, fontWeight: FontWeight.w400, color: Colors.white),//I'm using
        titleSmall: _robotoStyle(13, color: Colors.white),
        labelLarge: _robotoStyle(13, fontWeight: FontWeight.w700, color: Colors.white),
        bodyLarge: _robotoStyle(15, color: Colors.white),
        labelMedium: _robotoStyle(14, color: Colors.white),
        labelSmall: _robotoStyle(13, color: Colors.white),
        bodyMedium: _robotoStyle(14, fontWeight: FontWeight.w700, color: Colors.white),
        bodySmall: _robotoStyle(12, color: Colors.white),
      ),
    );
  }

  static ElevatedButtonThemeData _getElevatedButtonTheme(Color primaryColor) {
    return ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(primaryColor),
        textStyle: MaterialStateProperty.all(
          GoogleFonts.roboto(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white),
        ),
        elevation: MaterialStateProperty.all(4),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(borderRadius)),
        ),
      ),
    );
  }
}
