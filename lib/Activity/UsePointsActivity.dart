import 'package:bluecrown/Controller/LogoutController.dart';
import 'package:bluecrown/Controller/UserPointsController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constant/imageconstants.dart';

class UserPointsActivity extends StatefulWidget {
  const UserPointsActivity({super.key});

  @override
  State<UserPointsActivity> createState() => _LogoutState();
}

class _LogoutState extends State<UserPointsActivity> {
  UserPointsController controller=Get.put(UserPointsController());


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
        title: Text('Use Points',style: MyTextStyle.titleStyle20bb,),
        centerTitle: true,
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
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 20.px,),
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
                            Text('${controller.parameterData['points']} P', style: MyTextStyle.titleStyle20bw,),
                          ],
                        ),

                      ],
                    ),
                  ),
                )
            ),
            SizedBox(height: 30.px,),

            Text('Club  Entry',style: MyTextStyle.titleStyle14bb,),
            SizedBox(height: 10.px,),
            Column(
              children: [
                Image.asset(IconsConstants.subCrownIcon, height: 25.px, width: 30.px, fit: BoxFit.fill,),
                SizedBox(height: 5.px,),
                Text('${controller.parameterData['price']}', style: MyTextStyle.titleStyle16bb,),
              ],
            ),
            SizedBox(height: 30.px,),
            Text("Are you sure?",style: MyTextStyle.titleStyle16blb,),
            Padding(
              padding:  EdgeInsets.only(left: 30.px,right: 30.px,bottom: 5.px,top:40.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidget.commonElevatedButton(
                      onPressed: (){
                        openSuccessBox(context);
                      },
                      text: StringConstants.yes,
                      wantContentSizeButton: true,
                      width: 120.px,
                      height: 50.px,
                      borderRadius: 25.px
                  ),
                  CommonWidget.commonElevatedButton(
                      onPressed: (){
                        Get.back();
                      },
                      text: StringConstants.no,
                      wantContentSizeButton: true,
                      width: 120.px,
                      height: 50.px,
                      borderRadius: 25.px,
                      buttonColor: Colors.grey
                  ),
                ],
              ),
            ),


            //SizedBox(height: 20.px,),
            SizedBox(height: 10.px,),


          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );

  }

  /// Show Send Request Box...
  void openSuccessBox(BuildContext context){
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        title:  Center(child: Text("Strömpis Entry",style: MyTextStyle.titleStyle24bb,)),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
            height: 260.px,width: MediaQuery.of(context).size.width-60.px,
            padding: EdgeInsets.all(10.px),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.px,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconsConstants.subCrownIcon, height: 40.px, width: 50.px, fit: BoxFit.fill,),
                    SizedBox(width: 10.px,),
                    Text('${controller.parameterData['price']}', style: MyTextStyle.titleStyle20bb,),
                  ],
                ),
                SizedBox(height: 30.px,),
                Image.asset(IconsConstants.doneIcon,fit: BoxFit.cover,width: 100.px,height: 100.px,),
              ],
            )
        ),
        alignment: Alignment.center,

      ),
    );
  }
}