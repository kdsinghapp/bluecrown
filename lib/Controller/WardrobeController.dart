import 'package:bluecrown/Activity/QrScannerActivity.dart';
import 'package:get/get.dart';

import '../Activity/CurrentWardrobeActivity.dart';
import '../Activity/HistoricActivity.dart';
import '../Activity/WardrobeListActivity.dart';

class WardrobeController extends GetxController {
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

  openMineOfferActivity() {
    // Get.to(()=> const MineOfferActivity());
  }
  openQrScannerActivity() {
    Get.to(() => const QrScannerActivity());
  }

  openWardrobeListActivity() {
    Get.to(() => const WardrobeListActivity());
  }

  openCurrentWardrobeActivity() {
    Get.to(() => const CurrentWardrobeActivity());
  }

  openHistoricActivity() {
    Get.to(() => const HistoricActivity());
  }
}
