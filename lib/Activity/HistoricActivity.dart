
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/HistoricController.dart';
class HistoricActivity extends StatefulWidget {
  const HistoricActivity({super.key});

  @override
  State<HistoricActivity> createState() => _HistoricState();
}

class _HistoricState extends State<HistoricActivity> {
  HistoricController controller=Get.put(HistoricController());


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
        title: Text(StringConstants.historic,style: MyTextStyle.titleStyle20bb,),
        centerTitle: true,
        actions: [
          Padding(
            padding:  EdgeInsets.only(left: 5.px,right: 5.px,top: 10.px,bottom: 10.px),
            child: GestureDetector(
                onTap:(){},
                child: Image.asset(IconsConstants.profileIcon,height: 30.px,width: 30.px,)
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(left: 5.px,right: 15.px,top: 10.px,bottom: 10.px),
            child: GestureDetector(
                onTap:(){
                 // controller.openMineOfferActivity();
                },
                child: Image.asset(IconsConstants.crowneIcon,height: 30.px,width: 30.px,fit: BoxFit.fill,)
            ),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 20.px,),
          Row(
            children: [
              Expanded(
                flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      controller.changeTab(0);
                    },
                    child: Column(
                      children: [
                        Text("Jacek",style: MyTextStyle.titleStyle18bb,),
                        SizedBox(height: 5.px,),
                        Obx(() =>  Visibility(
                            visible: controller.tab.value==0,
                            child: Divider(height: 2,thickness: 2,color: Colors.black,indent: 20.px,endIndent: 20.px,)
                        ))

                      ],
                    ),
                  )
              ),
              Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: (){
                      controller.changeTab(1);
                    },
                    child: Column(
                      children: [
                        Text("Club When",style: MyTextStyle.titleStyle18bb,),
                        SizedBox(height: 5.px,),
                        Obx(() =>  Visibility(
                            visible: controller.tab.value==1,
                            child: Divider(height: 2,thickness: 2,color: Colors.black,indent: 20.px,endIndent: 20.px,)
                        ))

                      ],
                    ),
                  )
              ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child:showHistoricList() ,
            ),
          ),


          //SizedBox(height: 20.px,),

          SizedBox(height: 10.px,),


        ],
      ),
    );


  }

  /// Show HistoricList List...
  Widget showHistoricList() {
    return GetBuilder<HistoricController>(builder: (context) {
      return
        Obx(() =>
        controller.showProgressbar.value ?
        Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.white,
            enabled: controller.showProgressbar.value,
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
        ListView.builder(
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: EdgeInsets.zero,
          scrollDirection: Axis.vertical,
          itemCount: controller.names.length,
          itemBuilder: (context, int index) {
            // GetAllUsersPostResult item=controller.getAllUsersPostModel!.result![index];
            return GestureDetector(
              onTap: () {
                controller.openPointsActivity();
              },
              child: Container(
                  height: 60.px,
                  //width: double.infinity,
                  margin: EdgeInsets.all(10.px),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: ListTile(
                    title: Text(controller.names[index],
                      style: MyTextStyle.titleStyle16bb,),
                    subtitle: Text('Johan Smihs', style: MyTextStyle.titleStyle12blb,),
                    trailing: Text(controller.tab.value==0?'jacek1':'', style: MyTextStyle.titleStyle12blb,),
                  )
              ),
            );
          },
        )
        );
    });
  }
}