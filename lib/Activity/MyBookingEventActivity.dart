import 'package:bluecrown/Apis/api_models/get_response_bookingrequestmodel.dart';
import 'package:bluecrown/Controller/MyBookingEventController.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Tool/Color.dart';
import '../constant/iconsconstants.dart';

class MyBookingEventActivity extends StatefulWidget {
  const MyBookingEventActivity({super.key});

  @override
  State<MyBookingEventActivity> createState() => _MyBookingEventState();
}

class _MyBookingEventState extends State<MyBookingEventActivity> {
  MyBookingEventController controller = Get.put(MyBookingEventController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primary3Color,
        appBar: AppBar(
          backgroundColor: primary3Color,
          elevation: 0.px,
          title: Center(
              child: Text(
            'Event Booking List',
            style: MyTextStyle.titleStyle18bb,
          )),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                            controller.changePresentBookingList(true);
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
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Obx(
                  () => controller.presentBookingList.value
                      ? showNearEvents()
                      : const Center(
                          child: Text(
                            'There are not present any confirm list.',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: Colors.redAccent),
                            textAlign: TextAlign.center,
                          ),
                        ),
                ),
              ),
            ),
          ],
        ));
  }

  /// Show Near Events...
  Widget showNearEvents() {
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
                                    color: item.status! == 'Accepted'
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
