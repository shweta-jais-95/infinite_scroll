import 'package:flutter/material.dart';
import 'package:infinite_scroll/utils/palette.dart';

class CircularProgressBarIndicatorView extends StatelessWidget {
  final Color? backgroundColor;
  const CircularProgressBarIndicatorView({Key? key, this.backgroundColor})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: backgroundColor ?? Palette.loadingViewBgColor,
      child: const CircularProgressBar(),
    );
  }
}

class CircularProgressBar extends StatelessWidget {
  const CircularProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation<Color>(Palette.primaryColor),
    ));
  }
}
