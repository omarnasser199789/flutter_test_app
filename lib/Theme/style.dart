import 'package:flutter/material.dart';

/// Common border radius used for text fields
const double kBorderRadius = 25;

/// Default color for icons inside input fields
const Color kIconsColor = Color.fromRGBO(121, 121, 121, 1);

/// Default border color for input fields
const Color _kDefaultBorderColor = Colors.grey;

/// A reusable Cairo-style TextStyle with semi-bold weight
TextStyle cairoSemiBoldStyle(double fontSize, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontFamily: "SemiBold", // Ensure this font is included in pubspec.yaml
    fontWeight: FontWeight.bold,
    color: color,
  );
}

/// Builds an outline border with a given color and fixed border radius
InputBorder _buildInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(kBorderRadius),
    borderSide: BorderSide(
      color: color.withOpacity(0.5),
    ),
  );
}

/// InputDecoration for search fields with a search icon and custom styling
InputDecoration searchDecoration(BuildContext context, String hintText) {
  final primaryColor = Theme.of(context).primaryColor;

  return InputDecoration(
    contentPadding: EdgeInsets.zero,
    prefixIcon: const Icon(
      Icons.search,
      color: kIconsColor,
    ),
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontFamily: "Regular",
      fontSize: 13,
    ),
    border: _buildInputBorder(_kDefaultBorderColor),
    enabledBorder: _buildInputBorder(_kDefaultBorderColor),
    focusedBorder: _buildInputBorder(primaryColor),
  );
}

/// InputDecoration for regular text fields with padding and hint styling
InputDecoration textFieldDecoration(BuildContext context, Size size, String hintText) {
  final primaryColor = Theme.of(context).primaryColor;

  return InputDecoration(
    contentPadding: EdgeInsets.all(size.width * 0.017),
    hintText: hintText,
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontFamily: "Regular",
      fontSize: 13,
    ),
    border: _buildInputBorder(_kDefaultBorderColor),
    enabledBorder: _buildInputBorder(_kDefaultBorderColor),
    focusedBorder: _buildInputBorder(primaryColor),
  );
}
