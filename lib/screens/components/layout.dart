import 'package:lumas/general/configs.dart';
import 'package:lumas/screens/components/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Layout extends StatelessWidget {
  final Widget child;
  final PreferredSizeWidget? header;

  const Layout({Key? key, required this.child, this.header}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SuperScreen(
      child: Container(
        child: SafeArea(
          child: Scaffold(
            appBar: header,
            backgroundColor: AppColor.whiteMain,
            body: SingleChildScrollView(
              child: child,
            ),
            extendBody: true,
          ),
        ),
      ),
    );
  }
}
