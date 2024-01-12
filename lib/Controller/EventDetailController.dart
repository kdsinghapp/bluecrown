import 'dart:convert';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../Apis/api_models/get_response_parties_model.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';


class EventDetailController extends GetxController {
  RxInt count=0.obs;
  RxBool showNearEventsProgressBar=true.obs;
  GetPartiesModel? getPartiesModel;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  Map<String,String ?> parameterData=Get.parameters;



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
  openCreateListActivity(String eventId){
    Map<String,String> data={
     'eventId':eventId,
      'userId':userData.result!.id!,
      'token':userData.result!.token!,
    };
    Get.toNamed('/listActivity',parameters: data);
  }

  getLocalData() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userData = LogInModel.fromJson(jsonData);
      getParties(userData.result!.id!);
    }
  }

  changeShowNearEventsProgressBar(bool value){
    showNearEventsProgressBar.value=value;
  }




  getParties(String userId) async{
    getPartiesModel = await ApiMethods.getPartiesApi(userId: userId, categoryId: parameterData['categoryId']!);
    if (getPartiesModel!.status!="0"??false ) {
      print("Get Parties Successfully complete...");
      changeShowNearEventsProgressBar(false);
    }else{
      print("Get Parties Failed....");
      changeShowNearEventsProgressBar(true);
      showToastMessage(getPartiesModel!.message!);
    }
  }

}