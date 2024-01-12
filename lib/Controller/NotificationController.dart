
import 'package:get/get.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_getnotification_model.dart';
import '../common/ShowToast.dart';


class NotificationController extends GetxController{
  RxBool showProgressbar=true.obs;
  GetNotificationModel? getNotificationModel;
  Map<String,String?> parameters=Get.parameters;

  @override
  void onInit() {
    super.onInit();
    getNotification();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getNotification() async{
    getNotificationModel = await ApiMethods.getNotificationApi(userId: parameters['userId']!);
    if (getNotificationModel!.status!="0"??false ) {
      changeProgressbarStatus(false);
      print(" Get Notification Successfully complete...");
    }else{
      print("Get Notification  Failed....");
      showToastMessage(getNotificationModel!.message!);
      changeProgressbarStatus(true);
    }
  }

  changeProgressbarStatus(bool value){
    showProgressbar.value=value;
  }
}