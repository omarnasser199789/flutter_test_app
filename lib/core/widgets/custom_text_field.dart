import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import '../../Theme/style.dart';

/// A customizable and reusable text field widget with extended configuration.
///
/// It supports password toggling, search field styling, icon prefixes/suffixes,
/// and additional form field customization.
class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hint,
    this.title,
    this.width,
    this.maxLength,
    this.maxLines,
    this.inputFormatters,
    this.autofocus,
    this.isSearch,
    this.enabled,
    this.titleColor,
    this.focusNode,
    this.textInputAction,
    this.keyboardType,
    this.controller,
    this.textAlign,
    this.isPassword = false,
    this.onTap,
    this.onChange,
    this.validator,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.prefixIcon,
    this.suffixIcon,
  });

  /// Placeholder text shown inside the field.
  final String hint;

  /// Optional label/title above the field (not used in current implementation).
  final String? title;

  /// Optional custom width of the field (not used in current implementation).
  final double? width;

  /// Maximum number of characters allowed.
  final int? maxLength;

  /// Maximum number of visible lines (disabled if password field).
  final int? maxLines;

  /// Optional list of input formatters.
  final List<TextInputFormatter>? inputFormatters;

  /// Whether the field should autofocus on build.
  final bool? autofocus;

  /// Flag to determine if the field is styled for search.
  final bool? isSearch;

  /// Whether the field is enabled.
  final bool? enabled;

  /// Custom color for the label/title.
  final Color? titleColor;

  /// FocusNode to control focus manually.
  final FocusNode? focusNode;

  /// Defines the keyboard "action" button.
  final TextInputAction? textInputAction;

  /// Type of keyboard to use.
  final TextInputType? keyboardType;

  /// Text controller to manage the input.
  final TextEditingController? controller;

  /// Text alignment within the field.
  final TextAlign? textAlign;

  /// Whether the field hides input for passwords.
  final bool isPassword;

  /// Triggered when the field is tapped.
  final Function()? onTap;

  /// Triggered on every text change.
  final Function(String)? onChange;

  /// Validation logic.
  final String? Function(String?)? validator;

  /// Triggered when the user submits the field.
  final Function(String)? onFieldSubmitted;

  /// Triggered when editing is completed.
  final Function()? onEditingComplete;

  /// Leading icon inside the field.
  final Widget? prefixIcon;

  /// Trailing icon inside the field (automatically becomes a password toggle icon if `isPassword` is true).
  final Widget? suffixIcon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    // Initialize the obscureText state if the field is a password field.
    _obscureText = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    // Determine keyboard appearance based on theme brightness.
    final Brightness keyboardAppearance = SchedulerBinding.instance.window.platformBrightness;

    return TextFormField(
      enabled: widget.enabled,
      focusNode: widget.focusNode,
      controller: widget.controller,
      maxLength: widget.maxLength,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      autofocus: widget.autofocus ?? false,
      onTap: widget.onTap,
      onChanged: widget.onChange,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      onEditingComplete: widget.onEditingComplete,
      textInputAction: widget.textInputAction,
      textAlign: widget.textAlign ?? TextAlign.start,
      obscureText: _obscureText,
      keyboardAppearance: keyboardAppearance,
      maxLines: widget.isPassword ? 1 : widget.maxLines,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: Theme.of(context).textTheme.titleMedium,

      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: Colors.transparent,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(borderRadius),
          borderSide: BorderSide.none,
        ),
        hintStyle: Theme.of(context)
            .textTheme
            .labelMedium
            ?.copyWith(color: iconsColor),

        errorStyle: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: Colors.red),

        prefixIcon: widget.prefixIcon != null
            ? Container(
          width: 10,
          height: 10,
          alignment: Alignment.center,
          child: widget.prefixIcon,
        )
            : null,

        suffixIcon: widget.isPassword
            ? GestureDetector(
          onTap: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
          child: Container(
            width: 10,
            height: 10,
            alignment: Alignment.center,
            child: widget.suffixIcon,
          ),
        )
            : widget.suffixIcon,

        contentPadding: EdgeInsets.symmetric(
          vertical: (widget.isSearch ?? false) ? 10 : 12,
          horizontal: 15,
        ),

        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(1), width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),

        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).primaryColor.withOpacity(0.5), width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),

        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),

        disabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
              color: Theme.of(context).disabledColor, width: 1.0),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
      ),

    );
  }
}
