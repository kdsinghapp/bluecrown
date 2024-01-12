import 'dart:convert';

import 'package:bluecrown/Activity/ListActivity.dart';
import 'package:bluecrown/Apis/api_constants/api_key_constants.dart';
import 'package:bluecrown/Apis/api_models/get_response_addlist_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_login_model.dart';
import 'package:bluecrown/common/ShowToast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_methods/api_methods.dart';
import '../constant/stringconstants.dart';

class AddListController extends GetxController{
  late SharedPreferences sharedPreferences;
  RxBool showProgressBar=false.obs;
  late LogInModel userData;
  AddListModel? addListModel;
  TextEditingController fullNameController=TextEditingController();
  TextEditingController ageController=TextEditingController();
  TextEditingController howManyController=TextEditingController();
  Map<String,String?> parameterData=Get.parameters;
  Map<String, dynamic> bodyParamsForAddListForm = {};


  FocusNode focusAge = FocusNode();
  FocusNode focusHowMany = FocusNode();
  FocusNode focusFullName=FocusNode();
  final count=0.obs;
  final isAge = false.obs;
  final isHowMany = false.obs;
  final isFullName=true.obs;

  final formKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    startListener();
    getLocalData();
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
    focusAge.addListener(onFocusChange);
    focusHowMany.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullName.value = focusFullName.hasFocus;
    isAge.value = focusAge.hasFocus;
    isHowMany.value = focusHowMany.hasFocus;

  }

  openInviteUsers(){
    Get.to(()=>const ListActivity());
  }
  changeProgressbarStatus(bool value){
    showProgressBar.value=value;
  }

  getLocalData() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userData = LogInModel.fromJson(jsonData);

    }
  }

  Future<void> callingBookEventForm() async {
    bodyParamsForAddListForm = {
      ApiKeyConstants.eventId:parameterData['eventId'],
      ApiKeyConstants.clubId:parameterData['clubId'],
      ApiKeyConstants.userId: userData.result!.id,
      ApiKeyConstants.token:userData.result!.token,
      ApiKeyConstants.fullName:fullNameController.text.toString(),
      ApiKeyConstants.age: ageController.text.toString(),
      ApiKeyConstants.totalPeople:howManyController.text.toString(),

    };
    print("bodyParamsForAddListForm:::::$bodyParamsForAddListForm");
    addListModel = await ApiMethods.userAddListApi(
        bodyParams: bodyParamsForAddListForm);
    if (addListModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print("Add List Successfully complete...");
      showToastMessage(addListModel!.message!);
    }else{
      print("Add List Failed....");
      changeProgressbarStatus(false);
      showToastMessage(addListModel!.message!);
    }
  }




}