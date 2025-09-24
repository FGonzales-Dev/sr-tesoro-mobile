import 'package:flutter/material.dart';
import 'xray_list_screen.dart';

class XrayTab extends StatelessWidget {
  const XrayTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const XrayListScreen(),
    );
  }
}
