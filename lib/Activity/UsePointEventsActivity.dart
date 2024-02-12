import 'package:bluecrown/Apis/api_models/get_response_published_myevent_model.dart';
import 'package:bluecrown/Controller/ClubAllEventListController.dart';
import 'package:bluecrown/Controller/UsePointEventsController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class UsePointEventsActivity extends StatefulWidget {
  const UsePointEventsActivity({super.key});

  @override
  State<UsePointEventsActivity> createState() => _UsePointEventsState();
}

class _UsePointEventsState extends State<UsePointEventsActivity> {
  UsePointEventsController controller=Get.put(UsePointEventsController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primary3Color ,
      appBar: AppBar(
        backgroundColor: primary3Color,
        elevation: 0.px,
        leading: SizedBox(
          height: 40.px,
          width: 40.px,
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.px))
              ),
              color: editTextButton,
              margin: EdgeInsets.all(10.px),
              child: Padding(
                padding:  EdgeInsets.only(left: 3.px),
                child: IconButton(onPressed: (){
                  Get.back();
                },
                    icon: const Icon(Icons.arrow_back_ios,size: 20,color: textColor,)
                ),
              )
          ),
        ),
        title: Center(
          child: Padding(
            padding:  EdgeInsets.only(right: 40.px),
            child: Text('User Points',style: MyTextStyle.titleStyle20bb,),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text('${controller.parameterData['clubName']}\nAll Event List ',style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0.px),
                ),
                semanticContainer: true,
                clipBehavior: Clip.none,
                elevation: 0.px,
                color: primaryColor,
                margin: EdgeInsets.only(top:10.px,left: 15.px,right: 15.px),
                child: SizedBox(
                  width: 150.px,height: 50.px,
                  child: Center(
                    child: Text('Date',style: MyTextStyle.titleStyle16bw,),
                  ),
                )
              ),
              Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0.px),
                  ),
                  semanticContainer: true,
                  clipBehavior: Clip.none,
                  elevation: 3.px,
                  color: Colors.white,
                  margin: EdgeInsets.only(top:10.px,left: 15.px,right: 15.px),
                  child: SizedBox(
                    width: 150.px,height: 50.px,
                    child:Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 25.px, width: 30.px,
                          child: Image.asset(IconsConstants.subCrownIcon, fit: BoxFit.fill,),
                        ),
                        SizedBox(width: 5.px,),
                        Obx(() =>Text(controller.walletAmount.value, style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),)

                      ],
                    ),
                  )
              ),
            ],
          ),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:showPublishedList() ,
            ),
          ),


        ],
      ),
    );


  }

  /// Show Publish List List...
  Widget showPublishedList() {
    return GetBuilder<UsePointEventsController>(builder: (context) {
      return Obx(() =>
      controller.showProgressBar.value ?
      Shimmer.fromColors(
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
                  margin: EdgeInsets.only(left: 15.px, right: 15.px, top: 5.px, bottom: 0.px),
                  decoration: const BoxDecoration(
                    // color: Colors.black,
                      borderRadius: BorderRadius.all(Radius.circular(10))
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 15.px, width: 200.px,
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5)),
                                  color: textColor
                              ),
                            ),
                            Container(
                              height: 15.px, width: 70.px,
                              margin: EdgeInsets.only(top: 10.px),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.px)),
                                  color: textColor
                              ),
                            ),
                            Container(
                              height: 15.px, width: 120.px,
                              margin: EdgeInsets.only(top: 10.px),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(10.px)),
                                  color: textColor
                              ),
                            ),
                          ],
                        ), ),
                      Expanded(
                        flex: 1,
                        child:Container(
                          height: 40.px, width: 60.px,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10.px)),
                              color: textColor
                          ),
                        ), )
                    ],
                  ),
                );
              }
          )
      ) :
      ListView.builder(
        physics: const ClampingScrollPhysics(),
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        scrollDirection: Axis.vertical,
        itemCount: controller.publishMyEventModel!.result!.length??0,
        itemBuilder: (context, int index) {
          PublishMyEventResult item=controller.publishMyEventModel!.result![index];
          return GestureDetector(
            onTap: (){
              controller.openUsePointActivity(item.points!,item.id!);
            },
            child: Padding(
              padding: EdgeInsets.only(top: 10.px,bottom: 10.px),
              child: Column(
                children: [
                  Text(item.name!, style: MyTextStyle.titleStyle14b,),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.px))
                    ),
                    margin: EdgeInsets.only(left: 15.px, right: 15.px, top: 5.px, bottom: 0.px),
                    elevation: 0.px,
                    color: cartColor,
                    child: Container(
                        height: 60.px,
                        width: double.infinity,
                        margin: EdgeInsets.all(10.px),
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 25.px, width: 30.px,
                              child: Image.asset(IconsConstants.subCrownIcon, fit: BoxFit.fill,),
                            ),
                            SizedBox(height: 10.px,),
                            Text(item.points!, style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center,),
                          ],
                        ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ));
    } );
  }


}