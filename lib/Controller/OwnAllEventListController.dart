import 'package:bluecrown/Apis/api_models/get_response_published_myevent_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Apis/api_methods/api_methods.dart';
import '../common/ShowToast.dart';

class OwnAllEventListController extends GetxController {
  TextEditingController searchController = TextEditingController();
  RxBool showProgressBar = true.obs;
  Map<String, String?> parameterData = Get.parameters;
  Map<String, dynamic> bodyParamsForPublishMyEventForm = {};
  PublishMyEventModel? publishMyEventModel;
  List<PublishMyEventResult> filterEventList = [];
  @override
  void onInit() {
    super.onInit();
    getMyPublishEventsList(parameterData['clubId']!);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  showAllEventList(PublishMyEventModel model) {
    filterEventList = model.result!;
    changeProgressbarStatus(false);
  }

  changeFilterEventList(String query) {
    filterEventList = publishMyEventModel!.result!
        .where((item) => item.name!.toLowerCase().contains(query.toLowerCase()))
        .toList();
    update();
  }

  openSelfAllListActivity(String eventId) async {
    Map<String, String> data = {
      'clubId': parameterData['clubId']!,
      'eventId': eventId
    };
    Get.toNamed('/selfAddListActivity', parameters: data);
  }

  changeProgressbarStatus(bool value) {
    showProgressBar.value = value;
  }

  Future<void> getMyPublishEventsList(String clubId) async {
    publishMyEventModel = await ApiMethods.getPublishMyEventApi(userId: clubId);
    if (publishMyEventModel!.status != "0" ?? false) {
      showAllEventList(publishMyEventModel!);
      print("Get My published events Successfully complete...");
    } else {
      print("Get My published events Failed....");
      changeProgressbarStatus(false);
      showToastMessage(publishMyEventModel!.message!);
    }
  }
}
