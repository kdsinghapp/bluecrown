import 'dart:convert';
import 'package:bluecrown/Apis/api_models/get_response_addclubcostomer_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_login_model.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_getfriends_model.dart';
import '../common/ShowToast.dart';


class ConsumerSearchController extends GetxController {
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  RxBool showFriendsProgressBar=true.obs;
  RxBool showLoading=false.obs;
  TextEditingController searchController=TextEditingController();
  RxInt count=0.obs;
   AddCostomerModel? addCostomerModel;

  GetFriendsModel? getFriendsModel;
  List<GetFriendsResult> filterUsersList=[];
  Map<String, dynamic> bodyParamsForSubmitAddFriendsForm = {};
  @override
  void onInit() {
    super.onInit();
    getFriendsList();
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

  getLocalData() async{
    sharedPreferences=await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData = jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData!=null) {
      userData = LogInModel.fromJson(jsonData);
    }
  }

  changeCount(int value){
    count.value=value;
  }

  showAllUsers(GetFriendsModel model){
    filterUsersList=model.result!;
    changeFriendsProgressBar(false);
  }
  changeFilterUsersList(String query){
    filterUsersList = getFriendsModel!.result!
        .where((item) => item.fullName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();

  }

  changeFriendsProgressBar(bool value){
    showFriendsProgressBar.value=value;
  }
  changeShowLoadingProgressBar(bool value){
    showLoading.value=value;
  }

  getFriendsList() async{
    getFriendsModel = await ApiMethods.getFriendListApi();
    if (getFriendsModel!.status!="0"??false ) {
      print(" Get Friends Successfully complete...");
      showAllUsers(getFriendsModel!);
    }else{
      print("Get Friends Failed....");
      changeFriendsProgressBar(true);
      showToastMessage(getFriendsModel!.message!);
    }
  }


  void callingSubmitAddContomerForm(String friendId) async {
    bodyParamsForSubmitAddFriendsForm = {
      ApiKeyConstants.userId:userData.result!.id,
      ApiKeyConstants.friendsId: friendId,
      ApiKeyConstants.token: userData.result!.token,

    };
    print("bodyParamsForSubmitAddFriends:::::$bodyParamsForSubmitAddFriendsForm");
    addCostomerModel = await ApiMethods.submitAddCostomerApi(
        bodyParams: bodyParamsForSubmitAddFriendsForm);
    if (addCostomerModel!.status!="0"??false ) {
      print("Send Request Friends Successfully complete...");
      showToastMessage(addCostomerModel!.message!);
      changeShowLoadingProgressBar(false);

    }else{
      print("Send Request Friends Failed....");
      showToastMessage(addCostomerModel!.message!);
      changeShowLoadingProgressBar(false);
    }
  }

}