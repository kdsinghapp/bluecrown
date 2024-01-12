import 'package:bluecrown/Apis/api_models/get_response_getcubslist_model.dart';
import 'package:get/get.dart';

import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';


class UsePointClubsController extends GetxController {
  RxInt count=0.obs;
  RxBool showCategoryProgressBar=true.obs;
  GetClubsModel? getClubsModel;
  Map<String,String?> parameterData=Get.parameters;


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


  changeCategoryProgressBar(bool value){
    showCategoryProgressBar.value=value;
  }

  openUsePointEventsActivity(String clubId,String clubName){
    Map<String,String> data={
      'clubId':clubId,
      'clubName':clubName,
      'points':parameterData['points']!
    };
    Get.toNamed('/usePointEventsActivity',parameters:data );
  }

  getClubs() async{
    getClubsModel = await ApiMethods.getClubListApi();
    if (getClubsModel!.status!="0"??false ) {
      print(" Get Clubs Successfully complete...");
      changeCategoryProgressBar(false);
    }else{
      print("Get Clubs Failed....");
      changeCategoryProgressBar(true);
      showToastMessage(getClubsModel!.message!);
    }
  }

}