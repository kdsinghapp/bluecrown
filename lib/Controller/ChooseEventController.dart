import 'dart:convert';

import 'package:bluecrown/Apis/api_models/get_response_published_myevent_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Apis/api_methods/api_methods.dart';
import '../Apis/api_models/get_response_bookingrequestmodel.dart';
import '../Apis/api_models/get_response_login_model.dart';
import '../common/ShowToast.dart';
import '../constant/stringconstants.dart';

class ChooseEventController extends GetxController {
  RxInt tabIndex = 0.obs;
  late SharedPreferences sharedPreferences;
  GetBookingRequestModel? getBookingRequestModel;
  RxBool showBookingRequestProgressBar = true.obs;
  RxBool presentBooking = true.obs;
  late LogInModel userData;

  final count = 0.obs;
  PublishMyEventResult publishMyEventResult = Get.arguments;

  @override
  void onInit() {
    super.onInit();
    getLocalData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  increaseCount() {
    count.value = count.value++;
  }

  openAddEventListActivity() async {
    Map<String, String> data = {
      'eventId': publishMyEventResult.id!,
      'clubId': publishMyEventResult.userId!,
    };
    await Get.toNamed('/addListActivity', parameters: data);
    changeBookingRequestProgressBar(true);
    getMyBookedEventsList();
  }

  changeBookingRequestProgressBar(bool value) {
    showBookingRequestProgressBar.value = value;
  }

  changePresentBooking(bool value) {
    presentBooking.value = value;
  }

  getMyBookedEventsList() async {
    try {
      getBookingRequestModel = await ApiMethods.getMyBookingEventsApi(
          userId: userData.result!.id!,
          status: tabIndex.value == 0 ? 'Accepted' : 'Pending');
      if (getBookingRequestModel!.status != "0" ?? false) {
        print(" Get Booking Request Successfully complete...");
        changePresentBooking(true);
        changeBookingRequestProgressBar(false);
      } else {
        print("Get Booking Request Failed....");
        changePresentBooking(false);
        changeBookingRequestProgressBar(true);
        showToastMessage(getBookingRequestModel!.message!);
      }
    } catch (e) {
      changePresentBooking(false);
      changeBookingRequestProgressBar(true);
    }
  }

  getLocalData() async {
    sharedPreferences = await SharedPreferences.getInstance();
    Map<String, dynamic> jsonData =
        jsonDecode(sharedPreferences.getString(StringConstants.userData)!);
    if (jsonData != null) {
      userData = LogInModel.fromJson(jsonData);
      getMyBookedEventsList();
    }
  }
}
