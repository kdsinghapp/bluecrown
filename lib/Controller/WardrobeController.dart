
import 'package:bluecrown/Activity/MineOfferActivity.dart';
import 'package:get/get.dart';

import '../Activity/CurrentWardrobeActivity.dart';
import '../Activity/HistoricActivity.dart';
import '../Activity/WardrobeListActivity.dart';


class WardrobeController extends GetxController{

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

  openMineOfferActivity(){
   // Get.to(()=> const MineOfferActivity());
  }
  openWardrobeListActivity(){
    Get.to(()=> const WardrobeListActivity());
  }
  openCurrentWardrobeActivity(){
    Get.to(()=> const CurrentWardrobeActivity());
  }
  openHistoricActivity(){
    Get.to(()=> const HistoricActivity());
  }

}