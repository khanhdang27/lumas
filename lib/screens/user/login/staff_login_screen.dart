import 'package:lumas/general/configs.dart';
import 'package:lumas/screens/components/login/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffLoginScreen extends StatefulWidget {
  @override
  _StaffLoginScreenState createState() => _StaffLoginScreenState();
}

class _StaffLoginScreenState extends State<StaffLoginScreen> {
  TextEditingController emailEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipPath(
          clipper: MyClipperStaff(),
          child: Container(
            padding: EdgeInsets.all(50),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: AppColor.pinkPrimary),
            child: SizedBox(child: Image.asset(AppAsset.logo2)),
          ),
        ),
        Text(
          'Staff Login',
          style: TextStyle(fontSize: 30),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 0.0),
          child: Input(
            label: 'email'.tr,
            txtController: emailEditingController,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
          child: Input(
            txtController: passwordEditingController,
            label: 'password'.tr,
            obscureText: true,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 20, bottom: 40),
              child: GestureDetector(
                child: Text(
                  'forgotPassword'.tr + '?',
                  style: TextStyle(
                    color: AppColor.blackPrimary,
                    fontSize: 14,
                    fontWeight: AppFont.wLight,
                  ),
                ),
                onTap: () {
                  // Navigator.pushNamed(context, AppRoute.forgotPw);
                },
              ),
            ),
          ],
        ),
        Btn(
          languageKey: 'login',
          callback: () {
            // if (emailEditingController.text.isNotEmpty &&
            //     passwordEditingController.text.isNotEmpty) {
            //   AppBloc.authBloc.add(
            //     AuthLoginStaff(
            //       email: emailEditingController.text,
            //       password: passwordEditingController.text,
            //     ),
            //   );
            // }
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: GestureDetector(
            child: Text(
              'forClient'.tr,
              style: TextStyle(
                color: AppColor.blackPrimary,
                fontSize: 14,
                fontWeight: AppFont.wLight,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        )
      ],
    );
  }
}

class MyClipperStaff extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(size.width / 2, size.height - 50, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
