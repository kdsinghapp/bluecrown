
import 'package:bluecrown/Controller/PrivacyPolicyController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/imageconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PrivacyPolicyActivity extends StatefulWidget {
  const PrivacyPolicyActivity({super.key});

  @override
  State<PrivacyPolicyActivity> createState() => _PrivacyPolicyState();
}

class _PrivacyPolicyState extends State<PrivacyPolicyActivity> {
  PrivacyPolicyController controller=Get.put(PrivacyPolicyController());


  @override
  Widget build(BuildContext context) {
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
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(StringConstants.privacyPolicy,style: MyTextStyle.titleStyle24bb,),
            SizedBox(height: 10.px,),
            SizedBox(height: 200.px,
              child: Image.asset(ImageConstants.privacyPolicyImg,fit: BoxFit.cover,),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 15.px,right: 15.px,bottom: 5.px,top:40.px),
              child: Obx(() => controller.showProgressbar.value?
              const Center(child:CircularProgressIndicator()):
              Text(removeAllHtmlTags(controller.privacyPolicyModel!.result![0].description!),style: MyTextStyle.titleStyle14b,textAlign: TextAlign.justify,),)

            ),


          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
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