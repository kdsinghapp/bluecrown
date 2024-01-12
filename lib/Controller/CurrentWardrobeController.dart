
import 'dart:convert';

import 'package:bluecrown/Activity/MineOfferActivity.dart';
import 'package:bluecrown/Apis/api_models/get_response_currentjacket_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';


class CurrentWardrobeController extends GetxController{
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  RxBool showProgressbar=true.obs;
  RxBool presentData=false.obs;

  GetCurrentJacketModel? getCurrentJacketModel;

  @override
  void onInit() {
    super.onInit();
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

  openMineOfferActivity(){
   // Get.to(()=> const MineOfferActivity());
  }
  changeShowProgressBar(bool value){
    showProgressbar.value=value;
  }
  changePresentData(bool value){
    presentData.value=value;
  }

  getLocalData() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userData = LogInModel.fromJson(jsonData);
      getCurrentJacket(userData.result!.id!);
    }
  }

  getCurrentJacket(String userId) async{
    getCurrentJacketModel = await ApiMethods.getCurrentJacketApi(userId: userId);
    if (getCurrentJacketModel!.status!="0"??false ) {
      print(" Get Clubs Successfully complete...");
      changeShowProgressBar(false);
      changePresentData(true);
    }else{
      print("Get Clubs Failed....");
      changeShowProgressBar(false);
      changePresentData(false);
      showToastMessage(getCurrentJacketModel!.message!);
    }
  }

}