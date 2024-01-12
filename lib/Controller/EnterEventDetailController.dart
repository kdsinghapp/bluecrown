
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Activity/AdminWardrobeActivity.dart';
import '../Activity/CreateQrActivity.dart';


class EnterEventDetailController extends GetxController{
  RxBool showNearEventsProgressBar=false.obs;
  TextEditingController eventNameController=TextEditingController();
  TextEditingController timeController=TextEditingController();
  TextEditingController styleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();


  FocusNode focusDescription = FocusNode();
  FocusNode focusTime = FocusNode();
  FocusNode focusEventName = FocusNode();
  FocusNode focusStyle=FocusNode();
  final count=0.obs;
  final RxDouble maxAge=80.0.obs;
  final RxDouble minAge=18.0.obs;
  final RxDouble points=50.0.obs;
  final RxDouble entraceCost=70.0.obs;
  final isDescription = false.obs;
  final isTime = false.obs;
  final isEventName = false.obs;
  final isStyle=false.obs;

  final formKey = GlobalKey<FormState>();
  Map<String,String?> parameterData=Get.parameters;

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
  changeAge(double value){
    maxAge.value=value;
  }
  changePoints(double value){
    points.value=value;
  }
  changeEntranceCost(double value){
    entraceCost.value=value;
  }
  void startListener() {
    focusEventName.addListener(onFocusChange);
    focusTime.addListener(onFocusChange);
    focusStyle.addListener(onFocusChange);
    focusDescription.addListener(onFocusChange);

  }

  void onFocusChange() {
    isEventName.value = focusEventName.hasFocus;
    isTime.value = focusTime.hasFocus;
    isStyle.value = focusStyle.hasFocus;
    isDescription.value = focusDescription.hasFocus;


  }

  openCreateQrActivity(){
    Map<String,String> data={
      'name':eventNameController.text.toString(),
      'date_from':parameterData['date_from']!,
      'date_end':parameterData['date_end']!,
      'time':timeController.text.toString(),
      'style':styleController.text.toString(),
      'description':descriptionController.text.toString(),
      'maxAge':maxAge.toStringAsFixed(0),
      'minAge':minAge.toStringAsFixed(0),
      'point':points.toStringAsFixed(0),
      'entranceCost':entraceCost.toStringAsFixed(0)
    };
    print(data);
    Get.toNamed('/createQrActivity',parameters: data);
  }



}