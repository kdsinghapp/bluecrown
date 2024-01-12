import 'dart:convert';

import 'package:bluecrown/Activity/ClubActivity.dart';
import 'package:bluecrown/Activity/MainQrCodeActivity.dart';
import 'package:bluecrown/Activity/MineOfferActivity.dart';
import 'package:bluecrown/Apis/api_constants/api_key_constants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Activity/HowToEarnPointsActivity.dart';
import '../Activity/UsePointClubsActivity.dart';
import '../Activity/UsePointsActivity.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../common/ShowToast.dart';



class PointsController extends GetxController{
  late SharedPreferences sharedPreferences;
  RxBool showProgressBar=false.obs;
  RxString points='0'.obs;
  LogInModel? userData;

  Map<String, dynamic> bodyParamsForGetProfileForm = {};
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


  openHowToEarnPointsActivity(){
    Get.to(()=> const HowToEarnPointsActivity());
  }
  openUsePointsActivity(){
    Map<String,String> data={
      'points':userData!.result!.wallet!
    };
   // Get.to(()=>const UserPointsActivity());
    Get.toNamed('/usePointClubsActivity',parameters: data);
  }
  openMainQrCodeActivity(){
    Get.to(()=> const MainQrCodeActivity());
  }

  changeCurrentPoint(String value){
    points.value=value;

  }


  getLocalData() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userData = LogInModel.fromJson(jsonData);
      callingSubmitLogInForm(userData!.result!.id!,userData!.result!.token!);
    }
  }

  void callingSubmitLogInForm(String userId,String token) async {
    bodyParamsForGetProfileForm = {
      ApiKeyConstants.userId: userId,
      ApiKeyConstants.token: token,

    };
    print("bodyParamsForGetProfile:::::$bodyParamsForGetProfileForm");
    userData = await ApiMethods.getProfileApi(
        bodyParams: bodyParamsForGetProfileForm);
    if (userData!.status!="0"??false ) {
      changeCurrentPoint(userData!.result!.wallet!);
      print(userData!.result!.wallet!);
    }else{
      print("LogIn Failed....");
      showToastMessage(userData!.message!);
    }
  }

}