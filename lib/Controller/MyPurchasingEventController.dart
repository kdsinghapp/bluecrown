import 'package:bluecrown/Apis/api_models/get_response_bookingrequestmodel.dart';
import 'package:bluecrown/Apis/api_models/get_response_mypurchasingevents_model.dart';
import 'package:get/get.dart';

import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';

class MyPurchasingEventController extends GetxController {
  RxInt count=0.obs;
  RxBool showBookingRequestProgressBar=true.obs;
  RxBool presentData=false.obs;
  GetMyPurchasingEventModel? getMyPurchasingEventModel;

  Map<String,String?> parameterData=Get.parameters;


  @override
  void onInit() {
    super.onInit();
    getMyPurchasingEventList();
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


  changeBookingRequestProgressBar(bool value){
    showBookingRequestProgressBar.value=value;
  }
  changePresentData(bool value){
    presentData.value=value;
  }


  getMyPurchasingEventList() async{
    getMyPurchasingEventModel = await ApiMethods.getMyPurchasingEventsApi(userId: parameterData['userId']!);
    if (getMyPurchasingEventModel!.status!="0"??false ) {
      print(" Get Booking Request Successfully complete...");
      changeBookingRequestProgressBar(false);
    }else{
      print("Get Booking Request Failed....");
      changePresentData(false);
      showToastMessage(getMyPurchasingEventModel!.message!);
    }
  }

}