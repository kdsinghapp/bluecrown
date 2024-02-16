
import 'package:bluecrown/Controller/AddListController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../common/validations.dart';
class AddListActivity extends StatefulWidget {
  const AddListActivity({super.key});

  @override
  State<AddListActivity> createState() => _AddEventListState();
}

class _AddEventListState extends State<AddListActivity> {
  AddListController controller=Get.put(AddListController());
  int tabIndex=0;

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
        bottomNavigationBar: Padding(
            padding:  EdgeInsets.only(left: 20.px,right: 20.px,bottom: 0.px),
            child:
            Obx(() => controller.showProgressBar.value?
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
            CommonWidget.commonElevatedButton(
                onPressed: (){
                  if(controller.formKey.currentState!.validate()){
                    controller.changeProgressbarStatus(true);
                    tabIndex==0?
                    controller.callingBookEventForm('Normal'):controller.callingBookEventForm('Vip');
                  }
                },
                text: StringConstants.addList,
                buttonMargin: EdgeInsets.all(10.px,),
                borderRadius: 25.px

            ),
            )
        ),
        body:
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(StringConstants.addList,style: MyTextStyle.titleStyle24bb,),
                  SizedBox(height: 15.px,),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              tabIndex=0;
                            });
                          },
                          child: Container(
                            height: 40.px,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 10.px,right: 5.px),
                            decoration: BoxDecoration(
                                color:tabIndex==0?primaryColor:primary3Color,
                                borderRadius: BorderRadius.all(Radius.circular(10.px)),
                                border: Border.all(color:primaryColor,width: 1.px)
                            ),
                            child: Text("Normal List",style:tabIndex==0?MyTextStyle.titleStyle16bw:MyTextStyle.titleStyle16bb,
                              textAlign: TextAlign.center,),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                           setState(() {
                             tabIndex=1;
                           });
                          },
                          child: Container(
                            height: 40.px,
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 5.px,right: 10.px),
                            decoration: BoxDecoration(
                              color:tabIndex==1?primaryColor:primary3Color,
                              borderRadius: BorderRadius.all(Radius.circular(10.px)),
                              border: Border.all(color:primaryColor,width: 1.px)
                            ),
                            child: Text("Vip List",style:tabIndex==1?MyTextStyle.titleStyle16bw:MyTextStyle.titleStyle16bb,
                              textAlign: TextAlign.center,),
                          ),
                        ),
                      ),

                    ],
                  ),
                  SizedBox(height: 15.px,),
                  CommonWidget.commonTextField(
                    validator: (value) => FormValidator.isEmptyValid(value: value),
                      controller: controller.fullNameController,
                      isCard: controller.isFullName.value,
                      focusNode: controller.focusFullName,
                      hintText: StringConstants.fullName,
                      hintTextColor: controller.isFullName.value,
                      keyboardType: TextInputType.name,
                      margin: EdgeInsets.all(10.px),
                  ),
                  CommonWidget.commonTextField(
                    validator: (value) => FormValidator.isEmptyValid(value: value),
                    controller: controller.ageController,
                    isCard: controller.isAge.value,
                    focusNode: controller.focusAge,
                    hintText: StringConstants.age,
                    hintTextColor: controller.isAge.value,
                    keyboardType: TextInputType.number,
                    margin: EdgeInsets.all(10.px),
                  ),
                  CommonWidget.commonTextField(
                    validator: (value) => FormValidator.isEmptyValid(value: value),
                    controller: controller.howManyController,
                    isCard: controller.isHowMany.value,
                    focusNode: controller.focusHowMany,
                    hintText: 'How Many',
                    hintTextColor: controller.isHowMany.value,
                    margin: EdgeInsets.all(10.px),
                    keyboardType: TextInputType.number,
                  ),
                  //SizedBox(height: 20.px,),

                  SizedBox(height: 10.px,),


                ],
              ),
            ),
          ),// This trailing comma makes auto-formatting nicer for build methods.
      );
    }

    );


  }
}