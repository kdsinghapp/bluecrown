
import 'dart:convert';

import 'package:bluecrown/Apis/api_models/get_response_getclubrequest_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_login_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_updateclubrequest_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Activity/AddVipClubHostActivity.dart';
import '../Activity/PointsActivity.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_getcubslist_model.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';


class AdminClubsRequestController extends GetxController {
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  RxInt tab=0.obs;
  RxBool showProgressbar=true.obs;
  RxBool showLoading=false.obs;

  GetClubsModel? getClubsModel;
  GetClubRequestModel? getClubRequestModel;
  Map<String, dynamic> bodyParamsForUpdateClubRequestForm = {};
  UpdateClubRequestModel? updateClubRequestModel;

  @override
  void onInit() {
    super.onInit();
    getClubs();
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
  changeTab(int value){
    tab.value=value;
    update();
  }
  changeShowProgressBar(bool value){
    showProgressbar.value=value;
  }
  changeLoading(bool value){
    showLoading.value=value;
  }

  // openAddVipClubHostActivity(){
  //   Get.to(()=> const AddVipClubHostActivity());
  // }

  getClubs() async{
    getClubsModel = await ApiMethods.getClubListApi();
    if (getClubsModel!.status!="0"??false ) {
      print(" Get Clubs Successfully complete...");
      changeShowProgressBar(false);
    }else{
      print("Get Clubs Failed....");
      changeShowProgressBar(true);
      showToastMessage(getClubsModel!.message!);
    }
  }

  getClubsRequestList() async{
    getClubRequestModel = await ApiMethods.getAllClubRequestApi(type: "All");
    if (getClubRequestModel!.status!="0"??false ) {
      print(" Get Clubs Successfully complete...");
      changeShowProgressBar(false);
    }else{
      print("Get Clubs Failed....");
      changeShowProgressBar(true);
      showToastMessage(getClubRequestModel!.message!);
    }
  }
  getLocalData() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userData = LogInModel.fromJson(jsonData);

    }
  }

  Future<void> callingUpdateClubRequestForm(String registerId,String status) async {
    bodyParamsForUpdateClubRequestForm = {
      ApiKeyConstants.userId: userData.result!.id,
      ApiKeyConstants.registerId:registerId,
      ApiKeyConstants.token:userData.result!.token,
      ApiKeyConstants.request:status,
    };
    print("bodyParamsForUpdateClubRequestForm:::::$bodyParamsForUpdateClubRequestForm");
    updateClubRequestModel = await ApiMethods.updateClubRequestApi(
        bodyParams: bodyParamsForUpdateClubRequestForm);
    if (updateClubRequestModel!.status!="0"??false ) {
      changeLoading(false);
      print("Update Club Request Successfully complete...");
      showToastMessage(updateClubRequestModel!.message!);
      changeShowProgressBar(true);
      getClubsRequestList();
    }else{
      print("Update Club RequestFailed....");
      changeLoading(false);
      showToastMessage(updateClubRequestModel!.message!);
    }
  }

}