import 'dart:convert';

import 'package:bluecrown/Activity/ListActivity.dart';
import 'package:bluecrown/Apis/api_models/get_response_published_myevent_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Activity/AddListActivity.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_addevent_model.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';

class ChooseEventController extends GetxController{
  late SharedPreferences sharedPreferences;
  RxBool showProgressBar=false.obs;
  late LogInModel userData;
  List<DateTime?> datesList=[];
  TextEditingController timeController=TextEditingController();
  TextEditingController fullEventController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController priceController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();


  FocusNode focusDate = FocusNode();
  FocusNode focusTime = FocusNode();
  FocusNode focusDescription = FocusNode();
  FocusNode focusFullEvent=FocusNode();
  FocusNode focusPrice=FocusNode();
  final count=0.obs;
  final isDate = false.obs;
  final isTime = false.obs;
  final isDescription = false.obs;
  final isFullEvent=true.obs;
  final isPrice=false.obs;

  final formKey = GlobalKey<FormState>();
  String fromDate='',toDate='';
  Map<String, dynamic> bodyParamsForUpdateEventsForm = {};
  AddEventModel? addEventModel;
  PublishMyEventResult publishMyEventResult=Get.arguments;

  @override
  void onInit() {
    super.onInit();
    startListener();
    setValues();
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
    focusFullEvent.addListener(onFocusChange);
    focusDate.addListener(onFocusChange);
    focusTime.addListener(onFocusChange);
    focusPrice.addListener(onFocusChange);
    focusDescription.addListener(onFocusChange);
  }

  void onFocusChange() {
    isFullEvent.value = focusFullEvent.hasFocus;
    isDate.value = focusDate.hasFocus;
    isTime.value = focusTime.hasFocus;
    isPrice.value = focusPrice.hasFocus;
    isDescription.value = focusDescription.hasFocus;

  }

  openAddEventListActivity(){
    Map<String,String> data={
      'eventId':publishMyEventResult.id!,
      'clubId':publishMyEventResult.userId!,
    };
    Get.toNamed('/addListActivity',parameters: data);
  }


  void setValues(){
    fullEventController.value=TextEditingValue(text: publishMyEventResult.name??"");
    dateController.value=TextEditingValue(text: "${publishMyEventResult.fromDate} to ${publishMyEventResult.fromDate}"??"");
    timeController.value=TextEditingValue(text: publishMyEventResult.fromTime??"");
    priceController.value=TextEditingValue(text: publishMyEventResult.points??"");
    descriptionController.value=TextEditingValue(text: publishMyEventResult.description??"");
    fromDate=publishMyEventResult.fromDate!;
    toDate=publishMyEventResult.toDate!;
    update();
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

  Future<void> callingUpdateEventsForm() async {
    bodyParamsForUpdateEventsForm = {
      ApiKeyConstants.userId: userData.result!.id,
      ApiKeyConstants.eventId:publishMyEventResult.id,
      ApiKeyConstants.token:userData.result!.token,
      ApiKeyConstants.name:fullEventController.text.toString(),
      ApiKeyConstants.style: publishMyEventResult.style,
      ApiKeyConstants.description: descriptionController.text.toString(),
      ApiKeyConstants.fromDate:fromDate,
      ApiKeyConstants.toDate:toDate,
      ApiKeyConstants.minAge: publishMyEventResult.minAge,
      ApiKeyConstants.maxAge: publishMyEventResult.maxAge,
      ApiKeyConstants.points:priceController.text.toString(),
      ApiKeyConstants.fromTime:timeController.text.toString(),

    };
    print("bodyParamsForUpdateEventsForm:::::$bodyParamsForUpdateEventsForm");
    addEventModel = await ApiMethods.updateMyPublishEventsApi(
        bodyParams: bodyParamsForUpdateEventsForm);
    if (addEventModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print("Update events Successfully complete...");
      showToastMessage(addEventModel!.message!);
    }else{
      print("Update events Failed....");
      changeProgressbarStatus(false);
      showToastMessage(addEventModel!.message!);
    }
  }




}