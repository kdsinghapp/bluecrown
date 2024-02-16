import 'package:bluecrown/Apis/api_models/get_response_bookingrequestmodel.dart';
import 'package:bluecrown/Apis/api_models/get_response_category_model.dart';
import 'package:bluecrown/Controller/BookingRequestController.dart';
import 'package:bluecrown/Controller/MainListController.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/imageconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';
import 'package:shimmer/shimmer.dart';

import '../Tool/Color.dart';
import '../constant/iconsconstants.dart';
import '../constant/stringconstants.dart';

class BookingRequestActivity extends StatefulWidget{
  const BookingRequestActivity({super.key});

  @override
  State<StatefulWidget> createState() =>_BookingRequestState();
}
class _BookingRequestState extends State<BookingRequestActivity>{
  BookingRequestController controller=Get.put(BookingRequestController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: primary3Color,
        appBar: AppBar(
          backgroundColor: primary3Color,
          elevation: 0.px,
          title: Center(child: Text('List Requests',style: MyTextStyle.titleStyle20bb,)),
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
          actions: [
            Padding(
              padding:  EdgeInsets.only(left: 5.px,right: 15.px,top: 10.px,bottom: 10.px),
              child: GestureDetector(
                  onTap:(){},
                  child: Image.asset(IconsConstants.profileIcon,height: 30.px,width: 30.px,)
              ),
            ),
          ],
        ),
        bottomNavigationBar:Padding(
            padding:  EdgeInsets.only(left: 10.px,right: 10.px,bottom: 0.px),
            child:
            Obx(() => controller.btnLoading.value?
            Container(
              width: double.infinity,
              height: 50,
              margin: EdgeInsets.all(10.px),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25.px)),
                  color: primaryColor
              ),
              child:  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                      height:30,width:30,
                      child:CircularProgressIndicator(color:primary3Color,)
                  ),
                  const SizedBox(width: 10,),
                  Text("Loading...",style: MyTextStyle.titleStyle16bw,),

                ],
              ),
            ):
            CommonWidget.commonElevatedButton(
                onPressed: (){
                  controller.changeButtonProgressBar(true);
                  controller.saveScreenshot();
                },
                text: StringConstants.download,
                buttonMargin: EdgeInsets.all(10.px,),
                borderRadius: 25.px

            ),
            )
        ),
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.px,),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      controller.changeTabIndex(0);
                    },
                    child:Obx(() => Container(
                      height: 40.px,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 10.px,right: 5.px),
                      decoration: BoxDecoration(
                          color:controller.tabIndex.value==0?primaryColor:primary3Color,
                          borderRadius: BorderRadius.all(Radius.circular(10.px)),
                          border: Border.all(color:primaryColor,width: 1.px)
                      ),
                      child: Text("Normal List",style:controller.tabIndex.value==0?MyTextStyle.titleStyle16bw:MyTextStyle.titleStyle16bb,
                        textAlign: TextAlign.center,),
                    )),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      controller.changeTabIndex(1);
                    },
                    child: Obx(() => Container(
                      height: 40.px,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(left: 5.px,right: 10.px),
                      decoration: BoxDecoration(
                          color:controller.tabIndex.value==1?primaryColor:primary3Color,
                          borderRadius: BorderRadius.all(Radius.circular(10.px)),
                          border: Border.all(color:primaryColor,width: 1.px)
                      ),
                      child: Text("Vip List",style:controller.tabIndex.value==1?MyTextStyle.titleStyle16bw:MyTextStyle.titleStyle16bb,
                        textAlign: TextAlign.center,),
                    )),
                  ),
                ),

              ],
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:Screenshot(
                  controller: controller.screenshotController,
                    child: Container(
                       decoration: const BoxDecoration(
                         color: Colors.white
                       ),
                        child: showNearEvents())) ,
              ),
            ),

          ],
        )

    );
  }

  /// Show Near Events...
  Widget showNearEvents(){
    return Obx(() =>controller.showBookingRequestProgressBar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showBookingRequestProgressBar.value,
        child:ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return  Container(
                height: 90.px,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
                decoration: const BoxDecoration(
                  // color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Container(
                  height: 90.px,width: double.infinity,
                  margin: const EdgeInsets.only(left: 10,right: 10,top: 5),
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: textColor
                  ),
                ),
              );
            }
        )
    ):
    ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      scrollDirection: Axis.vertical,
      itemCount: controller.getBookingRequestModel!.result!.length,
      itemBuilder: (context, int index) {
        GetBookingRequest item=controller.getBookingRequestModel!.result![index];
        return GestureDetector(
          onTap: () {
            //controller.openListEventActivity(item.id!,item.image!);
          },
          child:Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.px))
            ),
            elevation: 2.px,
            margin: EdgeInsets.only(left:15.px,right: 15.px,top: 5.px,bottom: 5.px),
            color: cartColor,
            child:Container(
                height: 90.px,
                width: double.infinity,
                decoration:  BoxDecoration(
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
                        Text(item.fullName!,style: MyTextStyle.titleStyle16b,),
                        SizedBox(height: 5.px,),
                        Text(item.eventName!,style: MyTextStyle.titleStyle14b,),
                        SizedBox(height: 5.px,),
                        Text(item.eventDate!,style: MyTextStyle.titleStyle16b,),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        item.type=='Vip'?Icon(Icons.star,size: 20.px,color: Colors.green,):
                        SizedBox(height: 5.px,width: 5.px,),
                        SizedBox(height: 5.px,),
                        Text('${item.totalPeople.toString()} +',style: MyTextStyle.titleStyle14b,),
                      ],
                    ),
                  ],
                )
            ),
          ),
        );
      },
    )
    );
  }

}