import 'package:bluecrown/Apis/api_models/get_response_getclubhanger_model.dart';
import 'package:bluecrown/Controller/ClubAllHangerListController.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';
import '../Tool/Color.dart';
import '../constant/iconsconstants.dart';
import '../constant/imageconstants.dart';

class ClubAllHangerListActivity extends StatefulWidget{
  const ClubAllHangerListActivity({super.key});

  @override
  State<ClubAllHangerListActivity> createState() =>_ClubAllHangerListState();
}
class _ClubAllHangerListState extends State<ClubAllHangerListActivity>{
  ClubAllHangerListController controller=Get.put(ClubAllHangerListController());
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
                  Text('Hangers',style: MyTextStyle.titleStyle18bb,),
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
    return GetBuilder<ClubAllHangerListController>(builder: (context) {
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
                controller.openDownloadQrImageActivity(item.qrcode!);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.px))
                ),
                margin: EdgeInsets.only(left:15.px,right: 15.px,top: 5.px,bottom: 5.px),
                color: cartColor,
                elevation: 1.px,
                child: Container(
                    height: 80.px,
                    margin: EdgeInsets.all(5.px),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                    child:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Row(
                         children: [
                           Image.asset(ImageConstants.scannerImg,width: 100.px,height: 60.px,),
                           SizedBox(width: 5.px,),
                           Text(item.qrcode!, style: MyTextStyle.titleStyle14bb,textAlign: TextAlign.center,),
                         ],
                       ),

                        GestureDetector(
                          onTap: (){
                           // controller.openDownloadActivity(item.points!);
                          },
                          child: SizedBox(
                            width: 90.px,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Status: ', style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,),
                                    Text(item.status!, style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,),
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
              ),
            );
          },
        )
        );
    });
  }

}