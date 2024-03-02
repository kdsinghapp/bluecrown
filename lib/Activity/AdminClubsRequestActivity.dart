import 'package:bluecrown/Apis/api_models/get_response_getclubrequest_model.dart';
import 'package:bluecrown/Controller/AdminClubsRequestController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Apis/api_models/get_response_getcubslist_model.dart';
import '../constant/imageconstants.dart';

class AdminClubsRequestActivity extends StatefulWidget {
  const AdminClubsRequestActivity({super.key});

  @override
  State<AdminClubsRequestActivity> createState() => _AdminClubsRequestState();
}

class _AdminClubsRequestState extends State<AdminClubsRequestActivity> {
  AdminClubsRequestController controller =
      Get.put(AdminClubsRequestController());

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          StringConstants.currentClubs,
          style: MyTextStyle.titleStyle20bb,
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(
                left: 5.px, right: 15.px, top: 10.px, bottom: 10.px),
            child: GestureDetector(
                onTap: () {
                  controller.openLogoutActivity();
                },
                child: const Icon(
                  Icons.logout,
                  size: 30,
                  color: Colors.redAccent,
                )),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(left: 20.px, right: 20.px, bottom: 10.px),
          child: Obx(() => controller.showLoading.value
              ? Container(
                  width: double.infinity,
                  height: 50,
                  margin: EdgeInsets.all(10.px),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(25.px)),
                      color: primaryColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                          height: 30,
                          width: 30,
                          child: CircularProgressIndicator(
                            color: primary3Color,
                          )),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Loading...",
                        style: MyTextStyle.titleStyle16bw,
                      ),
                    ],
                  ),
                )
              : SizedBox(
                  height: 5.px,
                ))),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 20.px,
          ),
          Row(
            children: [
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      controller.changeShowProgressBar(true);
                      controller.changeTab(0);
                      controller.getClubs();
                    },
                    child: Column(
                      children: [
                        Text(
                          "Clubs",
                          style: MyTextStyle.titleStyle18bb,
                        ),
                        SizedBox(
                          height: 5.px,
                        ),
                        Obx(() => Visibility(
                            visible: controller.tab.value == 0,
                            child: Divider(
                              height: 2,
                              thickness: 2,
                              color: Colors.black,
                              indent: 20.px,
                              endIndent: 20.px,
                            )))
                      ],
                    ),
                  )),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      controller.changeShowProgressBar(true);
                      controller.changeTab(1);
                      controller.getClubsRequestList();
                    },
                    child: Column(
                      children: [
                        Text(
                          "Clubs Request",
                          style: MyTextStyle.titleStyle18bb,
                        ),
                        SizedBox(
                          height: 5.px,
                        ),
                        Obx(() => Visibility(
                            visible: controller.tab.value == 1,
                            child: Divider(
                              height: 2,
                              thickness: 2,
                              color: Colors.black,
                              indent: 20.px,
                              endIndent: 20.px,
                            )))
                      ],
                    ),
                  )),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Obx(() => controller.tab.value == 0
                  ? showCurrentClubsList()
                  : showAllRequestedClubsList()),
              //child:controller.tab.value==0?showCurrentClubsList():showAllRequestedClubsList() ,
            ),
          ),

          //SizedBox(height: 20.px,),

          SizedBox(
            height: 10.px,
          ),
        ],
      ),
    );
  }

  /// Show Current Clubs List...
  Widget showCurrentClubsList() {
    return GetBuilder<AdminClubsRequestController>(builder: (context) {
      return Obx(() => controller.showProgressbar.value
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.white,
              enabled: controller.showProgressbar.value,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 70.px,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            left: 10.px,
                            right: 10.px,
                            top: 10.px,
                            bottom: 0.px),
                        decoration: const BoxDecoration(
                            // color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ListTile(
                          leading: Container(
                            height: 60.px,
                            width: 60.px,
                            margin: EdgeInsets.only(
                                left: 10.px, right: 10.px, top: 5.px),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.px)),
                                color: textColor),
                          ),
                          title: Container(
                            height: 15.px,
                            width: 60.px,
                            margin: EdgeInsets.only(
                                left: 10.px, right: 10.px, top: 5.px),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.px)),
                                color: textColor),
                          ),
                        ));
                  }))
          : ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: controller.getClubsModel!.result!.length,
              itemBuilder: (context, int index) {
                GetClubsResult item = controller.getClubsModel!.result![index];
                return GestureDetector(
                  onTap: () {
                    // controller.openListEventActivity(item.id!,item.image!);
                  },
                  child: Container(
                    height: 70.px,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.px)),
                    ),
                    margin: EdgeInsets.all(10.px),
                    clipBehavior: Clip.hardEdge,
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: item.image!,
                        fit: BoxFit.cover,
                        width: 60.px,
                        height: 60.px,
                        placeholder: (BuildContext context, String url) =>
                            Image.asset(
                          ImageConstants.event1Img,
                          fit: BoxFit.fill,
                          height: 60.px,
                        ),
                        errorWidget:
                            (BuildContext context, String url, dynamic error) =>
                                Image.asset(
                          ImageConstants.event1Img,
                          fit: BoxFit.fill,
                          height: 60.px,
                        ),
                      ),
                      title: Text(
                        item.fullName!,
                        style: MyTextStyle.titleStyle16bb,
                      ),
                      //trailing:Image.asset(ImageConstants.scannerImg,fit: BoxFit.fill,height: 30.px,width: 30.px,) ,
                    ),
                  ),
                );
              },
            ));
    });
  }

  /// Show All Requested Clubs List...
  Widget showAllRequestedClubsList() {
    return GetBuilder<AdminClubsRequestController>(builder: (context) {
      return Obx(() => controller.showProgressbar.value
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.white,
              enabled: controller.showProgressbar.value,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                        height: 70.px,
                        width: double.infinity,
                        margin: EdgeInsets.only(
                            left: 10.px,
                            right: 10.px,
                            top: 10.px,
                            bottom: 0.px),
                        decoration: const BoxDecoration(
                            // color: Colors.black,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: ListTile(
                          leading: Container(
                            height: 60.px,
                            width: 60.px,
                            margin: EdgeInsets.only(
                                left: 10.px, right: 10.px, top: 5.px),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.px)),
                                color: textColor),
                          ),
                          title: Container(
                            height: 15.px,
                            width: 60.px,
                            margin: EdgeInsets.only(
                                left: 10.px, right: 10.px, top: 5.px),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.px)),
                                color: textColor),
                          ),
                        ));
                  }))
          : ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: controller.getClubRequestModel!.result!.length,
              itemBuilder: (context, int index) {
                GetClubRequestResult item =
                    controller.getClubRequestModel!.result![index];
                return GestureDetector(
                  onTap: () {
                    // controller.openListEventActivity(item.id!,item.image!);
                  },
                  child: Container(
                    height: 70.px,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10.px)),
                    ),
                    margin: EdgeInsets.all(10.px),
                    clipBehavior: Clip.hardEdge,
                    child: ListTile(
                      leading: CachedNetworkImage(
                        imageUrl: item.image!,
                        fit: BoxFit.cover,
                        width: 60.px,
                        height: 60.px,
                        placeholder: (BuildContext context, String url) =>
                            Image.asset(
                          ImageConstants.event1Img,
                          fit: BoxFit.fill,
                          height: 60.px,
                        ),
                        errorWidget:
                            (BuildContext context, String url, dynamic error) =>
                                Image.asset(
                          ImageConstants.event1Img,
                          fit: BoxFit.fill,
                          height: 60.px,
                        ),
                      ),
                      title: Text(
                        item.fullName!,
                        style: MyTextStyle.titleStyle16bb,
                      ),
                      subtitle: Text(
                        item.status!,
                        style: MyTextStyle.titleStyle12blb,
                      ),
                      trailing: CommonWidget.commonElevatedButton(
                        onPressed: () {
                          openAlertBox(context, item);
                        },
                        text: 'Change Status',
                        wantContentSizeButton: true,
                        width: 100.px,
                        height: 40.px,
                        borderRadius: 25.px,
                        textStyle: MyTextStyle.titleStyle10bw,
                        buttonColor: primaryColor,
                      ),
                    ),
                  ),
                );
              },
            ));
    });
  }

  /// Show Alert Box...
  void openAlertBox(BuildContext context, GetClubRequestResult model) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Center(
            child: Text(
          "Club/Host Details",
          style: MyTextStyle.titleStyle24bb,
        )),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: Container(
            height: 260.px,
            width: MediaQuery.of(context).size.width - 60.px,
            padding: EdgeInsets.all(10.px),
            child: Column(
              children: [
                ListTile(
                  leading: Text(
                    'Name :',
                    style: MyTextStyle.titleStyle14b,
                  ),
                  title: Text(
                    model.fullName!,
                    style: MyTextStyle.titleStyle14bb,
                  ),
                  horizontalTitleGap: 1.px,
                ),
                ListTile(
                  leading: Text(
                    'Address :',
                    style: MyTextStyle.titleStyle14b,
                  ),
                  title: Text(
                    model.address!,
                    style: MyTextStyle.titleStyle14bb,
                  ),
                  horizontalTitleGap: 1.px,
                ),
                ListTile(
                  leading: Text(
                    'Email :',
                    style: MyTextStyle.titleStyle14b,
                  ),
                  title: Text(
                    model.email!,
                    style: MyTextStyle.titleStyle14bb,
                  ),
                  horizontalTitleGap: 1.px,
                ),
                ListTile(
                  leading: Text(
                    'Status :',
                    style: MyTextStyle.titleStyle14b,
                  ),
                  title: Text(
                    model.status!,
                    style: MyTextStyle.titleStyle14bb,
                  ),
                  horizontalTitleGap: 1.px,
                ),
              ],
            )),
        alignment: Alignment.center,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonWidget.commonElevatedButton(
                  onPressed: () async {
                    Get.back();
                    controller.changeLoading(true);
                    controller.callingUpdateClubRequestForm(
                        model.id!, 'Accepted');
                  },
                  text: StringConstants.accept,
                  wantContentSizeButton: true,
                  width: 120.px,
                  height: 50.px,
                  borderRadius: 25.px,
                  buttonColor: Colors.green),
              CommonWidget.commonElevatedButton(
                  onPressed: () {
                    Get.back();
                    controller.changeLoading(true);
                    controller.callingUpdateClubRequestForm(
                        model.id!, 'Rejected');
                  },
                  text: StringConstants.reject,
                  wantContentSizeButton: true,
                  width: 120.px,
                  height: 50.px,
                  borderRadius: 25.px,
                  buttonColor: Colors.redAccent),
            ],
          ),
        ],
      ),
    );
  }
}
