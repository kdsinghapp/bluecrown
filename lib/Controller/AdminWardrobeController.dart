import 'package:bluecrown/Activity/AddListActivity.dart';
import 'package:bluecrown/Apis/api_models/get_response_cubfriend_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_getwardrobeusers_model.dart';
import '../common/ShowToast.dart';
import '../constant/imageconstants.dart';


class AdminWardrobeController extends GetxController {
  TextEditingController searchController=TextEditingController();
  RxInt count=0.obs;
  RxBool showProgressbar=true.obs;
  GetClubFriendModel? getClubFriendModel;
  Map<String,String?> parameterData=Get.parameters;

  List<GetClubFriendResult> filterUsersList=[];
  @override
  void onInit() {
    super.onInit();
    getWardrobeUserList();
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

  showAllUsers(GetClubFriendModel model){
    filterUsersList=model.result!;
    changeShowProgressBar(false);
  }


  changeFilterUsersList(String query){
    filterUsersList = getClubFriendModel!.result!
        .where((item) => item.fullName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();

  }
  changeShowProgressBar(bool value){
    showProgressbar.value=value;
  }
  getWardrobeUserList() async{
    getClubFriendModel = await ApiMethods.getClubsFriendListApi(clubId: parameterData['clubId']!);
    if (getClubFriendModel!.status!="0"??false ) {
      print(" Get Wardrobe Users List Successfully complete...");
      showAllUsers(getClubFriendModel!);
    }else{
      print(" Get Wardrobe Users List Failed....");
      changeShowProgressBar(true);
      showToastMessage(getClubFriendModel!.message!);
    }
  }

}