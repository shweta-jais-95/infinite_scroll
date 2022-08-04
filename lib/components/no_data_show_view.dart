import 'package:flutter/material.dart';
import 'package:infinite_scroll/components/text_view.dart';
import 'package:infinite_scroll/utils/fontsizes.dart';
import 'package:infinite_scroll/utils/palette.dart';

class NoDataToShowView extends StatelessWidget {
  final bool? showIcon;
  final bool? showFilterMessage;
  final String? searchBy;
  const NoDataToShowView(
      {Key? key, this.showIcon, this.showFilterMessage, this.searchBy})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.75,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (showIcon != false)
            Icon(fetchIcon(), size: 50, color: Palette.grey30),
          TextView(
              text: fetchHelperText1(),
              color: Palette.grey30,
              align: TextAlign.center,
              fontSize: FontSizes.subtitle2)
        ],
      ),
    );
  }

  IconData fetchIcon() {
    return Icons.checklist_outlined;
  }

  String fetchHelperText1() {
    return "No news found";
  }
}
