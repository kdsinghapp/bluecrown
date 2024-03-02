import 'package:bluecrown/Apis/api_models/get_response_bookingrequestmodel.dart';
import 'package:get/get.dart';

import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';

class MyBookingEventController extends GetxController {
  RxInt count = 0.obs;
  RxInt tabIndex = 0.obs;
  RxBool showBookingRequestProgressBar = true.obs;
  RxBool presentBookingList = true.obs;
  GetBookingRequestModel? getBookingRequestModel;

  Map<String, String?> parameterData = Get.parameters;

  @override
  void onInit() {
    super.onInit();
    getMyBookedEventsList();
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

  changeBookingRequestProgressBar(bool value) {
    showBookingRequestProgressBar.value = value;
  }

  changePresentBookingList(bool value) {
    presentBookingList.value = value;
  }

  getMyBookedEventsList() async {
    try {
      getBookingRequestModel = await ApiMethods.getMyBookingEventsApi(
          userId: parameterData['userId']!,
          status: tabIndex.value == 0 ? 'Accepted' : 'Pending');
      if (getBookingRequestModel!.status != "0" ?? false) {
        print(" Get Booking Request Successfully complete...");
        changePresentBookingList(true);
        changeBookingRequestProgressBar(false);
      } else {
        print("Get Booking Request Failed....");
        changePresentBookingList(false);
        changeBookingRequestProgressBar(true);
        showToastMessage(getBookingRequestModel!.message!);
      }
    } catch (e) {
      changePresentBookingList(false);
      changeBookingRequestProgressBar(true);
    }
  }
}
