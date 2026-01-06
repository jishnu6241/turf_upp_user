import 'package:flutter/material.dart';

/// =======================
/// COLORS
/// =======================

const Color backgroundColor = Color(0xFFFAFAFA);
const Color titleColor = Color(0xFF353535);
const Color textColor = Color(0xFF353535);

const Color mutedIconColor = Color(0xFFA1A1A1);
const Color mutedTextColor = Color(0xFF919191);

const Color inputBackgroundColor = Color(0xFFF1F1F1);

const Color cardBackgroundColor = Color(0xFFF0F0F0);
const Color cardBorderColor = Color(0xFFD8D8D8);
const Color cardFocusBorderColor = Color.fromARGB(255, 203, 203, 203);

const Color iconColor = Color(0xFF566273);

/// Brand colors
const Color primaryColor = Color(0xFF000000); // Black
const Color secondaryColor = Color(0xFF4ADE16); // Green
const Color tertiaryColor = Color(0xFFFFFFFF);
const Color accentColor = Color(0xFFFFD700);

const Color surfaceColor = Color(0xFFFFFFFF);
const Color errorColor = Color(0xFFB00020);

const Color onprimaryColor = Color(0xFFFAFAFA);
const Color onSecondaryColor = Color(0xFF000000);
const Color onTertiaryColor = Color(0xFF000000);
const Color onSurfaceColor = Color(0xFF7A7A7A);
const Color onErrorColor = Color(0xFFFFFFFF);

const Color outlineColor = Color(0xFFE5E5E5);
const Color shadowColor = Color.fromARGB(15, 0, 0, 0);
const Color dividerColor = Color(0xFFE6E6E6);

/// =======================
/// THEME
/// =======================

ThemeData appTheme = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,

  scaffoldBackgroundColor: backgroundColor,
  dialogBackgroundColor: backgroundColor,
  dividerColor: dividerColor,

  fontFamily: 'Poppins',

  /// 🔥 FIXES PURPLE CURSOR / DOT / SELECTION
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: secondaryColor,
    selectionColor: Color(0x554ADE16), // transparent green
    selectionHandleColor: secondaryColor,
  ),

  /// 🔥 Removes purple ripple / glow
  splashFactory: NoSplash.splashFactory,
  highlightColor: Colors.transparent,

  dividerTheme: const DividerThemeData(color: dividerColor),

  textTheme: const TextTheme(
    labelLarge: TextStyle(color: onSecondaryColor),
    labelMedium: TextStyle(color: onSecondaryColor),
    labelSmall: TextStyle(color: onSecondaryColor),
    titleLarge: TextStyle(color: onSecondaryColor),
    titleMedium: TextStyle(color: onSecondaryColor),
    titleSmall: TextStyle(color: onSecondaryColor),
    bodyLarge: TextStyle(color: onSecondaryColor),
    bodyMedium: TextStyle(color: onSecondaryColor),
    bodySmall: TextStyle(color: onSecondaryColor),
    headlineLarge: TextStyle(color: onSecondaryColor),
    headlineMedium: TextStyle(color: onSecondaryColor),
    headlineSmall: TextStyle(color: onSecondaryColor),
    displayLarge: TextStyle(color: onSecondaryColor),
    displayMedium: TextStyle(color: onSecondaryColor),
    displaySmall: TextStyle(color: onSecondaryColor),
  ),

  colorScheme: const ColorScheme.light(
    primary: primaryColor,
    onPrimary: onprimaryColor,
    secondary: secondaryColor,
    onSecondary: onSecondaryColor,
    tertiary: tertiaryColor,
    error: errorColor,
    surface: surfaceColor,
    onSurface: onSurfaceColor,
    outline: outlineColor,
    shadow: shadowColor,
  ),

  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 0,
    centerTitle: true,
    iconTheme: IconThemeData(color: iconColor),
    titleTextStyle: TextStyle(
      color: onSecondaryColor,
      fontSize: 18,
      fontWeight: FontWeight.w600,
      fontFamily: 'Poppins',
    ),
  ),

  iconTheme: const IconThemeData(color: iconColor),

  inputDecorationTheme: InputDecorationTheme(
    isDense: true,
    filled: true,
    fillColor: inputBackgroundColor,

    labelStyle: const TextStyle(color: onTertiaryColor),
    hintStyle: const TextStyle(color: mutedTextColor),

    prefixIconColor: mutedIconColor,
    suffixIconColor: mutedIconColor,

    floatingLabelBehavior: FloatingLabelBehavior.auto,
    contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 14),

    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(color: cardBorderColor),
    ),

    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(color: cardBorderColor),
    ),

    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(
        color: cardBorderColor, // 🔥 GREEN FOCUS
        width: .5,
      ),
    ),

    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(color: errorColor),
    ),

    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(24),
      borderSide: const BorderSide(color: errorColor),
    ),

    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(color: cardBorderColor),
    ),
  ),
);
