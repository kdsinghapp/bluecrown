
import 'package:bluecrown/Controller/ResetController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/common/ShowToast.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Tool/MyTextStyle.dart';
class ResetPasswordActivity extends StatefulWidget {
  const ResetPasswordActivity({super.key});

  @override
  State<ResetPasswordActivity> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPasswordActivity> {
  ResetPasswordController controller=Get.put(ResetPasswordController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary3Color,
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
      bottomNavigationBar:  Obx(() =>    Visibility(
        visible:controller.nextVisible.value,
        child:controller.showProgressbar.value?
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
          if(controller.emailController.text.isNotEmpty || controller.phoneController.text.isNotEmpty){
            if(controller.emailController.text.isNotEmpty){
              controller.changeProgressbarStatus(true);
              controller.callingForgotPasswordInForm('Email');
            }else{
              controller.changeProgressbarStatus(true);
              controller.callingForgotPasswordInForm('Phone');
            }
          }else{
            showToastMessage('Enter email or phone nu.');
          }

        }
            ,text: StringConstants.send,
            buttonMargin: EdgeInsets.all(10.px),
            borderRadius: 30.px,
            height: 60.px),
      ),),
      body:  SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(StringConstants.passwordReset,style: MyTextStyle.titleStyle30bb,),
              Text(StringConstants.pleasePutYourEmailOrMobileNumberResetPassword,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,),
              SizedBox(height: 20.px,),
             Obx(() =>  GestureDetector(
               onTap: (){
                 controller.changeSelectedType(0);
               },
               child: Card(
                 shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(10.px)),
                     side:const  BorderSide(color: textColor,width: 1)
                 ),
                 elevation: controller.selectedType.value==1?5.px:0.px,
                 margin: EdgeInsets.all(10.px),
                 child:  Container(
                   // height: 50.px,
                   //width: 50.px,
                   padding: EdgeInsets.all(10.px),
                   child:Row(
                     children: [
                       Expanded(
                           flex: 1,
                           child: Image.asset(IconsConstants.smsIcon)
                       ),
                       Expanded(
                           flex: 4,
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               Padding(
                                 padding: EdgeInsets.only(left: 10.px),
                                 child: Text(StringConstants.sms,style: MyTextStyle.titleStyle16bb,),
                               ),
                               Obx(() => CommonWidget.commonTextField(
                                   controller: controller.phoneController,
                                   isCard: controller.isPhone.value,
                                   focusNode: controller.focusPhone,
                                   hintText: StringConstants.enterPhone,
                                   hintTextColor: controller.isPhone.value,
                                   margin: EdgeInsets.all(5.px),
                                   onChanged:(value){
                                     if(value.isNotEmpty){
                                       controller.changeVisibility(true);
                                     }else{
                                       controller.changeVisibility(false);
                                     }
                                   }
                               ),),
                             ],
                           )
                       )
                     ],
                   ),
                 ),
               ),
             ),),
              SizedBox(height: 20.px,),
              Obx(() => GestureDetector(
                onTap: (){
                  controller.changeSelectedType(1);
                },
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.px)),
                      side:const  BorderSide(color: textColor,width: 1)
                  ),
                  elevation: controller.selectedType.value==1?5.px:0.px,
                  margin: EdgeInsets.all(10.px),
                  child:  Container(
                    // height: 50.px,
                    //width: 50.px,
                    padding: EdgeInsets.all(10.px),
                    child:Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.asset(IconsConstants.emailIcon)
                        ),
                        Expanded(
                            flex: 4,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.px),
                                  child: Text(StringConstants.email,style: MyTextStyle.titleStyle16bb,),
                                ),
                                Obx(() => CommonWidget.commonTextField(
                                    controller: controller.emailController,
                                    isCard: controller.isEmail.value,
                                    focusNode: controller.focusEmail,
                                    hintText: StringConstants.email,
                                    hintTextColor: controller.isEmail.value,
                                    margin: EdgeInsets.all(5.px),
                                   onChanged:(value){
                                      if(value.isNotEmpty){
                                        controller.changeVisibility(true);
                                      }else{
                                        controller.changeVisibility(false);
                                      }
                                   }
                                ),),
                              ],
                            )
                        )
                      ],
                    ),
                  ),
                ),
              ),),


            ],
          ),
        ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}