
import 'package:get/get.dart';


class MineOfferController extends GetxController {
  RxInt count=0.obs;
  RxBool showNearEventsProgressBar=false.obs;


  List<String> names=["Free entry",'Table reservation','Table reservation','Table reservation',"Free entry",'Table reservation'];



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

  changeCount(int value){
    count.value=value;
  }


  changeShowNearEventsProgressBar(bool value){
    showNearEventsProgressBar.value=value;
  }

}