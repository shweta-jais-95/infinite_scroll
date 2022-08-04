import 'package:flutter/material.dart';
import 'package:infinite_scroll/components/icon_button_view.dart';

fetchAppBar(String? title,
    {List<Widget>? actions, bool? showCrossIcon, required bool showLeading}) {
  return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: showLeading,
      leadingWidth: showLeading ? 32 : 0,
      title:
          Text("$title", style: const TextStyle(fontWeight: FontWeight.w600)),
      actions: (actions == null || actions.isEmpty) ? [Container()] : actions,
      leading: showLeading == false
          ? Container()
          : Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Builder(builder: (context) {
                return IconButtonView(
                  padding: const EdgeInsets.all(0),
                  icon: Icon(showCrossIcon != null && showCrossIcon == true
                      ? Icons.close
                      : Icons.arrow_back),
                  onPressed: () {
                    Navigator.maybePop(context);
                  },
                );
              })));
}
