import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_singup_model.dart';
import '../common/ShowToast.dart';

class AddVipUserController extends GetxController{
  RxBool showProgressbar=false.obs;
  TextEditingController emailPhoneController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController fullNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController dateOfBirthController=TextEditingController();


  FocusNode focusEmail = FocusNode();
  FocusNode focusPhone = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusFullName=FocusNode();
  FocusNode focusDateOfBirth=FocusNode();
  final count=0.obs;
  final isEmail = false.obs;
  final isPhone = false.obs;
  final isPassword = false.obs;
  final isFullName=true.obs;
  final isDateOfBirth=false.obs;
  final hide = true.obs;

  final formKey = GlobalKey<FormState>();

  Map<String, dynamic> bodyParamsForSubmitRegistrationForm = {};
  SignUpModel? getSingUpModel;

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
  increaseCount(){
    count.value=count.value++;
  }
  void startListener() {
    focusFullName.addListener(onFocusChange);
    focusEmail.addListener(onFocusChange);
    focusPhone.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
    focusDateOfBirth.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
    isPassword.value = focusPassword.hasFocus;
    isDateOfBirth.value = focusDateOfBirth.hasFocus;

  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }

  setDOB(String value){
    dateOfBirthController.value=TextEditingValue(text: value.substring(0,10));
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }
  String generateRandomString(int len) {
    var r = Random();
    return String.fromCharCodes(List.generate(len, (index) => r.nextInt(33) + 89));
  }
  Future<void> callingSubmitRegistrationForm() async {
    bodyParamsForSubmitRegistrationForm = {
      ApiKeyConstants.fullName:fullNameController.text.toString(),
      ApiKeyConstants.email: emailPhoneController.text.toString(),
      ApiKeyConstants.password: passwordController.text.toString(),
      ApiKeyConstants.dob:dateOfBirthController.text.toString(),
      ApiKeyConstants.mobile:phoneController.text.toString(),
      ApiKeyConstants.lat: "22.7196",
      ApiKeyConstants.lon: "75.8577",
      ApiKeyConstants.registerId: generateRandomString(25),

    };
    print("bodyParamsForGetEducationLevel:::::$bodyParamsForSubmitRegistrationForm");
    getSingUpModel = await ApiMethods.submitVipUserRegistrationForm(
        bodyParams: bodyParamsForSubmitRegistrationForm);
    if (getSingUpModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print("Registration Successfully complete...");
      showToastMessage("Registration Successfully complete...");
      Get.back();
    }else{
      print("Registration Failed....");
      changeProgressbarStatus(false);
      showToastMessage(getSingUpModel!.message!);
    }
  }


}