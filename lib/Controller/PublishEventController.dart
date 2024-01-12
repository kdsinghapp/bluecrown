
import 'package:bluecrown/Activity/EnterEventDetailActivity.dart';
import 'package:get/get.dart';

import '../Activity/AdminWardrobeActivity.dart';


class PublishEventController extends GetxController{
  RxBool showNearEventsProgressBar=false.obs;
  RxInt dateLength=0.obs;
  List<DateTime?> dates=[];
   @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeDateLength(){
     dateLength.value=dates.length;
  }
  openEnterEventDetailActivity(){
     Map<String,String> data={
       'date_from':dates[0].toString().substring(0,10),
       'date_end':dates[dateLength.value-1].toString().substring(0,10),
     };
     print(data);
    Get.toNamed('/enterEventDetailsActivity',parameters: data);
  }

}