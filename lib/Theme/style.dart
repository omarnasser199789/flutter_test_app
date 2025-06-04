import 'package:flutter/material.dart';

const double borderRadius = 25;
const Color iconsColor = Color.fromRGBO(121, 121, 121, 1);
const Color _defaultBorderColor = Colors.grey;

TextStyle cairoSemiBoldStyle(double size, Color color) {
  return TextStyle(
    fontSize: size,
    fontFamily: "SemiBold",
    fontWeight: FontWeight.bold,
    color: color,
  );
}

InputBorder _buildInputBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(borderRadius),
    borderSide: BorderSide(color: color.withOpacity(0.5)),
  );
}

InputDecoration searchDecoration(BuildContext context, Size size, String hint) {
  final primaryColor = Theme.of(context).primaryColor;

  return InputDecoration(
    contentPadding: EdgeInsets.zero,
    prefixIcon: const Icon(
      Icons.search,
      color: Colors.grey,
    ),
    border: _buildInputBorder(_defaultBorderColor),
    enabledBorder: _buildInputBorder(_defaultBorderColor),
    focusedBorder: _buildInputBorder(primaryColor),
    hintText: hint,
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontFamily: "Regular",
      fontSize: 13,
    ),
  );
}

InputDecoration textFieldDecoration(BuildContext context, Size size, String hint) {
  final primaryColor = Theme.of(context).primaryColor;

  return InputDecoration(
    contentPadding: EdgeInsets.all(size.width * 0.017),
    border: _buildInputBorder(_defaultBorderColor),
    enabledBorder: _buildInputBorder(_defaultBorderColor),
    focusedBorder: _buildInputBorder(primaryColor),
    hintText: hint,
    hintStyle: const TextStyle(
      color: Colors.grey,
      fontFamily: "Regular",
      fontSize: 13,
    ),
  );
}
