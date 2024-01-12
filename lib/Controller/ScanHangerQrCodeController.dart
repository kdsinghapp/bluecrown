import 'dart:convert';
import 'dart:math';

import 'package:bluecrown/Apis/api_models/get_response_common_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_hangjacket_model.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';
class ScanHangerQrCodeController extends GetxController {
  late SharedPreferences sharedPreferences;
  RxBool showProgressBar=false.obs;
  late LogInModel userData;
  late QRViewController _controller;
  final GlobalKey _qrKey = GlobalKey(debugLabel: 'QR');

  Map<String,String?>parameterData=Get.parameters;
  Map<String, dynamic> bodyParamsForHangJacketForm = {};
  HangJacketModel? hangJacketModel;

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



  Future<void> callingHangJacket() async {
    bodyParamsForHangJacketForm = {
      ApiKeyConstants.userId: userData.result!.id,
      ApiKeyConstants.clubId: parameterData['clubId'],
      ApiKeyConstants.qrCode:parameterData['hangerCode'],
      ApiKeyConstants.token:userData.result!.token,


    };
    print("bodyParamsForHangJacketForm:::::$bodyParamsForHangJacketForm");
    hangJacketModel = await ApiMethods.hangJacketApi(
        bodyParams: bodyParamsForHangJacketForm);
    if (hangJacketModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print("Update events Successfully complete...");
      showToastMessage(hangJacketModel!.message!);
    }else{
      print("Update events Failed....");
      changeProgressbarStatus(false);
      showToastMessage(hangJacketModel!.message!);
    }
  }


}