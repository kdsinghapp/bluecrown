import 'package:bluecrown/Apis/api_models/get_response_addhangermodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';

class CreateWardrobeController extends GetxController {
  TextEditingController valueController=TextEditingController();
  TextEditingController nameController=TextEditingController();
  RxBool showProgressBar=false.obs;
  RxBool showQrImage=false.obs;

  Map<String,String?> parameterData=Get.parameters;


  Map<String, dynamic> bodyParamsForAddWardrobeQrForm = {};
  AddHangerModel? addHangerModel;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeShowQrImage(bool value){
    showQrImage.value=value;
  }
  changeShowProgressBar(bool value){
    showProgressBar.value=value;
  }
  openClubAllHangerActivity(){
    Map<String,String> data={
      'clubId':parameterData['clubId']!
    };
    Get.toNamed('/clubAllHangerListActivity',parameters: data);
  }

  Future<void> callingUpdateEventsForm() async {
    bodyParamsForAddWardrobeQrForm = {
      ApiKeyConstants.clubId: parameterData['clubId'],
      ApiKeyConstants.token: parameterData['token'],
      ApiKeyConstants.name:nameController.text.toString(),
      ApiKeyConstants.qrCode: valueController.text.toString(),

    };
    print("bodyParamsForAddHangerForm:::::$bodyParamsForAddWardrobeQrForm");
    addHangerModel = await ApiMethods.addHangerListApi(
        bodyParams: bodyParamsForAddWardrobeQrForm);
    if (addHangerModel!.status!="0"??false ) {
      changeShowProgressBar(false);
      print("Add Hanger Successfully complete...");
      showToastMessage(addHangerModel!.message!);
    }else{
      print("Add Hanger Failed....");
      changeShowProgressBar(false);
      showToastMessage(addHangerModel!.message!);
    }
  }




}