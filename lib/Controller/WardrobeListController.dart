
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_getcubslist_model.dart';
import '../common/ShowToast.dart';


class WardrobeListController extends GetxController {
  TextEditingController searchController=TextEditingController();
  RxInt count=0.obs;
  RxBool showProgressBar=true.obs;

  GetClubsModel? getClubsModel;
  List<GetClubsResult> filterClubsList=[];
  @override
  void onInit() {
    super.onInit();
    getClubs();
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


  changeShowProgressBar(bool value){
    showProgressBar.value=value;
  }

  openHangerListActivity(String clubId){
    Map<String,String>data={
      'clubId':clubId
    };
    Get.toNamed('getHangerListActivity',parameters: data);
  }

  showAllUsers(GetClubsModel model){
    filterClubsList=model.result!;
  }


  changeFilterUsersList(String query){
    filterClubsList = getClubsModel!.result!
        .where((item) => item.fullName!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();

  }

  getClubs() async{
    getClubsModel = await ApiMethods.getClubListApi();
    if (getClubsModel!.status!="0"??false ) {
      print(" Get Clubs Successfully complete...");
      showAllUsers(getClubsModel!);
      changeShowProgressBar(false);
    }else{
      print("Get Clubs Failed....");
      changeShowProgressBar(true);
      showToastMessage(getClubsModel!.message!);
    }
  }

}