import 'package:bluecrown/Controller/ChangeEventController.dart';
import 'package:bluecrown/Controller/ChooseEventController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../common/ShowToast.dart';
import '../common/validations.dart';
class ChooseEventActivity extends StatefulWidget {
  const ChooseEventActivity({super.key});

  @override
  State<ChooseEventActivity> createState() => _ChooseEventState();
}

class _ChooseEventState extends State<ChooseEventActivity> {
  ChooseEventController controller=Get.put(ChooseEventController());


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      controller.count.value;
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
        extendBody: false,
        resizeToAvoidBottomInset: false,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
            padding:  EdgeInsets.only(left: 20.px,right: 20.px,bottom: 0.px),
            child:  CommonWidget.commonElevatedButton(
                onPressed: (){
                  controller.openAddEventListActivity();
                },
                text: StringConstants.addList,
                buttonMargin: EdgeInsets.only(top: 5.px,),
                borderRadius: 25.px
            ),

        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(StringConstants.chosenEvent,style: MyTextStyle.titleStyle24bb,),
              Padding(
                padding: EdgeInsets.all(15.px),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(controller.publishMyEventResult.name!, style: MyTextStyle.titleStyle12blb,),
                    SizedBox(
                      width: 35.px,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 20.px, width: 30.px,
                            child: Image.asset(IconsConstants.subCrownIcon, fit: BoxFit.fill,),
                          ),
                          Text(controller.publishMyEventResult.points!, style: MyTextStyle.titleStyle18bb,textAlign: TextAlign.center,),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              CommonWidget.commonTextField(
                  controller: controller.fullEventController,
                  isCard: controller.isFullEvent.value,
                  focusNode: controller.focusFullEvent,
                  hintText: 'Event Name',
                  keyboardType: TextInputType.name,
                  hintTextColor: controller.isFullEvent.value,
                  readOnly: true,
                  margin: EdgeInsets.all(10.px)
              ),
              CommonWidget.commonTextField(
                validator: (value) => FormValidator.isPasswordValid(value: value),
                controller: controller.dateController,
                isCard: controller.isDate.value,
                focusNode: controller.focusDate,
                readOnly: true,
                keyboardType: TextInputType.datetime,
                hintText: '18-11-2024',
                hintTextColor: controller.isDate.value,
                margin: EdgeInsets.all(10.px),
                suffixIcon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(IconsConstants.calenderIcon,width: 25.px,height: 25.px,fit: BoxFit.cover,color:primaryColor,),
                  ],
                ),
              ),

              CommonWidget.commonTextField(
                validator: (value) => FormValidator.isPasswordValid(value: value),
                controller: controller.timeController,
                isCard: controller.isTime.value,
                focusNode: controller.focusTime,
                hintText: '9:00 pm',
                keyboardType: TextInputType.datetime,
                hintTextColor: controller.isTime.value,
                margin: EdgeInsets.all(10.px),
                readOnly: true,
                suffixIcon: GestureDetector(
                  onTap:(){},
                  child:  Image.asset(IconsConstants.timeIcon,width: 20.px,height: 20.px),
                ),
              ),
              CommonWidget.commonTextField(
                controller: controller.priceController,
                isCard: controller.isPrice.value,
                focusNode: controller.focusPrice,
                keyboardType: TextInputType.number,
                hintText: '50',
                hintTextColor: controller.isPrice.value,
                readOnly: true,
                margin: EdgeInsets.all(10.px),
                suffixIcon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child:  Image.asset(IconsConstants.subCrownIcon,width: 25.px,height: 25.px,),
                    ),
                  ],
                ),
              ),
              CommonWidget.commonTextField(
                controller: controller.descriptionController,
                isCard: controller.isDescription.value,
                focusNode: controller.focusDescription,
                keyboardType: TextInputType.text,
                hintText: "Description",
                maxLines: 5,
                hintTextColor: controller.isDescription.value,
                readOnly: true,
                margin: EdgeInsets.all(10.px),

              ),
              //SizedBox(height: 20.px,),

              SizedBox(height: 80.px,),


            ],
          ),
        ),
      );
    });
  }
}