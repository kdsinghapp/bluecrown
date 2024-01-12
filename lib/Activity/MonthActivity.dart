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

import '../Controller/MonthController.dart';
import '../constant/imageconstants.dart';

class MonthActivity extends StatefulWidget {
  const MonthActivity({super.key});

  @override
  State<MonthActivity> createState() => _MonthState();
}

class _MonthState extends State<MonthActivity> {
  MonthController controller=Get.put(MonthController());


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

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Month',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF141414),
                  fontSize: 34,
                  fontFamily: 'SF Pro Display',
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Center(
              child: SizedBox(
                height: 250,
                child: ListView.builder(
                  itemCount: controller.months.length ,
                 // controller: _pageController,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    final visibleIndex = index ;

                    if (visibleIndex >= 0 && visibleIndex <controller.months.length) {
                      return GestureDetector(

                        onTap: () {

                        },
                        child: Center(
                          child: Text(
                            controller.months[visibleIndex]['title'] ?? '',
                            style: MyTextStyle.titleStyle24bb,
                          ),
                        ),
                      );
                    } else {
                      return SizedBox(height: 1);
                    }
                  },
                ),
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
            child:Image.asset(ImageConstants.sendRequestImg,fit: BoxFit.cover,)
        ),
        alignment: Alignment.center,

        actions: <Widget>[
          Center(
            child: TextButton(onPressed: (){
              Get.back();
            },
                child: const Text( StringConstants.done,style: TextStyle(fontWeight: FontWeight.bold,fontSize:16,color: Colors.green),)),
          ),



        ],
      ),
    );
  }
}


