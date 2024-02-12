import 'dart:convert';
import 'dart:math';

import 'package:bluecrown/Activity/ResetPasswordActivity.dart';
import 'package:bluecrown/Activity/SignUpActivity.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Activity/MainActivity.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';

class LoginController extends GetxController{
  RxInt count=0.obs;
  RxBool showProgressbar=false.obs;
  TextEditingController emailPhoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();

  final isEmail = false.obs;
  final isPassword = false.obs;
  final hide = true.obs;

  final formKey = GlobalKey<FormState>();
  Map<String, dynamic> bodyParamsForSubmitLoginForm = {};
  LogInModel? logInModel;
  late SharedPreferences sharedPreferences;

  @override
  void onInit() {
    super.onInit();
    startListener();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void startListener() {
    focusEmail.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isEmail.value = focusEmail.hasFocus;
    isPassword.value = focusPassword.hasFocus;
  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }


  goToSignUpActivity(){
    Get.to(()=>const SignUpActivity());
  }

  openResetPasswordActivity(){
    Get.toNamed('/resetPasswordActivity');
  }

  openHomeActivity(){
    Get.to(()=> const MainActivity());
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }


  Future<void> callingSubmitLogInForm() async {
    bodyParamsForSubmitLoginForm = {
      ApiKeyConstants.email: emailPhoneController.text.toString(),
      ApiKeyConstants.password: passwordController.text.toString(),
      ApiKeyConstants.registerId:await FirebaseMessaging.instance.getToken(),

    };
    print("bodyParamsForGetEducationLevel:::::$bodyParamsForSubmitLoginForm");
    try {
      logInModel = await ApiMethods.logInApi(
          bodyParams: bodyParamsForSubmitLoginForm);
      if (logInModel!.status != "0" ?? false) {
        saveDataSharedPreference(logInModel);
      } else {
        print("LogIn Failed....");
        showToastMessage(logInModel!.message!);
      }
    }catch(e){
      print('Error:-'+e.toString());
      showToastMessage('Server issue please try again after some time ');
    }
    changeProgressbarStatus(false);
  }
  saveDataSharedPreference(LogInModel? userdata) async{
    sharedPreferences=await SharedPreferences.getInstance();
    showToastMessage("Successfully Login Complete");
    print("LogIn Successfully complete...");
    String userDataString = jsonEncode(userdata);
    sharedPreferences.setString(StringConstants.userData, userDataString);
    changeProgressbarStatus(false);
    //openHomeActivity();
    Get.offAndToNamed('/mainActivity');

  }

}