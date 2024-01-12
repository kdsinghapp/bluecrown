
import 'dart:convert';
import 'package:bluecrown/Apis/api_models/get_response_addevent_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_login_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';


class CreateQrController extends GetxController{
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  RxBool showProgressBar=false.obs;

  Map<String,String?> parameterData=Get.parameters;
  Map<String, dynamic> bodyParamsForCreateEventsForm = {};
  AddEventModel? addEventModel;

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

  Future<void> callingCreateEventsForm() async {
    bodyParamsForCreateEventsForm = {
      ApiKeyConstants.userId: userData.result!.id,
      ApiKeyConstants.token:userData.result!.token,
      ApiKeyConstants.name:parameterData['name'],
      ApiKeyConstants.style: parameterData['style'],
      ApiKeyConstants.description: parameterData['description'],
      ApiKeyConstants.fromDate:parameterData['date_from'],
      ApiKeyConstants.toDate:parameterData['date_end'],
      ApiKeyConstants.minAge: parameterData['minAge'],
      ApiKeyConstants.maxAge: parameterData['maxAge'],
      ApiKeyConstants.points:parameterData['point'],
      ApiKeyConstants.fromTime:parameterData['time'],
      ApiKeyConstants.entranceCost:parameterData['entranceCost'],

    };
    print("bodyParamsForGetEducationLevel:::::$bodyParamsForCreateEventsForm");
    addEventModel = await ApiMethods.addEventsApi(
        bodyParams: bodyParamsForCreateEventsForm);
    if (addEventModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print("Add events Successfully complete...");
      showToastMessage(addEventModel!.message!);
    }else{
      print("Add events Failed....");
      changeProgressbarStatus(false);
      showToastMessage(addEventModel!.message!);
    }
  }

}