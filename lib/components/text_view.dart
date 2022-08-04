import 'package:flutter/material.dart';
import 'package:infinite_scroll/utils/fontsizes.dart';
import 'package:infinite_scroll/utils/palette.dart';

class TextView extends StatelessWidget {
  final String? text;
  final bool? showInCaps;
  final double? topMargin;
  final double? bottomMargin;
  final double? leftMargin;
  final double? rightMargin;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final TextDecoration? decoration;
  final int? maxLines;
  final FontStyle? fontStyle;
  final TextAlign? align;
  const TextView(
      {Key? key,
      this.text,
      this.decoration,
      this.showInCaps,
      this.topMargin,
      this.bottomMargin,
      this.leftMargin,
      this.rightMargin,
      this.maxLines,
      this.fontWeight,
      this.fontSize,
      this.color,
      this.fontStyle,
      this.align})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != null
        ? Container(
            margin: EdgeInsets.only(
                left: leftMargin ?? 16,
                top: topMargin ?? 16,
                right: rightMargin ?? 16,
                bottom: bottomMargin ?? 0),
            child: Text(showInCaps == true ? "${text?.toUpperCase()}" : "$text",
                textAlign: align,
                //added kIsWeb to support accessibility on large mobile devices in landscape mode
                style: TextStyle(
                    fontStyle: fontStyle ?? FontStyle.normal,
                    fontSize: fontSize ?? FontSizes.body2,
                    color: color ?? Palette.grey60,
                    decoration: decoration,
                    fontWeight: fontWeight ?? FontWeight.w400),
                maxLines: maxLines,
                overflow: maxLines != null ? TextOverflow.ellipsis : null))
        : Container();
  }
}

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
                              color: color ?? Palette.grey60,
                              fontWeight: fontWeight ?? FontWeight.w400))
                    ])),
          )
        : Container();
  }
}

class TextWithSuffixIcon extends StatelessWidget {
  final String? text;
  final Icon suffixIcon;
  final double? topMargin;
  final double? bottomMargin;
  final double? leftMargin;
  final double? rightMargin;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? color;
  final FontStyle? fontStyle;
  final Function()? onTap;
  const TextWithSuffixIcon(
      {Key? key,
      this.onTap,
      this.text,
      required this.suffixIcon,
      this.topMargin,
      this.bottomMargin,
      this.leftMargin,
      this.rightMargin,
      this.fontWeight,
      this.fontSize,
      this.color,
      this.fontStyle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return text != null
        ? InkWell(
            onTap: onTap,
            child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(
                    left: leftMargin ?? 16,
                    top: topMargin ?? 16,
                    right: rightMargin ?? 16,
                    bottom: bottomMargin ?? 0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text("$text",
                      style: TextStyle(
                          fontStyle: fontStyle ?? FontStyle.normal,
                          fontSize: fontSize ?? FontSizes.body2,
                          color: color ?? Palette.grey10,
                          fontWeight: fontWeight ?? FontWeight.w400)),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: suffixIcon,
                  ),
                ])),
          )
        : Container();
  }
}
