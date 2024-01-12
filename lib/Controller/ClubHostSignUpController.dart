import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_singup_model.dart';
import '../Apis/api_models/get_usercategory_model.dart';
import '../common/ShowToast.dart';

class ClubHostSignUpController extends GetxController{
  RxBool showProgressbar=false.obs;
  RxBool categoryDataPresent=false.obs;
  TextEditingController emailPhoneController=TextEditingController();
  TextEditingController fullNameController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController categoryController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController phoneController=TextEditingController();


  FocusNode focusEmail = FocusNode();
  FocusNode focusPassword = FocusNode();
  FocusNode focusFullName=FocusNode();
  FocusNode focusCategory=FocusNode();
  FocusNode focusCity=FocusNode();
  FocusNode focusPhone=FocusNode();
  final count=0.obs;
  final isEmail = false.obs;
  final isPassword = false.obs;
  final isFullName=true.obs;
  final isCategory=false.obs;
  final isCity=false.obs;
  final isPhone=false.obs;
  final hide = true.obs;

  final formKey = GlobalKey<FormState>();
  GetUserCategoryModel? getUserCategoryModel;
  GetUserCategoryResult? selectUserCategoryModel;
  Map<String, dynamic> bodyParamsForSubmitRegistrationForm = {};
  SignUpModel? getSingUpModel;

  @override
  void onInit() {
    super.onInit();
    startListener();
    getUserCategory();
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
    focusCategory.addListener(onFocusChange);
    focusCity.addListener(onFocusChange);
    focusPassword.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isEmail.value = focusEmail.hasFocus;
    isPhone.value = focusPhone.hasFocus;
    isCategory.value = focusCategory.hasFocus;
    isCity.value = focusCity.hasFocus;
    isPassword.value = focusPassword.hasFocus;

  }

  clickOnEyeButton() {
    hide.value = !hide.value;
  }

  changeSelectedCategory(GetUserCategoryResult model){
    selectUserCategoryModel=model;
    update();
  }

  getUserCategory() async{
    getUserCategoryModel = await ApiMethods.getUserCategoryApi();
    if (getUserCategoryModel!.status!="0"??false ) {
      changeSelectedCategory(getUserCategoryModel!.result![0]);
      categoryDataPresent.value=true;
      print(" Category Successfully complete...");
    }else{
      print("Get Category Failed....");
      showToastMessage(getUserCategoryModel!.message!);
    }
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
      ApiKeyConstants.mobile:phoneController.text.toString(),
      ApiKeyConstants.address:cityController.text.toString(),
      ApiKeyConstants.lat: "22.7196",
      ApiKeyConstants.lon: "75.8577",
      ApiKeyConstants.registerId: generateRandomString(25),
      ApiKeyConstants.userCategory:selectUserCategoryModel!.id!

    };
    print("bodyParamsForHostClubSignUp:::::$bodyParamsForSubmitRegistrationForm");
    getSingUpModel = await ApiMethods.submitHostRegistrationForm(
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