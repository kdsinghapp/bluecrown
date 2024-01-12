
import 'package:bluecrown/Controller/EventDetailController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Controller/EnterEventDetailController.dart';
import '../common/validations.dart';

class EnterEventDetailActivity extends StatefulWidget {
  const EnterEventDetailActivity({super.key});

  @override
  State<EnterEventDetailActivity> createState() => _EnterEventDetailState();
}

class _EnterEventDetailState extends State<EnterEventDetailActivity> {
  EnterEventDetailController controller=Get.put(EnterEventDetailController());


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
          if(controller.formKey.currentState!.validate()){
            controller.openCreateQrActivity();
          }
        },text: StringConstants.createQrCode,
            buttonMargin: EdgeInsets.all(10.px),
            borderRadius: 30.px,
            height: 60.px),
      ),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text('${controller.parameterData['date_from']} to ${controller.parameterData['date_end']}',style: MyTextStyle.titleStyle20bb,),

              //SizedBox(height: 20.px,),
              CommonWidget.commonTextField(
                  validator: (value) => FormValidator.isEmptyValid(value: value),
                  controller: controller.eventNameController,
                  isCard: controller.isEventName.value,
                  focusNode: controller.focusEventName,
                  keyboardType: TextInputType.name,
                  hintText: 'Event Name',
                  hintTextColor: controller.isEventName.value,
                  margin: EdgeInsets.all(10.px)
              ),
              CommonWidget.commonTextField(
                  validator: (value) => FormValidator.isEmptyValid(value: value),
                  controller: controller.timeController,
                  isCard: controller.isTime.value,
                  focusNode: controller.focusTime,
                  keyboardType: TextInputType.name,
                  hintText: 'Time',
                  hintTextColor: controller.isTime.value,
                  margin: EdgeInsets.all(10.px)
              ),
              CommonWidget.commonTextField(
                validator: (value) => FormValidator.isEmptyValid(value: value),
                controller: controller.styleController,
                isCard: controller.isStyle.value,
                focusNode: controller.focusStyle,
                keyboardType: TextInputType.name,
                hintText: 'Style',
                hintTextColor: controller.isStyle.value,
                margin: EdgeInsets.all(10.px),

              ),
              CommonWidget.commonTextField(
                validator: (value) => FormValidator.isEmptyValid(value: value),
                controller: controller.descriptionController,
                isCard: controller.isDescription.value,
                focusNode: controller.focusDescription,
                keyboardType: TextInputType.name,
                hintText: 'Description',
                hintTextColor: controller.isDescription.value,
                maxLines: 4,
                margin: EdgeInsets.all(10.px),

              ),
              SizedBox(height: 10.px,),

              Padding(
                padding:  EdgeInsets.all(15.px),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(StringConstants.age,style: MyTextStyle.titleStyle16bb,),
                    Obx(() =>  Slider(
                      label: " Age",
                      value: controller.maxAge.value,
                      activeColor: primaryColor,
                      onChanged: (value) {controller.changeAge(value);},
                      min: controller.minAge.value, max: 100,),
                    ),
                    Obx(() =>  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(controller.minAge.value.toStringAsFixed(0),style: MyTextStyle.titleStyle14bb,),
                        Text(controller.maxAge.value.toStringAsFixed(0),style: MyTextStyle.titleStyle14bb,),
                      ],
                    )),
                    SizedBox(height: 20.px,),
                    Text(StringConstants.points,style: MyTextStyle.titleStyle16bb,),
                    Obx(() =>  Column(
                      children: [
                        Image.asset(IconsConstants.subCrownIcon,height: 20.px,width: 30.px,fit: BoxFit.fill,),
                        Text(controller.points.value.toStringAsFixed(0),style: MyTextStyle.titleStyle16bb,),
                        Slider(
                          label: "Points",
                          activeColor: primaryColor,
                          value: controller.points.value,
                          onChanged: (value) {controller.changePoints(value);},
                          min: 40, max: 100,),
                      ],
                    ),),
                    SizedBox(height: 20.px,),
                    Text(StringConstants.entranceCost,style: MyTextStyle.titleStyle16bb,),
                    Obx(() =>  Column(
                      children: [
                        Image.asset(IconsConstants.subCrownIcon,height: 20.px,width: 30.px,fit: BoxFit.fill,),
                        Text(controller.entraceCost.value.toStringAsFixed(0),style: MyTextStyle.titleStyle16bb,),
                        Slider(
                          label: StringConstants.entranceCost,
                          activeColor: primaryColor,
                          value: controller.entraceCost.value,
                          onChanged: (value) {controller.changeEntranceCost(value);},
                          min:0, max: 100,),
                      ],
                    ),),
                  ],
                ),
              )




            ],
          ),
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );


  }
}