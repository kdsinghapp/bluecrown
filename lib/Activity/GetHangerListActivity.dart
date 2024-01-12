import 'package:bluecrown/Apis/api_models/get_response_getclubhanger_model.dart';
import 'package:bluecrown/Controller/WardrobeListController.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Controller/GetHangerListController.dart';
import '../Tool/Color.dart';
import '../constant/iconsconstants.dart';
import '../constant/imageconstants.dart';

class GetHangerListActivity extends StatefulWidget{
  const GetHangerListActivity({super.key});

  @override
  State<GetHangerListActivity> createState() =>_GetHangerListState();
}
class _GetHangerListState extends State<GetHangerListActivity>{
  GetHangerListController controller=Get.put(GetHangerListController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor:backgroundColor ,
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
        body:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.px,top: 10.px,right: 20.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Hangers',style: MyTextStyle.titleStyle20bb,),
                  SizedBox(
                    height: 40.px, width: 40.px,
                    child: Image.asset(IconsConstants.wordRobeIcon, fit: BoxFit.cover,),

                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:showClubsHangerList() ,
              ),
            ),

          ],
        )

    );
  }

  /// Show Clubs Hanger List...
  Widget showClubsHangerList() {
    return GetBuilder<WardrobeListController>(builder: (context) {
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
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 100.px,
                    width: double.infinity,
                    margin: EdgeInsets.only(
                        left: 10.px, right: 10.px, top: 10.px, bottom: 0.px),
                    decoration: const BoxDecoration(
                      // color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(10))
                    ),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Container(
                            height: 40.px, width: 60.px,
                            decoration:BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.px)),
                                color: textColor
                            ),
                          ),
                          //horizontalTitleGap: 5.0,
                          title: Container(
                            height: 15.px, width: 80.px,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                color: textColor
                            ),
                          ),
                          subtitle: Container(
                            height: 15.px, width: 50.px,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(5)),
                                color: textColor
                            ),
                          ),
                          trailing: Container(
                            height: 50.px, width: 60.px,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(10.px)),
                                color: textColor
                            ),
                          ),
                        ),
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
          itemCount: controller.getClubHangerModel!.result!.length,
          itemBuilder: (context, int index) {
            GetClubHangerResult item=controller.getClubHangerModel!.result![index];
            return GestureDetector(
              onTap: () {
                controller.openQrScannerActivity(item.qrcode!);
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
                    leading: SizedBox(
                      height: 60.px, width: 80.px,
                      child: Image.asset(ImageConstants.scannerImg,fit: BoxFit.fill,height: 60.px,),
                    ),
                    title: Text(item.qrcode!, style: MyTextStyle.titleStyle16bb,),
                    trailing: SizedBox(
                      height: 40.px, width: 60.px,
                      child:Text('Booked \n${item.booked!}', style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),

                    ),
                  )
              ),
            );
          },
        )
        );
    });
  }

}