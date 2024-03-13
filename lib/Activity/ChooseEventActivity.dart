import 'package:bluecrown/Controller/ChooseEventController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Apis/api_models/get_response_bookingrequestmodel.dart';

class ChooseEventActivity extends StatefulWidget {
  const ChooseEventActivity({super.key});

  @override
  State<ChooseEventActivity> createState() => _ChooseEventState();
}

class _ChooseEventState extends State<ChooseEventActivity> {
  ChooseEventController controller = Get.put(ChooseEventController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
      return Scaffold(
        backgroundColor: primary3Color,
        appBar: AppBar(
          backgroundColor: primary3Color,
          elevation: 0.px,
          leading: SizedBox(
            height: 40.px,
            width: 40.px,
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.px))),
                color: editTextButton,
                margin: EdgeInsets.all(10.px),
                child: Padding(
                  padding: EdgeInsets.only(left: 3.px),
                  child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        size: 20,
                        color: textColor,
                      )),
                )),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                  left: 5.px, right: 15.px, top: 10.px, bottom: 10.px),
              child: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    IconsConstants.profileIcon,
                    height: 30.px,
                    width: 30.px,
                  )),
            ),
          ],
        ),
        extendBody: false,
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: EdgeInsets.only(left: 20.px, right: 20.px, bottom: 0.px),
          child: CommonWidget.commonElevatedButton(
              onPressed: () {
                controller.openAddEventListActivity();
              },
              text: StringConstants.sendRequest,
              buttonMargin: EdgeInsets.only(
                top: 5.px,
              ),
              borderRadius: 25.px),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              StringConstants.chosenEvent,
              style: MyTextStyle.titleStyle24bb,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(top: 5, bottom: 0, right: 10, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${controller.publishMyEventResult.dateTime!} ( ${controller.publishMyEventResult.fromTime} )',
                    style: MyTextStyle.titleStyle12bb,
                  ),
                  SizedBox(
                    width: 40.px,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 20.px,
                          width: 30.px,
                          child: Image.asset(
                            IconsConstants.subCrownIcon,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Text(
                          controller.publishMyEventResult.entranceCost!,
                          style: MyTextStyle.titleStyle14bb,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 5),
              child: Text(
                controller.publishMyEventResult.name!,
                style: MyTextStyle.titleStyle14bb,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Obx(() => Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            controller.tabIndex.value = 0;
                            controller.showBookingRequestProgressBar.value =
                                true;
                            controller.getMyBookedEventsList();
                          },
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: primaryColor, width: 1),
                                color: controller.tabIndex.value == 0
                                    ? primaryColor
                                    : primary3Color),
                            child: Text(
                              'Current List',
                              style: controller.tabIndex.value == 0
                                  ? MyTextStyle.titleStyle16bw
                                  : MyTextStyle.titleStyle16bb,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            controller.tabIndex.value = 1;
                            controller.changePresentBooking(true);
                            controller.showBookingRequestProgressBar.value =
                                true;
                            controller.getMyBookedEventsList();
                          },
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border:
                                    Border.all(color: primaryColor, width: 1),
                                color: controller.tabIndex.value == 1
                                    ? primaryColor
                                    : primary3Color),
                            child: Text(
                              'List Requests',
                              style: controller.tabIndex.value == 1
                                  ? MyTextStyle.titleStyle16bw
                                  : MyTextStyle.titleStyle16bb,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
            Expanded(
                child: Obx(() => controller.presentBooking.value
                    ? showBookingEvents()
                    : const Text(
                        'There are not present any your add list',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                        textAlign: TextAlign.center,
                      ))),
            SizedBox(
              height: 80.px,
            ),
          ],
        ),
      );
    });
  }

  /// Show Booking List Events...
  Widget showBookingEvents() {
    return Obx(() => controller.showBookingRequestProgressBar.value
        ? Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            enabled: controller.showBookingRequestProgressBar.value,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 95.px,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 0),
                    decoration: const BoxDecoration(
                        // color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: Container(
                      height: 95.px,
                      width: double.infinity,
                      margin:
                          const EdgeInsets.only(left: 10, right: 10, top: 5),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: textColor),
                    ),
                  );
                }))
        : ListView.builder(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            itemCount: controller.getBookingRequestModel!.result!.length,
            itemBuilder: (context, int index) {
              GetBookingRequest item =
                  controller.getBookingRequestModel!.result![index];
              return GestureDetector(
                onTap: () {
                  //controller.openListEventActivity(item.id!,item.image!);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.px))),
                  elevation: 2.px,
                  margin: EdgeInsets.only(
                      left: 15.px, right: 15.px, top: 5.px, bottom: 5.px),
                  color: cartColor,
                  child: Container(
                      height: 95.px,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10.px)),
                      ),
                      margin: EdgeInsets.all(5.px),
                      padding: EdgeInsets.all(8.px),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item.fullName!,
                                style: MyTextStyle.titleStyle16b,
                              ),
                              SizedBox(
                                height: 5.px,
                              ),
                              Text(
                                item.eventName!,
                                style: MyTextStyle.titleStyle14b,
                              ),
                              SizedBox(
                                height: 5.px,
                              ),
                              Text(
                                item.eventDate!,
                                style: MyTextStyle.titleStyle16b,
                              ),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              item.type == 'Vip'
                                  ? Icon(
                                      Icons.star,
                                      size: 20.px,
                                      color: Colors.green,
                                    )
                                  : SizedBox(
                                      height: 5.px,
                                      width: 5.px,
                                    ),
                              SizedBox(
                                height: 5.px,
                              ),
                              Text(
                                '${item.totalPeople.toString()} +',
                                style: MyTextStyle.titleStyle14b,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                item.status!,
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14,
                                    color: item.status == 'Accepted'
                                        ? Colors.green
                                        : Colors.redAccent),
                              )
                            ],
                          ),
                        ],
                      )),
                ),
              );
            },
          ));
  }
}
