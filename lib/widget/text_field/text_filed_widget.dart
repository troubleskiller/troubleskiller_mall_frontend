import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TextInputField extends StatelessWidget {
  const TextInputField({
    Key? key,
    required this.controller,
    this.obscureText = false,
    this.inputError = false,
    this.dataLoading = false,
    this.onChanged,
    this.onSubmitted,
    this.hintText,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.keyboardType,
    this.inputFormatters = const [],
    this.autoFocus = false,
    this.focusNode,
    this.placeholderOnly = false,
    this.textInputAction,
    this.requiredField = false,
    this.multiline = false,
    this.borderRadius,
    // this.onEditingComplete = false,
  }) : super(key: key);

  // Controller here acts as a listener when parent widget changes input field value
  final TextEditingController? controller;
  final bool obscureText;
  final bool inputError;
  final bool dataLoading;
  final Function? onChanged;
  final Function? onSubmitted;
  final String? hintText;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final bool autoFocus;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  // Flag to indicate error if input field text is empty.
  final bool requiredField;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  // final bool onEditingComplete;

  final bool
      placeholderOnly; // Display placeholder, without any text field input and functionality
  final bool multiline;
  final double? borderRadius;

  @override
  Widget build(BuildContext context) {
    Color kInputFieldBackgroundColour = Colors.white;
    // ColoursBasedOnModes(context).kInputFieldBackgroundColour;
    Color borderColor = Colors.white;

    // Danger border style if input error
    if (inputError &&
        (controller!.text != '' || requiredField) &&
        !dataLoading) {
      borderColor = Theme.of(context).errorColor;
    }

    Widget placeholder = Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      // Wrapped row around text, so that the text is in the middle of the row
      child: Row(
        children: [
          Expanded(
            child: Text(
              styleTextForEllipsis(hintText),
              overflow: TextOverflow.ellipsis,
              // style: CustomTextStyle.subtitle2
              //     .copyWith(color: CustomColour.darkGrey),
              maxLines: 1,
            ),
          ),
        ],
      ),
    );

    Widget inputTextField = Center(
      child: TextFormField(
        focusNode: focusNode,
        enabled: dataLoading ? false : true,
        textAlignVertical:
            multiline ? TextAlignVertical.top : TextAlignVertical.center,
        textAlign: TextAlign.left,
        controller: controller,
        decoration: InputDecoration(
          prefixIconConstraints: prefixIconConstraints,
          // isDense = true, to reduce default vertical padding
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
          border: InputBorder.none,
          hintText: hintText ?? '',
          // hintStyle: CustomTextStyle.subtitlesSmall
          //     .copyWith(color: CustomColour.onSurface400),
          suffixIcon: suffixIcon,
          prefixIcon: prefixIcon,
        ),
        style: Theme.of(context).textTheme.subtitle2,
        obscureText: obscureText, // For hiding password
        onChanged: onChanged as void Function(String)?,
        onFieldSubmitted: onSubmitted as void Function(String)?,
        keyboardType: keyboardType,
        autofocus: autoFocus,
        inputFormatters: inputFormatters,
        textInputAction: textInputAction,
        expands: multiline,
        maxLines: multiline ? null : 1,
        // To check with UIUX designer on the expected ux
        // onEditingComplete: () => onEditingComplete
        //     ? FocusScope.of(context).nextFocus()
        //     : FocusScope.of(context).unfocus(),
      ),
    );

    return Container(
      height: multiline ? 86 : 43,
      decoration: BoxDecoration(
        color: kInputFieldBackgroundColour,
        borderRadius: BorderRadius.circular(borderRadius ?? 12),
        border: Border.all(
          color: borderColor,
          width: 1.5,
        ),
      ),
      child: placeholderOnly ? placeholder : inputTextField,
    );
  }
}

String styleTextForEllipsis(String? text) {
  if (text == null) {
    return '';
  }

  return Characters(text)
      .replaceAll(Characters(''), Characters('\u{200B}'))
      .toString();
}
