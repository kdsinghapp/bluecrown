import 'dart:convert';

import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Activity/AdminClubsRequestActivity.dart';
import '../Activity/ChangePasswordActivity.dart';
import '../Activity/ClubAdminActivity.dart';
import '../Activity/LogoutActivity.dart';
import '../Activity/NotificationActivity.dart';
import '../Activity/PrivacyPolicyActivity.dart';
import '../Activity/SupportActivity.dart';
import '../Activity/TermsConditionsActivity.dart';
import '../Apis/api_models/get_response_login_model.dart';


class MoreController extends GetxController {
  RxBool showProgressbar=false.obs;
  RxBool showDeleteProgressbar=false.obs;
  RxBool isPresentData=false.obs;
  RxInt count=0.obs;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  List<String> list1 = [StringConstants.notification,StringConstants.changePassword,StringConstants.myBookingEvent];
  List<String> list2= [StringConstants.support,StringConstants.termsCondition,StringConstants.privacyPolicy];
  List mainIconList=[IconsConstants.notificationIcon,IconsConstants.passwordIcon,IconsConstants.userIcon];
  List moreIconList=[IconsConstants.supportIcon,IconsConstants.termsIcon,IconsConstants.privacyIcon];
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
  changeCount(int value){
    count.value=value;
  }


  openMainProfilePages(int index)  async {
    switch(index){
      case 0:{
        Map<String,String>data={
          'userId':userData.result!.id!,
          'token':userData.result!.token!
        };
      Get.toNamed('/notificationActivity',parameters:data );

      }
      break;
      case 1:{
        Map<String,String>data={
          'userId':userData.result!.id!,
          'token':userData.result!.token!
        };
         Get.toNamed('/changePasswordActivity',parameters: data);
      }
      break;
      case 2:{
        Map<String,String>data={
          'userId':userData.result!.id!,
          'token':userData.result!.token!
        };
        Get.toNamed('/myBookingEventActivity',parameters: data);
      }
      break;
    }
  }
  openMoreProfilePages(int index){
    switch(index){
      case 0:{
        Get.to(()=>const SupportActivity());
      }
      break;
      case 1:{
        Get.to(()=>const TermsConditionsActivity());
      }
      break;
      case 2:{
        Get.to(()=> const PrivacyPolicyActivity());
      }
      break;
    }
  }
  openForClubHost(){
    Get.to(()=>const ClubAdminActivity());
  }
  openForAdmin(){
    Get.to(()=>const AdminClubsRequestActivity());
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }
  changeDeleteProgressbarStatus(bool value){
    showDeleteProgressbar.value=value;
  }

  getLocalData() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userData = LogInModel.fromJson(jsonData);
      isPresentData.value=true;
    }
  }

  openLogoutActivity(){
    Get.to(()=>const LogoutActivity());
  }

}