
import 'package:bluecrown/Controller/AddListController.dart';
import 'package:bluecrown/Controller/PublishEventController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/common/ShowToast.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class PublishEventActivity extends StatefulWidget {
  const PublishEventActivity({super.key});

  @override
  State<PublishEventActivity> createState() => _PublishEventState();
}

class _PublishEventState extends State<PublishEventActivity> {
  PublishEventController controller=Get.put(PublishEventController());


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
        child: CommonWidget.commonElevatedButton(onPressed: (){
          if(controller.dateLength>=2){
            controller.openEnterEventDetailActivity();
          }else{
            showToastMessage('select minimum two days');
          }

        },text: StringConstants.next,
            buttonMargin: EdgeInsets.all(10.px),
            borderRadius: 30.px,
            height: 60.px),
      ),
      body:
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(StringConstants.publishEvent,style: MyTextStyle.titleStyle24bb,),

            //SizedBox(height: 20.px,),
            Padding(
              padding: EdgeInsets.all(15.px),
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(
                  calendarType: CalendarDatePicker2Type.range,
                ),
                value: controller.dates,
                onValueChanged: (dates){
                  controller.dates = dates;
                  controller.changeDateLength();
                },
              ),
            ),

            Obx(() => controller.dateLength.value>=2?Text(controller.dates[0].toString().substring(0,10)+" to "+controller.dates[controller.dateLength.value-1].toString().substring(0,10),style: MyTextStyle.titleStyle20bb,):
            const SizedBox()),
            SizedBox(height: 10.px,),


          ],
        ),// This trailing comma makes auto-formatting nicer for build methods.
    );


  }
}