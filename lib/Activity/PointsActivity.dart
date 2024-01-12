
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/PointsController.dart';
class PointActivity extends StatefulWidget {
  const PointActivity({super.key});

  @override
  State<PointActivity> createState() => _PointState();
}

class _PointState extends State<PointActivity> {
  PointsController controller=Get.put(PointsController());


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

        title: Center(child: Padding(
          padding: EdgeInsets.only(right: 50.px),
          child: Text(StringConstants.points,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
        )),
        centerTitle: true,
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
                      Text(StringConstants.yourPoints, style: MyTextStyle.titleStyle20bw,),
                      SizedBox(height: 5.px,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(IconsConstants.subCrownIcon, height: 30.px, width: 40.px, fit: BoxFit.fill,color: primary3Color,),
                          SizedBox(width: 5.px,),
                           Obx(() =>  Text('${controller.points} P', style: MyTextStyle.titleStyle20bw,),)
                        ],
                      ),

                    ],
                  ),
                ),
              )
          ),
          SizedBox(height: 20.px,),
          GestureDetector(
            onTap: (){
              controller.openUsePointsActivity();
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.px))
              ),
              clipBehavior: Clip.hardEdge,
              elevation: 0.px,
              color: cartColor,
              margin: EdgeInsets.only(left: 15.px,right: 15.px,),
              child: SizedBox(
                height: 80.px,width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconsConstants.subCrownIcon, height: 20.px, width: 30.px, fit: BoxFit.fill,),
                    Text('Use', style: MyTextStyle.titleStyle16bb,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.px,),
          GestureDetector(
            onTap: (){
              controller.openMainQrCodeActivity();
            },
            child: Card(

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.px))
              ),
              clipBehavior: Clip.hardEdge,
              elevation: 0.px,
              color: cartColor,
              margin: EdgeInsets.only(left: 15.px,right: 15.px,),
              child: SizedBox(
                height: 80.px,width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconsConstants.subCrownIcon, height: 20.px, width: 30.px, fit: BoxFit.fill,),
                    Text('Get more', style: MyTextStyle.titleStyle16bb,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20.px,),
          GestureDetector(
            onTap: (){
              controller.openHowToEarnPointsActivity();
            },
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.px))
              ),
              clipBehavior: Clip.hardEdge,
              elevation: 0.px,
              color: cartColor,
              margin: EdgeInsets.only(left: 15.px,right: 15.px,),
              child: SizedBox(
                height: 80.px,width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconsConstants.subCrownIcon, height: 20.px, width: 30.px, fit: BoxFit.fill,),
                    Text('How do i earn Use more points?', style: MyTextStyle.titleStyle16bb,),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: 20.px,),


        ],
      ),
    );


  }
}