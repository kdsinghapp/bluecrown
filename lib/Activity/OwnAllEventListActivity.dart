import 'package:bluecrown/Apis/api_models/get_response_published_myevent_model.dart';
import 'package:bluecrown/Controller/OwnAllEventListController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class OwnAllEventListActivity extends StatefulWidget {
  const OwnAllEventListActivity({super.key});

  @override
  State<OwnAllEventListActivity> createState() => _OwnAllEventListState();
}

class _OwnAllEventListState extends State<OwnAllEventListActivity> {
  OwnAllEventListController controller = Get.put(OwnAllEventListController());

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
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            'Choose Event',
            style: MyTextStyle.titleStyle18bb,
            textAlign: TextAlign.center,
          ),
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0.px),
            ),
            semanticContainer: true,
            clipBehavior: Clip.none,
            elevation: 0.px,
            color: cartColor,
            margin: EdgeInsets.only(top: 10.px, left: 15.px, right: 15.px),
            child: TextFormField(
              style: const TextStyle(
                fontSize: 14,
                fontFamily: 'FontBold',
              ),
              controller: controller.searchController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(
                    vertical: 15.0.px, horizontal: 10.0.px),
                hintText: StringConstants.search,
                hintStyle: MyTextStyle.titleStyle16b,
                prefixIcon: Icon(
                  Icons.search_rounded,
                  color: primaryColor,
                  size: 25.px,
                ),
                suffixIcon: Container(
                  height: 20.px,
                  width: 20.px,
                  padding: EdgeInsets.all(8.px),
                  child: Image.asset(
                    IconsConstants.filterIcon,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              onChanged: (text) {
                controller
                    .changeFilterEventList(controller.searchController.text);
              },
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: showPublishedList(),
            ),
          ),
        ],
      ),
    );
  }

  /// Show Publish List List...
  Widget showPublishedList() {
    return GetBuilder<OwnAllEventListController>(builder: (context) {
      return Obx(() => controller.showProgressBar.value
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.white,
              enabled: controller.showProgressBar.value,
              child: ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 100.px,
                      width: double.infinity,
                      margin: EdgeInsets.only(
                          left: 15.px, right: 15.px, top: 5.px, bottom: 0.px),
                      decoration: const BoxDecoration(
                          // color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 15.px,
                                  width: 200.px,
                                  decoration: const BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(5)),
                                      color: textColor),
                                ),
                                Container(
                                  height: 15.px,
                                  width: 70.px,
                                  margin: EdgeInsets.only(top: 10.px),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.px)),
                                      color: textColor),
                                ),
                                Container(
                                  height: 15.px,
                                  width: 120.px,
                                  margin: EdgeInsets.only(top: 10.px),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10.px)),
                                      color: textColor),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              height: 40.px,
                              width: 60.px,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.px)),
                                  color: textColor),
                            ),
                          )
                        ],
                      ),
                    );
                  }))
          : ListView.builder(
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.vertical,
              itemCount: controller.filterEventList.length ?? 0,
              itemBuilder: (context, int index) {
                PublishMyEventResult item = controller.filterEventList[index];
                return GestureDetector(
                  onTap: () {
                    openAlertBox(context, item, index);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.px))),
                    margin: EdgeInsets.only(
                        left: 15.px, right: 15.px, top: 5.px, bottom: 0.px),
                    elevation: 1.px,
                    child: Container(
                        height: 80.px,
                        margin: EdgeInsets.all(10.px),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item.name!,
                                  style: MyTextStyle.titleStyle14b,
                                ),
                                Text(
                                  item.style!,
                                  style: MyTextStyle.titleStyle14b,
                                ),
                                Text(
                                  '${item.fromDate!} to ${item.fromDate!}',
                                  style: MyTextStyle.titleStyle14b,
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 70.px,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
                                      SizedBox(
                                        width: 5.px,
                                      ),
                                      Text(
                                        item.points!,
                                        style: MyTextStyle.titleStyle14bb,
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                );
              },
            ));
    });
  }

  /// Show Alert Box...
  void openAlertBox(
      BuildContext context, PublishMyEventResult model, int index) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Center(
            child: Text(
          model.name!,
          style: MyTextStyle.titleStyle24bb,
          textAlign: TextAlign.center,
        )),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))),
        content: Container(
            height: 170.px,
            width: MediaQuery.of(context).size.width - 60.px,
            padding: EdgeInsets.all(10.px),
            child: Column(
              children: [
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 3.px),
                    child: Text(
                      'Points :',
                      style: MyTextStyle.titleStyle14b,
                    ),
                  ),
                  title: SizedBox(
                    height: 20.px,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          model.points!,
                          style: MyTextStyle.titleStyle14bb,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 10.px,
                        ),
                        Image.asset(
                          IconsConstants.subCrownIcon,
                          width: 25.px,
                          height: 20.px,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                  horizontalTitleGap: 1.px,
                ),
                ListTile(
                  leading: Padding(
                    padding: EdgeInsets.only(top: 3.px),
                    child: Text(
                      'Entrance Cost :',
                      style: MyTextStyle.titleStyle14b,
                    ),
                  ),
                  title: SizedBox(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          model.entranceCost!,
                          style: MyTextStyle.titleStyle14bb,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          width: 10.px,
                        ),
                        Image.asset(
                          IconsConstants.subCrownIcon,
                          width: 25.px,
                          height: 20.px,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  ),
                  horizontalTitleGap: 1.px,
                ),
              ],
            )),
        alignment: Alignment.center,
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CommonWidget.commonElevatedButton(
                  onPressed: () async {
                    Get.back();
                    controller.openSelfAllListActivity(model.id!);
                  },
                  text: StringConstants.cont,
                  wantContentSizeButton: true,
                  width: 130.px,
                  height: 50.px,
                  borderRadius: 25.px,
                  buttonColor: primaryColor,
                  buttonMargin: EdgeInsets.only(bottom: 20.px)),
              /*  CommonWidget.commonElevatedButton(
                  onPressed: (){
                    Get.back();
                  },
                  text: StringConstants.reject,
                  wantContentSizeButton: true,
                  width: 120.px,
                  height: 50.px,
                  borderRadius: 25.px,
                  buttonColor: Colors.redAccent
              ),*/
            ],
          ),
        ],
      ),
    );
  }
}
