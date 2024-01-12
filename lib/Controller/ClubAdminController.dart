import 'dart:convert';

import 'package:bluecrown/Apis/api_models/get_response_published_myevent_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Activity/ConsumerActivity.dart';
import '../Activity/DownloadQrImageActivity.dart';
import '../Activity/PublishEventActivity.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';


class ClubAdminController extends GetxController{
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  RxBool showProgressBar=true.obs;
  Map<String, dynamic> bodyParamsForPublishMyEventForm = {};
  PublishMyEventModel? publishMyEventModel;
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

  openAdminWardrobeActivity(){
    Map<String,String> data={
      'clubId':userData.result!.id!
    };
    Get.toNamed('/adminWardrobeActivity',parameters: data);
  }
  openBookingRequestActivity(){
    Map<String,String> data={
      'clubId':userData.result!.id!
    };
    Get.toNamed('/bookingRequestActivity',parameters: data);
  }
  openCreateWardrobeQrCodeActivity(){
    Map<String,String> data={
      'clubId':userData.result!.id!,
      'token':userData.result!.token!
    };
    Get.toNamed('/createWardrobeQrCodeActivity',parameters: data);
  }
  openChangeEventActivity(int index) async{
     await Get.toNamed('/changeMyPublishEventActivity',arguments: publishMyEventModel!.result![index]);
    changeProgressbarStatus(true);
    getMyPublishEventsList(userData.result!.id!);
  }
  openPublishEventActivity() async{
   await Get.to(()=>const PublishEventActivity());
   changeProgressbarStatus(true);
   getMyPublishEventsList(userData.result!.id!);
  }
  openConsumerActivity(){
    Get.to(()=> const ConsumerActivity());
  }
  openDownloadActivity(String qrCode){
    print("Qr Code:-"+qrCode);
    if(qrCode.isNotEmpty){
      Get.to(()=> DownloadQrImageActivity(price: qrCode,));
    }else{
      showToastMessage('Invalid Qr Code ...');
    }

  }

  changeProgressbarStatus(bool value){
    showProgressBar.value=value;
  }

  getLocalData() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userData = LogInModel.fromJson(jsonData);
      getMyPublishEventsList(userData.result!.id!);

    }
  }
  Future<void> getMyPublishEventsList(String userId) async {

    publishMyEventModel = await ApiMethods.getPublishMyEventApi(userId: userId);
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