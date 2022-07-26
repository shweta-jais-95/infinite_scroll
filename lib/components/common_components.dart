import 'package:flutter/material.dart';
import 'package:infinite_scroll/components/icon_button_view.dart';

fetchAppBar(String? title, BuildContext context,
    {List<Widget>? actions,
    bool? showCrossIcon,
    Color? backGroundColor,
    required bool showLeading}) {
  return PreferredSize(
    preferredSize: Size(MediaQuery.of(context).size.width, 56),
    child: Column(
      children: [
        AppBar(
            centerTitle: false,
            automaticallyImplyLeading: showLeading,
            elevation: null,
            leadingWidth: showLeading ? 32 : 0,
            backgroundColor: backGroundColor,
            title: Text("$title",
                style: const TextStyle(fontWeight: FontWeight.w600)),
            actions:
                (actions == null || actions.isEmpty) ? [Container()] : actions,
            leading: showLeading == false
                ? Container()
                : Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Builder(builder: (context) {
                      return IconButtonView(
                        padding: const EdgeInsets.all(0),
                        icon: Icon(
                            showCrossIcon != null && showCrossIcon == true
                                ? Icons.close
                                : Icons.arrow_back),
                        onPressed: () {
                          Navigator.maybePop(context);
                        },
                      );
                    }))),
      ],
    ),
  );
}
