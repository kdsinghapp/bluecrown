import 'package:bluecrown/Controller/LoginTypeController.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Tool/Color.dart';

class LoginTypeActivity extends StatefulWidget {
  const LoginTypeActivity({super.key});

  @override
  State<LoginTypeActivity> createState() => _LoginTypeState();
}

class _LoginTypeState extends State<LoginTypeActivity> {
  LoginTypeController controller = Get.put(LoginTypeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary3Color,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(10.0.px),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              CommonWidget.commonElevatedButton(
                  onPressed: () {
                    controller.pressButton(0);
                  },
                  text: StringConstants.createAccountAsClubHost,
                  buttonMargin: EdgeInsets.all(10.px),
                  borderRadius: 30.px,
                  height: 60.px),
              CommonWidget.commonElevatedButton(
                  onPressed: () {
                    controller.pressButton(1);
                  },
                  text: StringConstants.createAccountAsConsumer,
                  buttonMargin: EdgeInsets.all(10.px),
                  borderRadius: 30.px,
                  height: 60.px),
              CommonWidget.commonElevatedButton(
                onPressed: () {
                  controller.pressButton(2);
                },
                text: StringConstants.loginAsConsumer,
                buttonMargin: EdgeInsets.all(10.px),
                borderRadius: 30.px,
                height: 60.px,
              ),
              CommonWidget.commonElevatedButton(
                onPressed: () {
                  controller.pressButton(2);
                },
                text: StringConstants.loginAsHost,
                buttonMargin: EdgeInsets.all(10.px),
                borderRadius: 30.px,
                height: 60.px,
              ),
              /*  CommonWidget.commonElevatedButton(
                onPressed: () {
                  controller.pressButton(2);
                },
                text: StringConstants.loginAsAdmin,
                buttonMargin: EdgeInsets.all(10.px),
                borderRadius: 30.px,
                height: 60.px,
              ),  */
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
