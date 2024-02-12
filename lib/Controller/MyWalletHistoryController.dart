import 'package:bluecrown/Apis/api_models/get_response_mypurchasingevents_model.dart';
import 'package:get/get.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_mywallethistory_model.dart';
import '../common/ShowToast.dart';

class MyWalletHistoryController extends GetxController {
  RxInt count=0.obs;
  RxBool showBookingRequestProgressBar=true.obs;
  RxBool presentData=false.obs;
  MyWalletHistoryModel? myWalletHistoryModel;

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
    myWalletHistoryModel = await ApiMethods.myWalletHistoryApi(userId: parameterData['userId']!);
    if (myWalletHistoryModel!.status!="0"??false ) {
      print(" Get Booking Request Successfully complete...");
      changeBookingRequestProgressBar(false);
    }else{
      print("Get Booking Request Failed....");
      changePresentData(false);
      showToastMessage(myWalletHistoryModel!.message!);
    }
  }

}