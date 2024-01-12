import 'package:bluecrown/Apis/api_models/get_response_parties_model.dart';
import 'package:bluecrown/Controller/EventDetailController.dart';
import 'package:bluecrown/constant/imageconstants.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Tool/Color.dart';
import '../Tool/MyTextStyle.dart';
import '../common/CommonWidget.dart';
import '../constant/iconsconstants.dart';
import '../constant/stringconstants.dart';
class EventDetailActivity extends StatefulWidget{
  const EventDetailActivity({super.key});

  @override
  State<StatefulWidget> createState() =>_EventDetailsState();
}
class _EventDetailsState extends State<EventDetailActivity>{
  EventDetailController controller=Get.put(EventDetailController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: primary3Color,
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 340.px,
              width: double.infinity,
              child: Stack(
                children: [
                  Container(
                    height: 300.px,
                    width: double.infinity,
                   margin: EdgeInsets.only(top: 0.px),
                   child: CachedNetworkImage(
                     imageUrl:controller.parameterData['image']!, fit:BoxFit.cover,
                     placeholder: (BuildContext context, String url) => Image.asset(ImageConstants.event1Img,fit: BoxFit.fill,height: 300.px,),
                     errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.event1Img,fit: BoxFit.fill,height: 300.px,),
                   )
                  ),
                  Positioned(
                    bottom: 10.px,left: 10.px,right: 10.px,
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(20.px),topRight: Radius.circular(20.px)),
                        ),
                        color: primary3Color,
                        elevation: 0.px,
                        child: Padding(
                          padding: EdgeInsets.all(10.px),
                          child: Text(StringConstants.test,style: MyTextStyle.titleStyle13bb,textAlign: TextAlign.center,maxLines: 5,),
                        ),
                      )
                  ),
                  Positioned(
                      child:SafeArea(
                          child: Padding(
                            padding:  EdgeInsets.only(left: 15.px,right: 15.px,top: 10.px),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 40.px,
                                  width: 40.px,
                                  child: Card(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(Radius.circular(8.px))
                                      ),
                                      color: primary3Color,
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: 2.px),
                                        child: IconButton(onPressed: (){
                                          Get.back();
                                        },
                                            icon: const Icon(Icons.arrow_back_ios,size: 20,color: textColor,)
                                        ),
                                      )
                                  ),
                                ),


                                Row(
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 10.px),
                                      child: GestureDetector(
                                          onTap:(){},
                                          child: Image.asset(IconsConstants.crowneIcon,height: 30.px,width: 30.px,fit: BoxFit.fill,color: primary3Color,)
                                      ),
                                    ),
                                    Padding(
                                      padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 10.px),
                                      child: GestureDetector(
                                          onTap:(){},
                                          child: Image.asset(IconsConstants.profileIcon,height: 30.px,width: 30.px,fit: BoxFit.fill,)
                                      ),
                                    ),

                                  ],
                                )
                              ],
                            ),
                          )

                      ), ),

                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:showEventsList() ,
              ),
            ),

          ],
        )

    );
  }

  /// Show All Events...
  Widget showEventsList(){
    return Obx(() =>controller.showNearEventsProgressBar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showNearEventsProgressBar.value,
        child:ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context,int index){
              return  Container(
                height: 100.px,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
                decoration: BoxDecoration(
                  // color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10.px))
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        height: 100.px,
                        margin:  EdgeInsets.only(left: 10.px,right: 10.px),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.px)),
                            color:textColor
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 15.px,width:150.px,
                            margin: EdgeInsets.all(10.px),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.px)),
                                color: textColor
                            ),
                          ),
                          Container(
                            height: 10.px,width:100.px,
                            margin:  EdgeInsets.all(5.px),
                            decoration:  BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.px)),
                                color: textColor
                            ),
                          ),
                          Container(
                            height:  10.px,width:120.px,
                            margin: EdgeInsets.all(5.px),
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.px)),
                                color: textColor
                            ),
                          ),
                          Container(
                            height: 10.px,width:100.px,
                            margin: EdgeInsets.all(5.px),
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5.px)),
                                color: textColor
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
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
      itemCount: controller.getPartiesModel!.result!.length,
      itemBuilder: (context, int index) {
        GetPartiesResult item=controller.getPartiesModel!.result![index];
        return GestureDetector(
          onTap: () {
            controller.openCreateListActivity(item.id!);
          },
          child:Container(
            height: 100.px,
            width: double.infinity,
            margin: EdgeInsets.all(10.px),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(5)),
            ),
            child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 2,
                    child: Center(child:
                    Container(
                      height: 100.px,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.px)),
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: CachedNetworkImage(
                          imageUrl:item.image!, fit:BoxFit.cover,
                          placeholder: (BuildContext context, String url) => CommonWidget.commonShimmer(
                              shimmerWidget: Container(
                                height: 100.px,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                                    color: Colors.black
                                ),
                              )
                          ),
                          errorWidget: (BuildContext context, String url, dynamic error) => Image.asset(ImageConstants.event1Img,fit: BoxFit.fill,height: 100.px,),
                        )
                    )
                    )
                ),
                 Expanded(
                   flex: 3,
                   child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 5,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 5.px),
                                  child: Text(item.name!,style: MyTextStyle.titleStyle14bb,),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Padding(
                                  padding:  EdgeInsets.only(right: 10.px),
                                  child:  Icon(Icons.star_border,size: 25.px,color: primaryColor,)
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Padding(
                                    padding:  EdgeInsets.only(left: 5.px),
                                    child:  Image.asset(IconsConstants.calenderIcon,fit: BoxFit.fill,color: Colors.grey,)
                                ),
                              ),
                              Expanded(
                                flex: 8,
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.px,left: 5.px),
                                  child: Text(item.partyDate!,style: MyTextStyle.titleStyle12blb,overflow: TextOverflow.ellipsis,),
                                ),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:  EdgeInsets.only(left: 5.px),
                                  child:  Image.asset(IconsConstants.timeIcon,fit: BoxFit.cover,)
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10.px,left: 5.px),
                                child: Text(item.partyTime!,style: MyTextStyle.titleStyle12blb,),
                              ),

                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:  EdgeInsets.only(left: 5.px),
                                  child:  Image.asset(IconsConstants.locationIcon,fit: BoxFit.cover,)
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 10.px,left: 5.px),
                                child: Text(item.locattion!,style: MyTextStyle.titleStyle12blb,),
                              ),

                            ],
                          ),

                        ],
                      ),
                 )
              ],
            ),
          ),
        );
      },
    )
    );
  }

}