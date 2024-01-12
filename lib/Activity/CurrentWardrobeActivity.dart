
import 'package:bluecrown/Controller/CurrentWardrobeController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CurrentWardrobeActivity extends StatefulWidget {
  const CurrentWardrobeActivity({super.key});

  @override
  State<CurrentWardrobeActivity> createState() => _CurrentWardrobeState();
}

class _CurrentWardrobeState extends State<CurrentWardrobeActivity> {
  CurrentWardrobeController controller=Get.put(CurrentWardrobeController());


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
        title: Text(StringConstants.current,style: MyTextStyle.titleStyle20bb,),
        centerTitle: true,
        actions: [
          Padding(
            padding:  EdgeInsets.only(left: 5.px,right: 15.px,top: 10.px,bottom: 10.px),
            child: GestureDetector(
                onTap:(){},
                child: Image.asset(IconsConstants.profileIcon,height: 30.px,width: 30.px,)
            ),
          ),
         /* Padding(
            padding:  EdgeInsets.only(left: 5.px,right: 15.px,top: 10.px,bottom: 10.px),
            child: GestureDetector(
                onTap:(){
                  controller.openMineOfferActivity();
                },
                child: Image.asset(IconsConstants.crowneIcon,height: 30.px,width: 30.px,fit: BoxFit.fill,)
            ),
          ), */
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 20.px,),


          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.px))
            ),
            margin: EdgeInsets.all(20.px),
            elevation: 5.px,
            color: cartColor,
            child: Center(
              child: SizedBox(
                height: 225.px,
                child:Obx(() => controller.showProgressbar.value?
                const Center(
                  child: CircularProgressIndicator(),
                ):
                 Obx(() =>  controller.presentData.value?
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     SizedBox(height: 20.px,),
                     Text(StringConstants.youHaveNumber,style: MyTextStyle.titleStyle20bb,),
                     SizedBox(height: 20.px,),
                     Text(controller.getCurrentJacketModel!.result![0].qrcode!,style:const TextStyle(fontSize: 60,fontWeight: FontWeight.bold,color: primaryColor),),
                     CommonWidget.commonElevatedButton(
                         onPressed: (){

                         },
                         text:StringConstants.takeOutJacket,
                         borderRadius: 10.px,
                         height: 50.px,
                         buttonMargin: EdgeInsets.only(top: 20.px,left: 20.px,right: 20.px,bottom: 20.px)
                     )
                   ],
                 ): Text('\n\n\nThere are not present your current jacket',style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),)
                ),
              ),
            ),
          ),

          //SizedBox(height: 20.px,),

          SizedBox(height: 10.px,),


        ],
      ),
    );


  }
}