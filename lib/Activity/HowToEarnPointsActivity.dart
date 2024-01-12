
import 'package:bluecrown/Controller/HowToEarnPointsController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HowToEarnPointsActivity extends StatefulWidget {
  const HowToEarnPointsActivity({super.key});

  @override
  State<HowToEarnPointsActivity> createState() => _HowToEarnPointsState();
}

class _HowToEarnPointsState extends State<HowToEarnPointsActivity> {
  HowToEarnPointsController controller=Get.put(HowToEarnPointsController());


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
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 30.px,),
            Text('How do I earn more points?', style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
            SizedBox(height: 30.px,),
            Padding(
              padding:EdgeInsets.all(15.0.px),
              child: Obx(() => controller.showProgressbar.value?const Center(
                child: CircularProgressIndicator(),
              ):
               Text(removeAllHtmlTags(controller.howToEarnPointsModel!.result![0].description!),style: MyTextStyle.titleStyle14b,textAlign: TextAlign.justify,)
              ),
            ),

            SizedBox(height: 20.px,),


          ],
        ),
      ),
    );


  }
  String removeAllHtmlTags(String htmlText) {
    RegExp exp = RegExp(
        r"<[^>]*>",
        multiLine: true,
        caseSensitive: true
    );

    return htmlText.replaceAll(exp, '');
  }
}