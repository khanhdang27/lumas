import 'package:lumas/general/configs.dart';
import 'package:lumas/screens/components/login/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lumas/general/screens.dart';

class ForgotPwScreen extends StatefulWidget {
  @override
  _ForgotPwScreenState createState() => _ForgotPwScreenState();
}

class _ForgotPwScreenState extends State<ForgotPwScreen> {
  final phoneCtrl = TextEditingController();
  final passCtrl = TextEditingController();
  final confirmPassCtrl = TextEditingController();
  final codeCtrl = TextEditingController();

  var verificationCode = '';
  String pass = '';
  String phone = '';
  var isLoading = false;

  String? phoneError;

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Icon(
              Icons.lock_outline,
              size: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              'forgotPassword'.tr,
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Text(
            'enterPhoneForgot'.tr,
            style: TextStyle(
              fontSize: 14,
              fontWeight: AppFont.wLight,
              color: AppColor.blackPrimary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 60.0),
            child: Input(
              txtController: phoneCtrl,
              label: '',
              errorText: phoneError,
            ),
          ),
          GestureDetector(
            onTap: () {
              phone = phoneCtrl.text;
              if (phone.length == 0) {
                setState(() {
                  phoneError = 'emptyPhone'.tr;
                });
              } else {
                setState(() {});
              }
            },
            child: Btn(languageKey: 'phone'),
          ),
        ],
      ),
    );
  }
}
