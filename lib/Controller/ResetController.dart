
import 'package:bluecrown/Activity/OtpActivity.dart';
import 'package:bluecrown/Apis/api_models/get_response_forgotpassword_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';

class ResetPasswordController extends GetxController{
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  RxBool showProgressbar=false.obs;
  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  final isEmail = false.obs;
  final isPhone = false.obs;
  RxInt selectedType=0.obs;
  RxBool nextVisible=false.obs;

  Map<String, dynamic> bodyParamsForForgotPasswordForm = {};
  ForgotPasswordModel? forgotPasswordModel;

  @override
  void onInit() {
    super.onInit();
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
    focusPhone.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
  }

  void onFocusChange() {
    isPhone.value = focusPhone.hasFocus;
    isEmail.value = focusEmail.hasFocus;

  }

  changeSelectedType(int index){
    selectedType.value=index;
  }

changeVisibility(bool value){
    nextVisible.value=value;
}

  openOtpActivity(String emailPhone){
    Map<String,String>data={
      'emailPhone':emailPhone
    };
    Get.toNamed('/otpActivity',parameters: data);
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }

  Future<void> callingForgotPasswordInForm(String type) async {
    bodyParamsForForgotPasswordForm = {
      ApiKeyConstants.email: type=='Email'?emailController.text.toString():phoneController.text.toString(),
      ApiKeyConstants.type: type,

    };
    print("bodyParamsForGetEducationLevel:::::$bodyParamsForForgotPasswordForm");
    forgotPasswordModel = await ApiMethods.forgotPasswordApi(
        bodyParams: bodyParamsForForgotPasswordForm);
    if (forgotPasswordModel!.status!="0"??false ) {
      print("Forgot Password Successfully complete....");
      showToastMessage(forgotPasswordModel!.message!);
      changeProgressbarStatus(false);
      openOtpActivity(type=='Email'?emailController.text.toString():phoneController.text.toString(),);
    }else{
      print("Forgot Password Failed....");
      showToastMessage(forgotPasswordModel!.message!);
      changeProgressbarStatus(false);
    }
  }

}