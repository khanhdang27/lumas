import 'package:get/get.dart';
import 'package:lumas/general/configs.dart';
import 'package:lumas/general/controllers.dart';
import 'package:lumas/screens/components/login/components.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lumas/general/screens.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController usernameEditingController = TextEditingController();
  TextEditingController passwordEditingController = TextEditingController();

  ClientController clientController = Get.find<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              padding: EdgeInsets.all(50),
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(color: AppColor.pinkPrimary),
              child: SizedBox(child: Image.asset(AppAsset.logo2)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 0.0),
            child: Input(
              label: 'userName'.tr,
              txtController: usernameEditingController,
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
                    Get.toNamed(AppRoute.CLIENT_FORGOT);
                  },
                ),
              ),
            ],
          ),
          Btn(
            languageKey: 'login'.tr,
            callback: () {
              if (usernameEditingController.text.isNotEmpty &&
                  passwordEditingController.text.isNotEmpty) {
                clientController.login(
                  username: usernameEditingController.text,
                  password: passwordEditingController.text,
                );
              }
            },
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Text(
                  'signUp'.tr,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: AppFont.wLight,
                  ),
                ),
                onTap: () {
                  // Navigator.pushNamed(context, AppRoute.signUp);
                  Get.toNamed(AppRoute.CLIENT_SIGNUP);
                },
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              child: Text(
                'forStaffOnly'.tr,
                style: TextStyle(
                  color: AppColor.blackPrimary,
                  fontSize: 14,
                  fontWeight: AppFont.wLight,
                ),
              ),
              onTap: () {
                // Navigator.pushNamed(context, AppRoute.staffLogin);
              },
            ),
          )
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
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
