import 'package:bluecrown/Controller/LoginController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../common/validations.dart';
class LoginActivity extends StatefulWidget {
  const LoginActivity({super.key});

  @override
  State<LoginActivity> createState() => _LoginState();
}

class _LoginState extends State<LoginActivity> {
  LoginController controller=Get.put(LoginController());


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor:primary3Color ,
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(StringConstants.login,style: MyTextStyle.titleStyle30bb,),
                  Text(StringConstants.logInToContinue,style: MyTextStyle.titleStyle16b,),
                  SizedBox(height: 50.px,),
                  CommonWidget.commonTextField(
                      validator: (value)=>FormValidator.isEmailValid(value: value),
                      controller: controller.emailPhoneController,
                      autofillHint: const [AutofillHints.email],
                      isCard: controller.isEmail.value,
                      focusNode: controller.focusEmail,
                      hintText: StringConstants.emailAddressMobileNumber,
                      hintTextColor: controller.isEmail.value,
                      margin: EdgeInsets.all(10.px)
                  ),
                  CommonWidget.commonTextField(
                    validator: (value) => FormValidator.isPasswordValid(value: value),
                    controller: controller.passwordController,
                    isCard: controller.isPassword.value,
                    focusNode: controller.focusPassword,
                    obscureText: controller.hide.value,
                    hintText: StringConstants.password,
                    hintTextColor: controller.isEmail.value,
                    margin: EdgeInsets.all(10.px),
                    suffixIcon: GestureDetector(
                      onTap: () => controller.clickOnEyeButton(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Obx(() => Icon(
                            controller.hide.value
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: controller.isPassword.value
                                ? text2Color
                                : text2Color,
                            size: 18.px,
                          )),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.px,),
                  GestureDetector(
                    onTap: (){
                      controller.openResetPasswordActivity();
                    },
                    child: SizedBox(
                      width: 130.px,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(StringConstants.forgotYourPassword,style: MyTextStyle.titleStyle12bb,),
                          const Divider(height: 1,color: textColor,thickness: 1,)
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.px,),
                   Obx(() => controller.showProgressbar.value?
                    Container(
                width: double.infinity,
                height: 50,
                margin: EdgeInsets.all(10.px),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(25.px)),
                    color: primaryColor
                ),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(
                        height:30,width:30,
                        child:CircularProgressIndicator(color:primary3Color,)
                    ),
                    const SizedBox(width: 10,),
                    Text("Loading...",style: MyTextStyle.titleStyle16bw,),

                  ],
                ),
              ):
                   CommonWidget.commonElevatedButton(onPressed: (){
                     if(controller.formKey.currentState!.validate()){
                       controller.changeProgressbarStatus(true);
                       controller.callingSubmitLogInForm();
                     }

                   }
                       ,text: StringConstants.login,
                       buttonMargin: EdgeInsets.all(10.px),
                       borderRadius: 30.px,
                       height: 60.px),
                     ),

                  SizedBox(height: 10.px,),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        controller.goToSignUpActivity();
                      },
                      child: RichText(
                          text:  TextSpan(
                              style: const TextStyle(fontWeight: FontWeight.bold),
                              children: [
                                TextSpan(
                                    text: 'Do not have an account? ',
                                    style: TextStyle(color: text2Color,fontWeight: FontWeight.w400,fontSize: 14.px)),
                                TextSpan(
                                    text: 'Sign Up',
                                    style: MyTextStyle.titleStyle16bb),
                              ])),
                    ),
                  ),
                  SizedBox(height: 10.px,),
                  Text(StringConstants.or,style: MyTextStyle.titleStyle16bb,),
                  SizedBox(height: 10.px,),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.px))
                    ),
                    child:  Container(
                      height: 50.px,
                      width: 50.px,
                      padding: EdgeInsets.all(10.px),
                      child: Image.asset(IconsConstants.googleIcon),
                    ),
                  )






                ],
              ),
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}