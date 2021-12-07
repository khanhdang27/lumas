import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lumas/general/controllers.dart';
import 'package:lumas/screens/components/components.dart';

class ClientProfileScreen extends StatefulWidget {
  @override
  _ClientProfileScreenState createState() => _ClientProfileScreenState();
}

class _ClientProfileScreenState extends State<ClientProfileScreen> {
  ClientController clientController = Get.find<ClientController>();

  @override
  Widget build(BuildContext context) {
    return Layout(
      child: Container(
        child: Column(
          children: [
            Text('User Profile ${clientController.client.name}'),
          ],
        ),
      ),
    );
  }
}
