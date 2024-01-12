
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/WardrobeController.dart';
class WardrobeActivity extends StatefulWidget {
  const WardrobeActivity({super.key});

  @override
  State<WardrobeActivity> createState() => _WardrobeState();
}

class _WardrobeState extends State<WardrobeActivity> {
  WardrobeController controller=Get.put(WardrobeController());


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
         title: Text(StringConstants.wardrobe,style: MyTextStyle.titleStyle20bb,),
        centerTitle: true,
        actions: [
          Padding(
            padding:  EdgeInsets.only(left: 5.px,right: 15.px,top: 10.px,bottom: 10.px),
            child: GestureDetector(
                onTap:(){},
                child: Image.asset(IconsConstants.profileIcon,height: 30.px,width: 30.px,)
            ),
          ),
          /*Padding(
            padding:  EdgeInsets.only(left: 5.px,right: 15.px,top: 10.px,bottom: 10.px),
            child: GestureDetector(
                onTap:(){
                  controller.openMineOfferActivity();
                  },
                child: Image.asset(IconsConstants.crowneIcon,height: 30.px,width: 30.px,fit: BoxFit.fill,)
            ),
          ),  */
        ],
      ),
      body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.px,),
              ListTile(
                onTap: (){
                  controller.openWardrobeListActivity();
                },
                leading: Image.asset(IconsConstants.wordRobeIcon,height: 50.px,width: 50.px,),
                title: Text(StringConstants.handInJacket,style: MyTextStyle.titleStyle16bb,),
              ),
              SizedBox(height: 20.px,),
              ListTile(
                onTap: (){
                  controller.openCurrentWardrobeActivity();
                },
                leading: Image.asset(IconsConstants.wordRobeIcon,height: 50.px,width: 50.px,),
                title: Text(StringConstants.currentJacket,style: MyTextStyle.titleStyle16bb,),
              ),
              SizedBox(height: 30.px,),
              ListTile(
                onTap: (){
                  controller.openHistoricActivity();
                },
                leading: Image.asset(IconsConstants.historyIcon,height: 50.px,width: 50.px,),
                title: Text(StringConstants.history,style: MyTextStyle.titleStyle16bb,),
              ),

              //SizedBox(height: 20.px,),

              SizedBox(height: 10.px,),


            ],
          ),
    );


  }
}