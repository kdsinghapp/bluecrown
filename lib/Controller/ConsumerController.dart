import 'dart:convert';
import 'package:bluecrown/Activity/ConsumerSearchActivity.dart';
import 'package:bluecrown/common/ShowToast.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_getfriends_model.dart';
import '../Apis/api_models/get_response_login_model.dart';


class ConsumerController extends GetxController {
  late SharedPreferences sharedPreferences;
  late LogInModel userData;
  RxInt count=0.obs;
  RxBool showFriendsProgressBar=true.obs;
  RxBool showLoading=false.obs;


  GetFriendsModel? getFriendsModel;
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


  openConsumerSearchActivity(){
    Get.to(()=>const ConsumerSearchActivity());
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
      changeFriendsProgressBar(false);
    }else{
      print("Get Friends Failed....");
      changeFriendsProgressBar(true);
      showToastMessage(getFriendsModel!.message!);
    }
  }

}