import 'package:flutter/material.dart';
import 'package:infinite_scroll/utils/fontsizes.dart';
import 'package:infinite_scroll/utils/palette.dart';

class TextWithIcon extends StatelessWidget {
  final String? text;
  final Icon prefixIcon;
  final double? topMargin;
  final double? bottomMargin;
  final double? leftMargin;
  final double? rightMargin;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final FontStyle? fontStyle;
  final Function()? onTap;
  const TextWithIcon({
    Key? key,
    this.onTap,
    this.text,
    required this.prefixIcon,
    this.topMargin,
    this.bottomMargin,
    this.leftMargin,
    this.rightMargin,
    this.fontWeight,
    this.fontSize,
    this.color,
    this.fontStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != null
        ? InkWell(
            onTap: onTap,
            child: Container(
                margin: EdgeInsets.only(
                    left: leftMargin ?? 16,
                    top: topMargin ?? 16,
                    right: rightMargin ?? 16,
                    bottom: bottomMargin ?? 0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: prefixIcon,
                      ),
                      Text("$text",
                          style: TextStyle(
                              fontStyle: fontStyle ?? FontStyle.normal,
                              fontSize: fontSize ?? FontSizes.body2,
                              color: color ?? Palette.grey10,
                              fontWeight: fontWeight ?? FontWeight.w400))
                    ])),
          )
        : Container();
  }
}
