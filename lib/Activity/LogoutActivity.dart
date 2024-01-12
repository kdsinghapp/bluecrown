
import 'package:bluecrown/Controller/LogoutController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class LogoutActivity extends StatefulWidget {
  const LogoutActivity({super.key});

  @override
  State<LogoutActivity> createState() => _LogoutState();
}

class _LogoutState extends State<LogoutActivity> {
  LogoutController controller=Get.put(LogoutController());


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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(StringConstants.logout,style: MyTextStyle.titleStyle24bb,),
            Text("Are you sure?",style: MyTextStyle.titleStyle14b,),
            Padding(
              padding:  EdgeInsets.only(left: 30.px,right: 30.px,bottom: 5.px,top:40.px),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonWidget.commonElevatedButton(
                      onPressed: (){
                        controller.logout();
                      },
                      text: StringConstants.yes,
                      wantContentSizeButton: true,
                      width: 120.px,
                      height: 50.px,
                      borderRadius: 25.px
                  ),
                  CommonWidget.commonElevatedButton(
                      onPressed: (){
                        //openSendRequestBox(context);
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
}