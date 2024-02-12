
import 'dart:convert';

import 'package:bluecrown/Apis/api_models/get_response_published_myevent_model.dart';
import 'package:bluecrown/Apis/api_models/get_walletbyclubid_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Activity/ConsumerActivity.dart';
import '../Activity/DownloadQrImageActivity.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';


class UsePointEventsController extends GetxController{
  TextEditingController searchController=TextEditingController();
  RxBool showProgressBar=true.obs;
  RxString walletAmount='0'.obs;
  Map<String,String?> parameterData=Get.parameters;
  Map<String, dynamic> bodyParamsForPublishMyEventForm = {};
  PublishMyEventModel? publishMyEventModel;
  GetClubWalletModel? getClubWalletModel;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  @override
  void onInit() {
    super.onInit();
    getLocalData();
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
  openUsePointActivity(String price,String eventId){
    Map<String,String> data={
      'clubId':parameterData['clubId']!,
      'eventId':eventId,
      'price':price,
      'points':walletAmount.value
      //'points':parameterData['points']!
    };
    Get.toNamed('/usePointsActivity',parameters: data);
  }

  changeProgressbarStatus(bool value){
    showProgressBar.value=value;
  }

  getLocalData() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userData = LogInModel.fromJson(jsonData);
      getWalletAccordingClubIdUserId(userData.result!.id!,parameterData['clubId']!);
    }
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

  Future<void> getWalletAccordingClubIdUserId(String userId,String clubId) async {

    getClubWalletModel = await ApiMethods.getWalletAmountAccordingClubIdApi(userId:userId,clubId: clubId,);
    if (getClubWalletModel!.status!="0"??false ) {
      walletAmount.value=getClubWalletModel!.result!.wallet??'0';
      print("Get Club Wallet Amount Successfully complete...");
    }else{
      print("Get Club Wallet Amount Failed....");
      showToastMessage('Wallet amount not found');
    }
  }
}