import 'package:bluecrown/Apis/api_models/get_response_getfriends_model.dart';
import 'package:bluecrown/Controller/ConsumerController.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Tool/Color.dart';
import '../constant/iconsconstants.dart';

class ConsumerActivity extends StatefulWidget{
  const ConsumerActivity({super.key});

  @override
  State<ConsumerActivity> createState() =>_ConsumerState();
}
class _ConsumerState extends State<ConsumerActivity>{
  ConsumerController controller=Get.put(ConsumerController());
  @override
  Widget build(BuildContext context){
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
            SafeArea(
              child:Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0.px),
                ),
                semanticContainer: true,
                clipBehavior: Clip.none,
                elevation: 0.px,
                color: cartColor,
                margin: EdgeInsets.all(10.px),
                child: GestureDetector(
                  onTap: () {
                    controller.openConsumerSearchActivity();
                  },
                    child:ListTile(
                   leading:Icon(Icons.search_rounded, color: primaryColor, size: 25.px,),
                      title: Text('Search Consumer',style: MyTextStyle.titleStyle14bb,),

                    )

                ),
              ),

            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:showFriendsList() ,
              ),
            ),

          ],
        )

    );
  }

  /// Show Friends List...
  Widget showFriendsList() {
    return Obx(() =>
    controller.showFriendsProgressBar.value ?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showFriendsProgressBar.value,
        child: ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            padding: EdgeInsets.zero,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 95.px,
                width: double.infinity,
                margin: const EdgeInsets.only(
                    left: 10, right: 10, top: 10, bottom: 0),
                decoration: const BoxDecoration(
                  // color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(

                      title: Container(
                        height: 15, width: 80,
                        margin: EdgeInsets.only(right: 50.px),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(5)),
                            color: textColor
                        ),
                      ),
                      horizontalTitleGap: 0.px,
                      trailing: Container(
                        height: 30.px, width: 30.px,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(5.px)),
                            color: textColor
                        ),
                      ),
                    ),
                    Container(
                      height: 15.px, width: 60.px,
                      margin:  EdgeInsets.only(left: 20.px, right: 20.px,bottom: 5.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(5.px)),
                          color: textColor
                      ),
                    ),
                    Container(
                      height: 15.px, width: 100.px,
                      margin:  EdgeInsets.only(left: 20.px, right: 20.px),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                              Radius.circular(5.px)),
                          color: textColor
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
      itemCount: controller.getFriendsModel!.result!.length,
      itemBuilder: (context, int index) {
        GetFriendsResult item=controller.getFriendsModel!.result![index];
        return GestureDetector(
          onTap: () {
            //controller.openMonthActivity();
          },
          child: Container(
              height: 80.px,
              //width: double.infinity,
              margin: EdgeInsets.all(15.px),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.fullName!, style: MyTextStyle.titleStyle16bb,),
                      SizedBox(height: 3.px,),
                      Text('DOB ${item.dob}', style: MyTextStyle.titleStyle14bb,),
                      SizedBox(height: 3.px,),
                      Row(
                        children: [
                          Image.asset(IconsConstants.subCrownIcon,height: 20.px,width: 30.px,fit: BoxFit.contain,),
                          SizedBox(width: 3.px,),
                          Text('50', style: MyTextStyle.titleStyle14bb,),
                        ],
                      )
                    ],
                  ),
                  Container(
                    height: 25.px, width: 25.px,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(5.px)),
                     color: primaryColor
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