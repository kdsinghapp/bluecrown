
import 'package:get/get.dart';

import '../Activity/PointsActivity.dart';


class HistoricController extends GetxController {

  RxInt tab=0.obs;
  RxBool showProgressbar=false.obs;
  List<String> names=['Makeriet 22/1 - 2022','Makeriet 22/1 - 2022','Makeriet 22/1 - 2022','Makeriet 22/1 - 2022','Makeriet 22/1 - 2022','Johan Smihs',];

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
  changeTab(int value){
  tab.value=value;
  update();
  }

  openPointsActivity(){
    Get.to(()=> const PointActivity());
  }

}