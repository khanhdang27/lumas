import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lumas/general/configs.dart';
import 'package:lumas/general/controllers.dart';
import 'package:lumas/screens/components/components.dart';
import 'package:lumas/general/services.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ClientController clientController = Get.find<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        child: Column(
          children: [
            Text('User Home'),
            GestureDetector(
              child: Text(
                'profile'.tr,
                style: TextStyle(
                    fontSize: 25
                ),
              ),
              onTap: () {
                clientController.getProfile();
              },
            ),
            GestureDetector(
              child: Text(
                'logout'.tr,
                style: TextStyle(
                  fontSize: 25
                ),
              ),
              onTap: () {
                clientController.logout();
              },
            ),
          ],
        ),
      ),
    );
  }
}
