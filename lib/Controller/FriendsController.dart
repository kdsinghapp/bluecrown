import 'package:bluecrown/Activity/AddListActivity.dart';
import 'package:bluecrown/Apis/api_models/get_response_getfriends_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';
import '../constant/imageconstants.dart';


class FriendsController extends GetxController {
  TextEditingController searchController=TextEditingController();
  RxInt count=0.obs;
  RxBool showFriendsProgressBar=true.obs;
  GetFriendsModel? getFriendsModel;
  List<GetFriendsResult> filterUsersList=[];
  @override
  void onInit() {
    super.onInit();
    getFriendsList();
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

}