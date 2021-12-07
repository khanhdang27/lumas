import 'package:lumas/general/configs.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class Btn extends StatelessWidget {
  final String languageKey;
  final VoidCallback? callback;
  final Icon? icon;

  const Btn({
    Key? key,
    required this.languageKey,
    this.callback,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.fromLTRB(50, 0, 50, 30),
        padding: EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            icon ?? SizedBox.shrink(),
            Expanded(
              child: Text(
                languageKey.tr,
                style: TextStyle(
                  fontSize: 21,
                  fontWeight: AppFont.wMedium,
                  color: AppColor.whiteMain,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: AppColor.pinkPrimary,
          borderRadius: BorderRadius.circular(37.5),
        ),
      ),
      onTap: callback,
    );
  }
}
