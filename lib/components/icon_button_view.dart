import 'package:flutter/material.dart';

class IconButtonView extends StatelessWidget {
  final Widget icon;
  final Function() onPressed;
  final double? splashRadius;
  final EdgeInsetsGeometry? padding;
  final Color? color;
  const IconButtonView(
      {Key? key,
      required this.icon,
      this.splashRadius,
      required this.onPressed,
      this.padding,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        padding: padding ?? const EdgeInsets.all(8.0),
        splashRadius: splashRadius ?? 16,
        onPressed: onPressed,
        color: color,
        icon: icon);
  }
}
