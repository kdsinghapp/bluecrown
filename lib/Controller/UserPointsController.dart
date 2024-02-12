
import 'dart:convert';

import 'package:bluecrown/Apis/api_models/get_addpurchaseevent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../Tool/MyTextStyle.dart';
import '../common/ShowToast.dart';
import '../constant/iconsconstants.dart';
import '../constant/stringconstants.dart';


class UserPointsController extends GetxController{
  RxBool showNearEventsProgressBar=false.obs;
  Map<String,String?> parameterData=Get.parameters;
  RxBool showProgressBar=false.obs;
  Map<String, dynamic> bodyParamsForAddPurchaseEventForm = {};
  AddPurchaseEventModel? addPurchaseEventModel;
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
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

  Future<void> callingAddPurchaseEventsForm() async {
    bodyParamsForAddPurchaseEventForm = {
      ApiKeyConstants.userId: userData.result!.id,
      ApiKeyConstants.eventId:parameterData['eventId'],
      ApiKeyConstants.clubId:parameterData['clubId'],
      ApiKeyConstants.amount: parameterData['price'],

    };
    print("bodyParamsForAddPurchaseEvent:::::$bodyParamsForAddPurchaseEventForm");
    addPurchaseEventModel = await ApiMethods.addPurchaseEventApi(
        bodyParams: bodyParamsForAddPurchaseEventForm);
    if (addPurchaseEventModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      openSuccessBox(Get.context!);
      print("Add events Successfully complete...");
      showToastMessage(addPurchaseEventModel!.message!);
    }else{
      print("Add events Failed....");
      changeProgressbarStatus(false);
      showToastMessage(addPurchaseEventModel!.message!);
    }
  }




  /// Show Send Request Box...
  void openSuccessBox(BuildContext context){
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        title:  Center(child: Text("Strömpis Entry",style: MyTextStyle.titleStyle24bb,)),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
            height: 260.px,width: MediaQuery.of(context).size.width-60.px,
            padding: EdgeInsets.all(10.px),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconsConstants.subCrownIcon, height: 40.px, width: 50.px, fit: BoxFit.fill,),
                    SizedBox(width: 10.px,),
                    Text('${parameterData['price']}', style: MyTextStyle.titleStyle20bb,),
                  ],
                ),
                SizedBox(height: 30.px,),
                Image.asset(IconsConstants.doneIcon,fit: BoxFit.cover,width: 100.px,height: 100.px,),
              ],
            )
        ),
        alignment: Alignment.center,

      ),
    );
  }

}