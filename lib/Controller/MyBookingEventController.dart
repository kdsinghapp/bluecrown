import 'package:bluecrown/Apis/api_models/get_response_bookingrequestmodel.dart';
import 'package:get/get.dart';

import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';


class MyBookingEventController extends GetxController {
  RxInt count=0.obs;
  RxBool showBookingRequestProgressBar=true.obs;
  GetBookingRequestModel? getBookingRequestModel;

  Map<String,String?> parameterData=Get.parameters;


  @override
  void onInit() {
    super.onInit();
    getCategory();

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



  getCategory() async{
    getBookingRequestModel = await ApiMethods.getMyBookingEventsApi(userId: parameterData['userId']!);
    if (getBookingRequestModel!.status!="0"??false ) {
      print(" Get Booking Request Successfully complete...");
      changeBookingRequestProgressBar(false);
    }else{
      print("Get Booking Request Failed....");
      changeBookingRequestProgressBar(true);
      showToastMessage(getBookingRequestModel!.message!);
    }
  }

}