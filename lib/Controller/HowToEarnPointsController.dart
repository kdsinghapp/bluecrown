
import 'package:bluecrown/Apis/api_models/get_response_howtoearnpoints_model.dart';
import 'package:get/get.dart';

import '../Activity/HistoricActivity.dart';
import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';



class HowToEarnPointsController extends GetxController{
  RxBool showProgressbar=true.obs;
  HowToEarnPointsModel? howToEarnPointsModel;

  @override
  void onInit() {
    super.onInit();
    getHowToEarnPoints();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }


  openHistoricActivity(){
    Get.to(()=> const HistoricActivity());
  }

  changeShowProgressBar(bool value){
    showProgressbar.value=value;
  }
  getHowToEarnPoints() async{
    howToEarnPointsModel = await ApiMethods.howToEarnPointsApi();
    if (howToEarnPointsModel!.status!="0"??false ) {
      print(" How to earn more points Successfully complete...");
      changeShowProgressBar(false);
    }else{
      print("How to earn more points Failed....");
      changeShowProgressBar(true);
      showToastMessage(howToEarnPointsModel!.message!);
    }
  }

}