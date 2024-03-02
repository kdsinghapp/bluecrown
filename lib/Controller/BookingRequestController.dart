import 'package:bluecrown/Apis/api_models/get_response_bookingrequestmodel.dart';
import 'package:bluecrown/Apis/api_models/get_response_updatebookingrequest_model.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:intl/intl.dart';
import 'package:screenshot/screenshot.dart';

import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';

class BookingRequestController extends GetxController {
  RxInt count = 0.obs;
  RxBool showBookingRequestProgressBar = true.obs;
  RxBool btnLoading = false.obs;
  RxInt tabIndex = 0.obs;
  GetBookingRequestModel? getBookingRequestModel;
  UpdateBookingRequestModel? updateBookingRequestModel;
  Map<String, String?> parameterData = Get.parameters;
  final ScreenshotController screenshotController = ScreenshotController();

  @override
  void onInit() {
    super.onInit();
    getCategory('Normal');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  changeCount(int value) {
    count.value = value;
  }

  changeTabIndex(int value) {
    changeBookingRequestProgressBar(true);
    tabIndex.value = value;
    tabIndex.value == 0 ? getCategory('Normal') : getCategory('Vip');
  }

  changeBookingRequestProgressBar(bool value) {
    showBookingRequestProgressBar.value = value;
  }

  openOwnAllEventListActivity() {
    Map<String, String> data = {'clubId': parameterData['clubId']!};
    Get.toNamed('/ownAllEventListActivity', parameters: data);
  }

  changeButtonProgressBar(bool value) {
    btnLoading.value = value;
  }

  getCategory(String type) async {
    getBookingRequestModel = await ApiMethods.getEventBookingRequestApi(
        clubId: parameterData['clubId']!, type: type);
    if (getBookingRequestModel!.status != "0" ?? false) {
      print(" Get Booking Request Successfully complete...");
      changeBookingRequestProgressBar(false);
    } else {
      print("Get Booking Request Failed....");
      changeBookingRequestProgressBar(true);
      showToastMessage(getBookingRequestModel!.message!);
    }
  }

  acceptRejectBookingRequest(String bookingStatus, String bookingId) async {
    updateBookingRequestModel = await ApiMethods.updateBookingRequestApi(
        clubId: parameterData['clubId']!,
        bookingId: bookingId,
        status: bookingStatus);
    if (updateBookingRequestModel!.status != "0" ?? false) {
      print("Add List Successfully complete...");
      changeBookingRequestProgressBar(true);
      tabIndex.value == 0 ? getCategory('Normal') : getCategory('Vip');
      showToastMessage(updateBookingRequestModel!.message!);
    } else {
      print("Add List Failed....");
      showToastMessage(updateBookingRequestModel!.message!);
    }
    changeButtonProgressBar(false);
  }

  Future<void> saveScreenshot() async {
    Uint8List? image = await screenshotController.capture();
    String formattedDate =
        DateFormat('yyyy-MM-dd_HH:mm:ss').format(DateTime.now());
    String fileName = 'booking_$formattedDate.png';

    final result = await ImageGallerySaver.saveImage(image!);
    if (result['isSuccess']) {
      print('Screenshot saved successfully in the gallery as: $fileName');
    } else {
      print('Failed to save screenshot');
    }
    changeButtonProgressBar(false);
  }
}
