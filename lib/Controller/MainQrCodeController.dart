import 'dart:convert';

import 'package:bluecrown/Apis/api_models/get_responce_scaneventqr_model.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../common/ShowToast.dart';



class MainQrCodeController extends GetxController {
  late SharedPreferences sharedPreferences;
  RxBool showProgressBar=false.obs;
  late LogInModel userData;
  RxBool showProgressbar=false.obs;
  RxBool showCongratulation=false.obs;
  Map<String, dynamic> bodyParamsForScanEventQrForm = {};
  ScanEventQrModel? scanEventQrModel;

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
    showProgressbar.value=value;
  }
  changeCongratulation(bool value){
    showCongratulation.value=value;
  }

  getLocalData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(
        sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData != null) {
      userData = LogInModel.fromJson(jsonData);
    }}


    Future<void> callingChangePasswordInForm(String qrCode) async {
      bodyParamsForScanEventQrForm = {
        ApiKeyConstants.userId: userData.result!.id,
        ApiKeyConstants.qrCode: qrCode,
        ApiKeyConstants.token: userData.result!.token,

      };
      print("bodyParamsForScanEventQrForm:::::$bodyParamsForScanEventQrForm");
      scanEventQrModel = await ApiMethods.scanEventQrCodeApi(
          bodyParams: bodyParamsForScanEventQrForm);
      if (scanEventQrModel!.status != "0" ?? false) {
        print("Scan Event Qr Successfully complete....");
        showToastMessage(scanEventQrModel!.message!);
        changeProgressbarStatus(false);
        changeCongratulation(true);
      } else {
        print("Scan Event Qr Failed....");
        showToastMessage(scanEventQrModel!.message!);
        changeProgressbarStatus(false);
      }
    }

}