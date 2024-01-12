/*
import 'package:bluecrown/Controller/ListController.dart';
import 'package:bluecrown/Controller/MineOfferController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/constant/imageconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../constant/iconsconstants.dart';

class MineOfferActivity extends StatefulWidget {
  const MineOfferActivity({super.key});

  @override
  State<MineOfferActivity> createState() => _MineOfferState();
}

class _MineOfferState extends State<MineOfferActivity> {
  MineOfferController controller = Get.put(MineOfferController());


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
                  borderRadius: BorderRadius.all(Radius.circular(8.px))
              ),
              color: editTextButton,
              margin: EdgeInsets.all(10.px),
              child: Padding(
                padding: EdgeInsets.only(left: 3.px),
                child: IconButton(onPressed: () {
                  Get.back();
                },
                    icon: const Icon(
                      Icons.arrow_back_ios, size: 20, color: textColor,)
                ),
              )
          ),
        )
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.px))
              ),
              color: primaryColor,
              margin: EdgeInsets.all(10.px),
              elevation: 0.px,
              child: SizedBox(
                height: 150.px,
                width: double.infinity,
                child: GestureDetector(
                  onTap: () {
                    //openSelectedAlertBox();
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(IconsConstants.crowneIcon, height: 40.px, width: 40.px, fit: BoxFit.fill,color: primary3Color,),
                      Text(StringConstants.premium, style: MyTextStyle.titleStyle12bw,),
                      SizedBox(height: 5.px,),
                      Text(StringConstants.mineOffers, style: MyTextStyle.titleStyle20bw,),
                      SizedBox(height: 5.px,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width-150.px,
                          child: Text(StringConstants.collectPointsOnEveryEntrance, style: MyTextStyle.titleStyle12bw,textAlign: TextAlign.center,)),
                    ],
                  ),
                ),
              )
          ),

          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: showEventsList(),
            ),
          ),


          SizedBox(height: 20.px,),


        ],
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }


  /// Show All Events...
  Widget showEventsList() {
    return GetBuilder<MineOfferController>(builder: (context) {
      return
        Obx(() =>
        controller.showNearEventsProgressBar.value ?
        Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            enabled: controller.showNearEventsProgressBar.value,
            child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 270,
                    width: double.infinity,
                    margin: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 0),
                    decoration: const BoxDecoration(
                      // color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 40, width: 40,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(20)),
                                color: textColor
                            ),
                          ),
                          //horizontalTitleGap: 5.0,
                          title: Container(
                            height: 15, width: 80,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                color: textColor
                            ),
                          ),
                          trailing: Container(
                            height: 40, width: 80,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10)),
                                color: textColor
                            ),
                          ),
                        ),
                        Container(
                          height: 15, width: double.infinity,
                          margin: const EdgeInsets.only(left: 10, right: 10),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5)),
                              color: textColor
                          ),
                        ),
                        Container(
                          height: 150, width: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 10, right: 10, top: 5),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(10)),
                              color: textColor
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 20, width: 50,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5)),
                                  color: textColor
                              ),
                            ),
                            Container(
                              height: 20, width: 50,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5)),
                                  color: textColor
                              ),
                            ),
                            Container(
                              height: 20, width: 50,
                              margin: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(5)),
                                  color: textColor
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }
            )
        ) :
        GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.names.length,
          gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 4.0,
              mainAxisSpacing: 4.0,
              childAspectRatio: 180/200
          ),
          itemBuilder: (context, index){
            return
              GestureDetector(
                onTap: (){
                  //controller.openProductDetailPages(item.id!);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                  ),
                  margin:  EdgeInsets.only(top: 10.px,bottom: 10.px,left: 10.px,right: 10.px),
                    elevation: 1.px,

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [

                        SizedBox(height: 10.px,),
                        Text(controller.names[index],style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.center),
                        SizedBox(height: 25.px,),
                        Image.asset(IconsConstants.tableIcon,height: 60.px,width: 60.px,fit: BoxFit.fill,),
                        SizedBox(height: 25.px,),
                        Padding(
                          padding: EdgeInsets.all(5.0.px),
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 1,
                                  child: Row(
                                    children: [
                                      Image.asset(IconsConstants.subCrownIcon,height: 20.px,width: 30.px,fit: BoxFit.fill,),
                                      SizedBox(width: 5.px,),
                                      Text('50P',style: MyTextStyle.titleStyle16bb,textAlign: TextAlign.start,),
                                    ],
                                  )
                              ),
                              const Expanded(
                                flex: 1,
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child:  Icon(Icons.arrow_forward_ios_outlined,size: 18,)),)
                            ],
                          ),
                        )
                      ],
                    ),

                ),
              );
          },)
        );
    });
  }
} */