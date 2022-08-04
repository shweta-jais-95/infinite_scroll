import 'package:flutter/material.dart';
import 'package:infinite_scroll/components/common_components.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({Key? key}) : super(key: key);

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: fetchAppBar("", showLeading: true),
      body: Container(),
    );
  }
}
