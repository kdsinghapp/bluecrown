
import 'package:bluecrown/Controller/AddListController.dart';
import 'package:bluecrown/Controller/CreateQrController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CreateQrActivity extends StatefulWidget {
  const CreateQrActivity({super.key});

  @override
  State<CreateQrActivity> createState() => _CreateQrState();
}

class _CreateQrState extends State<CreateQrActivity> {
  CreateQrController controller=Get.put(CreateQrController());


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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child:  Obx(() => controller.showProgressBar.value?
        Container(
          width: double.infinity,
          height: 50,
          margin: EdgeInsets.all(10.px),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(25.px)),
              color: primaryColor
          ),
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                  height:30,width:30,
                  child:CircularProgressIndicator(color:primary3Color,)
              ),
              const SizedBox(width: 10,),
              Text("Loading...",style: MyTextStyle.titleStyle16bw,),

            ],
          ),
        ):
        CommonWidget.commonElevatedButton(onPressed: (){
          controller.changeProgressbarStatus(true);
          controller.callingCreateEventsForm();
        }
            ,text: StringConstants.createQrCode,
            buttonMargin: EdgeInsets.all(10.px),
            borderRadius: 30.px,
            height: 60.px),
        ),
      ),
      body:
      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(StringConstants.createQrCode,style: MyTextStyle.titleStyle20bb,),
          Padding(
            padding:EdgeInsets.all(15.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringConstants.points,style: MyTextStyle.titleStyle16bb,),
                ListTile(
                  trailing: Image.asset(IconsConstants.minusIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,),
                  leading: Image.asset(IconsConstants.addIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,)
                  ,titleAlignment: ListTileTitleAlignment.center,
                  title: Align(
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(IconsConstants.subCrownIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,),
                        SizedBox(width: 5.px,),
                        Text(controller.parameterData['point']!,style: MyTextStyle.titleStyle16bb,),
                      ],
                    ),
                  ),

                ),
              ],
            ),
          ),
          Padding(
            padding:EdgeInsets.all(15.px),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(StringConstants.entranceCost,style: MyTextStyle.titleStyle16bb,),
                ListTile(
                  trailing: Image.asset(IconsConstants.minusIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,),
                  leading: Image.asset(IconsConstants.addIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,)
                  ,titleAlignment: ListTileTitleAlignment.center,
                  title: Align(
                    alignment: Alignment.center,
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(IconsConstants.subCrownIcon,height: 25.px,width: 25.px,fit: BoxFit.fill,),
                            SizedBox(width: 5.px,),
                            Text(controller.parameterData['entranceCost']!,style: MyTextStyle.titleStyle16bb,),
                          ],
                        ),
                  ),

                ),
              ],
            ),
          ),
          //SizedBox(height: 20.px,),
         SizedBox(height: 10.px,),
        ],
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );


  }
}