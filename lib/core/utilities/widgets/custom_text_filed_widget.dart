import 'package:coding_challenge/core/utilities/const/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    required this.controller,
    required this.focusNode,
    required this.hintText,
    this.decoration,
    this.errorText,
    this.keyboardType = TextInputType.text,
    this.textInputAction = TextInputAction.next,
    this.style,
    this.obscureText = false,
    this.onChanged,
    this.onSubmitted,
    this.suffixWidget = const SizedBox(),
    this.maxLength,
    this.maxLines,
    this.contentPadding = 16,
    this.readOnly = false,
    this.borderColor = cPrimeGreenColor,
    this.hintTextStyle,
    this.inputFormatters,
    this.enableInteractiveSelection = true,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final FocusNode focusNode;
  final InputDecoration? decoration;
  final String? errorText;
  final String hintText;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final TextStyle? style;
  final bool obscureText;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final Widget? suffixWidget;
  final int? maxLength;
  final int? maxLines;
  final double contentPadding;
  final bool readOnly;
  final Color borderColor;
  final TextStyle? hintTextStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool enableInteractiveSelection;

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      enableInteractiveSelection: widget.enableInteractiveSelection,
      inputFormatters: widget.inputFormatters,
      readOnly: widget.readOnly,
      controller: widget.controller,
      focusNode: widget.focusNode,
      decoration: widget.decoration ??
          InputDecoration(
            contentPadding: EdgeInsets.symmetric(
              vertical: widget.contentPadding,
              horizontal: 20,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor,
                width: 2.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: widget.borderColor,
                width: 2.0,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: cRedColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: cRedColor,
                width: 2.0,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            hintText: widget.hintText,
            errorText: widget.errorText,
            suffix: widget.suffixWidget,
            errorStyle: const TextStyle(
              color: cRedColor,
            ),
            hintStyle: widget.hintTextStyle ??
                const TextStyle(
                  color: cGrayColor,
                ),
          ),
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      style: widget.style ??
          const TextStyle(
            color: cPrimeGreenColor,
          ),
      maxLength: widget.maxLength,
      maxLines: widget.maxLines,
      obscureText: widget.obscureText,
      onChanged: widget.onChanged,
      onSubmitted: widget.onSubmitted,
    );
  }
}
