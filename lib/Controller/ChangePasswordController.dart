import 'package:bluecrown/Apis/api_models/get_response_common_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';

class ChangePasswordController extends GetxController{

  TextEditingController oldPasswordController=TextEditingController();
  TextEditingController newPasswordController=TextEditingController();
  TextEditingController cnfPasswordController=TextEditingController();
  RxBool showProgressbar=false.obs;
  Map<String,String?>parameterData=Get.parameters;
  FocusNode focusCnfPassword = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusOldPassword = FocusNode();

  Map<String, dynamic> bodyParamsForChangePasswordForm = {};
  CommonResponseModel? commonResponseModel;

  final isOldPassword = false.obs;
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

  Future<void> callingChangePasswordInForm() async {
    bodyParamsForChangePasswordForm = {
      ApiKeyConstants.userId:parameterData['userId'],
      ApiKeyConstants.token: parameterData['token'],
      ApiKeyConstants.oldPassword:oldPasswordController.text.toString(),
      ApiKeyConstants.newPassword:cnfPasswordController.text.toString()

    };
    print("bodyParamsForChangePassword:::::$bodyParamsForChangePasswordForm");
    commonResponseModel = await ApiMethods.changePasswordApi(
        bodyParams: bodyParamsForChangePasswordForm);
    if (commonResponseModel!.status!="0"??false ) {
      print("Change Password Successfully complete....");
      showToastMessage(commonResponseModel!.result!);
      changeProgressbarStatus(false);
    }else{
      print("Change Password Failed....");
      showToastMessage(commonResponseModel!.message!);
      changeProgressbarStatus(false);
    }
  }


}