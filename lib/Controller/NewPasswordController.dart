import 'package:bluecrown/Activity/ResetPasswordActivity.dart';
import 'package:bluecrown/Activity/SignUpActivity.dart';
import 'package:bluecrown/Apis/api_models/get_response_common_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';

class NewPasswordController extends GetxController{

  TextEditingController newPasswordController=TextEditingController();
  TextEditingController cnfPasswordController=TextEditingController();
  RxBool showProgressbar=false.obs;
  Map<String,String?>parameterData=Get.parameters;
  FocusNode focusCnfPassword = FocusNode();
  FocusNode focusPassword = FocusNode();

  Map<String, dynamic> bodyParamsForNewPasswordForm = {};
  CommonResponseModel? commonResponseModel;

  final isCnfPassword = false.obs;
  final isPassword = false.obs;
  final hide = true.obs;
  final cnfHide = true.obs;

  final formKey = GlobalKey<FormState>();

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
    focusPassword.addListener(onFocusChange);
    focusCnfPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isPassword.value = focusPassword.hasFocus;
    isCnfPassword.value = focusCnfPassword.hasFocus;
  }

  clickOnEye1Button() {
    hide.value = !hide.value;
  }
  clickOnEye2Button() {
    cnfHide.value = !cnfHide.value;
  }


  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }

  Future<void> callingNewPasswordInForm() async {
    bodyParamsForNewPasswordForm = {
      ApiKeyConstants.userId:parameterData['userId'],
      ApiKeyConstants.token: parameterData['token'],
      ApiKeyConstants.password:cnfPasswordController.text.toString()

    };
    print("bodyParamsForNewPassword:::::$bodyParamsForNewPasswordForm");
    commonResponseModel = await ApiMethods.newPasswordApi(
        bodyParams: bodyParamsForNewPasswordForm);
    if (commonResponseModel!.status!="0"??false ) {
      print("New Password Successfully complete....");
      showToastMessage(commonResponseModel!.message!);
      changeProgressbarStatus(false);
       Get.offNamedUntil('/loginActivity', (route) => false);
    }else{
      print("New Password Failed....");
      showToastMessage(commonResponseModel!.message!);
      changeProgressbarStatus(false);
    }
  }


}