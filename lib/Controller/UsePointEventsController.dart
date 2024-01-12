
import 'package:bluecrown/Apis/api_models/get_response_published_myevent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Activity/ConsumerActivity.dart';
import '../Activity/DownloadQrImageActivity.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';


class UsePointEventsController extends GetxController{
  TextEditingController searchController=TextEditingController();
  RxBool showProgressBar=true.obs;
  Map<String,String?> parameterData=Get.parameters;
  Map<String, dynamic> bodyParamsForPublishMyEventForm = {};
  PublishMyEventModel? publishMyEventModel;
  @override
  void onInit() {
    super.onInit();
    getMyPublishEventsList(parameterData['clubId']!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  openChooseEventActivity(int index) async{
    await Get.toNamed('/chooseEventActivity',arguments: publishMyEventModel!.result![index]);
  }

  openConsumerActivity(){
    Get.to(()=> const ConsumerActivity());
  }
  openUsePointActivity(String price){
    Map<String,String> data={
      'clubId':parameterData['clubId']!,
      'price':price,
      'points':parameterData['points']!
    };
    Get.toNamed('/usePointsActivity',parameters: data);
  }

  changeProgressbarStatus(bool value){
    showProgressBar.value=value;
  }

  Future<void> getMyPublishEventsList(String clubId) async {

    publishMyEventModel = await ApiMethods.getPublishMyEventApi(userId: clubId);
    if (publishMyEventModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print("Get My published events Successfully complete...");
    }else{
      print("Get My published events Failed....");
      changeProgressbarStatus(false);
      showToastMessage(publishMyEventModel!.message!);
    }
  }
}