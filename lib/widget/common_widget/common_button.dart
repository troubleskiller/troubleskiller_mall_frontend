import 'package:flutter/material.dart';

class StandardIconButton extends StatelessWidget {
  const StandardIconButton({
    required this.icon,
    required this.onPressed,
    this.disableColor = false,
    this.iconColor,
    this.iconSize = 20,
    this.isDisabled = false,
    this.padding,
  });
  final IconData? icon;
  final Function? onPressed;
  final Color? iconColor;
  final double iconSize;
  final bool isDisabled;
  final EdgeInsetsGeometry? padding;
  final bool disableColor;

  @override
  Widget build(BuildContext context) {
    Color finalIconColour() {
      Color colour = Theme.of(context).primaryColor;

      if (iconColor != null) {
        colour = iconColor!;
      }

      if (isDisabled) {
        colour = Theme.of(context).disabledColor;
      }

      return colour;
    }

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: isDisabled ? null : onPressed as void Function()?,
      child: Padding(
        padding: padding == null ? EdgeInsets.zero : padding!,
        child: Icon(
          icon!,
          color: disableColor ? null : finalIconColour(),
          size: iconSize,
        ),
      ),
    );
  }
}

class StandardTextButton extends StatelessWidget {
  const StandardTextButton({
    required this.buttonText,
    required this.onPressed,
    this.isDisabled = false,
    this.isBold = false,
  });
  final Function? onPressed;
  final String? buttonText;
  final bool isDisabled;
  final bool isBold;

  @override
  Widget build(BuildContext context) {
    // TextStyle _textStyle =
    // isBold ? CustomTextStyle.heading4 : CustomTextStyle.subtitle2;
    //
    // TextStyle buttonTextStyle = primaryColourTextStyle(
    //   context,
    //   _textStyle,
    // );
    //
    // if (isDisabled) {
    //   buttonTextStyle = replaceTextStyleProperties(
    //     context,
    //     _textStyle,
    //     colour: Theme.of(context).disabledColor,
    //   );
    // }

    return TextButton(
      style: TextButton.styleFrom(
        // to minimize default padding of text button
        padding: const EdgeInsets.all(0),
        visualDensity: const VisualDensity(horizontal: -4),
      ),
      onPressed: isDisabled ? null : onPressed as void Function()?,
      child: Text(
        buttonText!,
        // style: buttonTextStyle,
      ),
    );
  }
}
