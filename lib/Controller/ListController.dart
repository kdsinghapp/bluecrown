import 'package:bluecrown/Apis/api_models/get_response_friendsrequest_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_getfriends_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Apis/api_constants/api_key_constants.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';


class ListController extends GetxController {
  TextEditingController searchController=TextEditingController();
  RxInt count=0.obs;
  RxBool showNearEventsProgressBar=false.obs;
  RxBool showFriendsProgressBar=true.obs;

  Map<String,String?> parameterData=Get.parameters;
  GetFriendsModel? getFriendsModel;
  FriendsRequestModel? friendsRequestModel;

   RxInt selectLength=0.obs;
  List<GetFriendsResult> selectedUsers=[];
  List<GetFriendsResult> filterUsersList=[];
  Map<String, dynamic> bodyParamsForSubmitRequestFriendsForm = {};

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

  changeShowNearEventsProgressBar(bool value){
    showNearEventsProgressBar.value=value;
  }

  addUsers(GetFriendsResult userName){
    selectedUsers.add(userName);
    selectLength.value=selectedUsers.length;
    update();
    print(selectedUsers.length.toString());
  }
  removeUsers(int index){
    selectedUsers.removeAt(index);
    selectLength.value=selectedUsers.length;
    update();
    print(selectedUsers.length.toString());
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


  Future<bool> callingSubmitFriendsRequestForm() async {
    bodyParamsForSubmitRequestFriendsForm = {
      ApiKeyConstants.userId:parameterData['userId'],
      ApiKeyConstants.eventId: parameterData['eventId'],
      ApiKeyConstants.friendsId: createFriendsIds(),
      ApiKeyConstants.token: parameterData['token'],

    };
    print("bodyParamsForSubmitRequestFriends:::::$bodyParamsForSubmitRequestFriendsForm");
    friendsRequestModel = await ApiMethods.submitFriendsRequestApi(
        bodyParams: bodyParamsForSubmitRequestFriendsForm);
    if (friendsRequestModel!.status!="0"??false ) {
      print("Send Request Friends Successfully complete...");
      showToastMessage(friendsRequestModel!.message!);
      return true;

    }else{
      print("Send Request Friends Failed....");
      showToastMessage(friendsRequestModel!.message!);
      return false;
    }
  }


  String createFriendsIds(){
    String ids='';
    for(int i=0;i<selectedUsers.length;i++){
      ids='$ids,${selectedUsers[i].id!}';
    }
    return ids;
  }




}