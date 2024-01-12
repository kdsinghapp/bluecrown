import 'package:bluecrown/Apis/api_models/get_response_checkotp_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Activity/NewPasswordActivity.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';

class OtpController extends GetxController{
  RxBool showProgressbar=false.obs;

  Map<String, dynamic> bodyParamsForCheckOtpForm = {};
  CheckOtpModel? checkOtpModel;
  Map<String,String?>parameterData=Get.parameters;

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


  openNewPassword(){
    Map<String,String>data={
      'userId':checkOtpModel!.result!.id!,
      'token':checkOtpModel!.result!.token!
    };
    Get.toNamed('/newPasswordActivity',parameters: data);
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }

  Future<void> callingCheckOtpInForm(String otp) async {
    bodyParamsForCheckOtpForm = {
      ApiKeyConstants.email:parameterData['emailPhone'],
      ApiKeyConstants.otp: otp,

    };
    print("bodyParamsForBo:::::$bodyParamsForCheckOtpForm");
    checkOtpModel = await ApiMethods.checkOtpApi(
        bodyParams: bodyParamsForCheckOtpForm);
    if (checkOtpModel!.status!="0"??false ) {
      print("Forgot Password Successfully complete....");
      showToastMessage(checkOtpModel!.message!);
      changeProgressbarStatus(false);
      openNewPassword();
    }else{
      print("Forgot Password Failed....");
      showToastMessage(checkOtpModel!.message!);
      changeProgressbarStatus(false);
    }
  }

}