
import 'package:bluecrown/Apis/api_models/get_response_published_myevent_model.dart';
import 'package:bluecrown/Controller/ClubAdminController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/imageconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

class ClubAdminActivity extends StatefulWidget {
  const ClubAdminActivity({super.key});

  @override
  State<ClubAdminActivity> createState() => _ClubAdminState();
}

class _ClubAdminState extends State<ClubAdminActivity> {
  ClubAdminController controller=Get.put(ClubAdminController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primary3Color ,
      bottomNavigationBar:
      Padding(
        padding:  EdgeInsets.only(left: 20.px,right: 20.px,bottom: 5.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CommonWidget.commonElevatedButton(
                onPressed: (){
                  controller.openAdminWardrobeActivity();
                },
                text: StringConstants.wardrobe,
                wantContentSizeButton: true,
                width: 120.px,
                height: 50.px,
                borderRadius: 25.px
            ),
            CommonWidget.commonElevatedButton(
                onPressed: (){
                  controller.openConsumerActivity();
                },
                text: StringConstants.customerRegister,
                wantContentSizeButton: true,
                width: 120.px,
                height: 50.px,
                borderRadius: 25.px,
                buttonColor: Colors.grey
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8.px))
                      ),
                      color: editTextButton,
                      margin: EdgeInsets.all(10.px),
                      child: SizedBox(
                        height: 30.px,width: 30.px,
                        child: GestureDetector(
                          onTap:(){
                            Get.back();
                          },
                          child:Padding(
                            padding: EdgeInsets.only(left: 4.px),
                            child: const Icon(Icons.arrow_back_ios,size: 20,color: textColor,),
                          ),
                        ),
                      )
                  ),
                  Row(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 5.px),
                        child: GestureDetector(
                            onTap: (){
                              controller.openCreateWardrobeQrCodeActivity();
                              },
                            child: Image.asset(IconsConstants.wordRobeIcon,height: 35.px,width: 35.px,fit: BoxFit.fill,)),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 10.px),
                        child: GestureDetector(
                            onTap:(){
                              controller.openClubPurchasedUserActivity();
                            },
                            child: Column(
                              children: [
                                Icon(Icons.person_add_alt_rounded,size: 25.px,color: primaryColor,),
                                Text('Purchase',style: MyTextStyle.titleStyle12b,),
                                // Image.asset(IconsConstants.profileIcon,height: 30.px,width: 30.px,),
                              ],
                            )
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(left: 5.px,right: 15.px,top: 10.px,bottom: 10.px),
                        child: GestureDetector(
                            onTap:(){
                              controller.openBookingRequestActivity();
                            },
                            child: Column(
                              children: [
                                Icon(Icons.person_add_alt_rounded,size: 25.px,color: primaryColor,),
                                Text('Booking',style: MyTextStyle.titleStyle12b,),
                                // Image.asset(IconsConstants.profileIcon,height: 30.px,width: 30.px,),
                              ],
                            )
                        ),
                      ),
                    ],
                  )
                ],
              )
          ),
          Text(StringConstants.clubAdminPage,style: MyTextStyle.titleStyle20bb,),
          GestureDetector(
            onTap: (){
              controller.openPublishEventActivity();
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(25.px))
              ),
              color: primaryColor,
              elevation: 0.px,
              margin: EdgeInsets.only(top: 10.px,right: 10.px,left: 10.px,bottom: 10.px),
              child: Container(
                height: 50.px,
                margin: EdgeInsets.only(left: 20.px,right: 20.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(StringConstants.publishEvent,style: MyTextStyle.titleStyle16bw,),
                    SizedBox(
                      height: 30.px, width: 30.px,
                      child: Image.asset(IconsConstants.dateIcon, fit: BoxFit.fill,color: Colors.white,),
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:showPublishedList() ,
            ),
          ),

          //SizedBox(height: 20.px,),

          SizedBox(height: 10.px,),


        ],
      ),
    );


  }

  /// Show Publish List List...
  Widget showPublishedList() {
      return
      Obx(() =>
      controller.showProgressBar.value ?
      Shimmer.fromColors(
          baseColor: Colors.grey[300]!,
          highlightColor: Colors.white,
          enabled: controller.showProgressBar.value,
          child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 80.px,
                  width: double.infinity,
                  margin: EdgeInsets.only(left:15.px,right: 15.px,top: 5.px,bottom: 5.px),
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
                                height: 40.px, width: 100.px,
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
          return Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.px))
            ),
            margin: EdgeInsets.only(left:15.px,right: 15.px,top: 5.px,bottom: 5.px),
            color: cartColor,
            elevation: 1.px,
            child: Container(
                height: 80.px,
                margin: EdgeInsets.all(10.px),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(item.name!, style: MyTextStyle.titleStyle14blb,),
                       CommonWidget.commonElevatedButton(
                            onPressed: (){
                              controller.openChangeEventActivity(index);
                            },
                          text: StringConstants.change,
                          height: 40.px,
                          width: 120.px,
                           buttonMargin: EdgeInsets.only(top: 10.px),
                          borderRadius: 20.px,
                           wantContentSizeButton:true

                        )

                      ],
                    ),

                    GestureDetector(
                      onTap: (){
                        controller.openDownloadActivity(item.qrCode!);
                      },
                      child: SizedBox(
                        width: 70.px,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20.px, width: 30.px,
                                  child: Image.asset(IconsConstants.subCrownIcon, fit: BoxFit.fill,),
                                ),
                                SizedBox(width: 5.px,),
                                Text(item.points!, style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                              ],
                            ),
                            SizedBox(height: 10.px,),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(ImageConstants.scannerImg,width: 25,height: 25,fit: BoxFit.cover,),
                                Icon(Icons.download,size: 25.px,color: primaryColor,),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                )
            ),
          );
        },
      )
      );
  }

}