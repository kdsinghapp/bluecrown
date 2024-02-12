import 'package:bluecrown/Apis/api_models/get_clubpurchaseduser_model.dart';
import 'package:bluecrown/Apis/api_models/get_response_mypurchasingevents_model.dart';
import 'package:bluecrown/Controller/ClubPurchasedUserController.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../Tool/Color.dart';
import '../constant/iconsconstants.dart';

class ClubPurchasedUserActivity extends StatefulWidget{
  const ClubPurchasedUserActivity({super.key});

  @override
  State<ClubPurchasedUserActivity> createState() =>_ClubPurchasedUserState();
}
class _ClubPurchasedUserState extends State<ClubPurchasedUserActivity>{
  ClubPurchasedUserController controller=Get.put(ClubPurchasedUserController());
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: primary3Color,
        appBar: AppBar(
          backgroundColor: primary3Color,
          elevation: 0.px,
          title: Center(child: Text('Event Purchased User List',style: MyTextStyle.titleStyle18bb,)),
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
            Obx(() => controller.presentData.value?
            const Text("There are not present user",style: TextStyle(fontWeight: FontWeight.normal,
                fontSize: 14,color: Colors.redAccent),textAlign: TextAlign.center,):
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child:showClubPurchasedUser() ,
              ),
            ),)


          ],
        )

    );
  }

  /// Show Club Purchased User List...
  Widget showClubPurchasedUser(){
    return Obx(() =>controller.showClubPurchasedUserProgressBar.value?
    Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.white,
        enabled: controller.showClubPurchasedUserProgressBar.value,
        child:ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 5,
            itemBuilder: (BuildContext context,int index){
              return  Container(
                height: 70.px,
                width: double.infinity,
                margin: const EdgeInsets.only(left: 10,right: 10,top: 10,bottom: 0),
                decoration: const BoxDecoration(
                  // color: Colors.black,
                    borderRadius: BorderRadius.all(Radius.circular(10))
                ),
                child: Container(
                  height: 70.px,width: double.infinity,
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
      itemCount: controller.clubPurchasedUserModel!.result!.length,
      itemBuilder: (context, int index) {
        ClubPurchasedUserResult item=controller.clubPurchasedUserModel!.result![index];
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
            child: Container(
                height: 70.px,
                width: double.infinity,
                decoration:  BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10.px)),
                ),
                margin: EdgeInsets.all(5.px),
                clipBehavior: Clip.hardEdge,
                child: ListTile(
                  horizontalTitleGap: 0.px,
                  title: Text(item.eventName!,style: MyTextStyle.titleStyle14b,),
                  subtitle:Text(item.dateTime!.substring(0,10)??'',style: MyTextStyle.titleStyle16b,),
                  trailing: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(IconsConstants.subCrownIcon,height: 20.px,width: 25.px,fit: BoxFit.fill,),
                      Text(item.amount!,style: MyTextStyle.titleStyle14b,),
                    ],
                  ),
                )
            ),
          ),
        );
      },
    )
    );
  }

}