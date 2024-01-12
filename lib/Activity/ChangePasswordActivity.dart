
import 'package:bluecrown/Controller/ChangePasswordController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/common/ShowToast.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../common/validations.dart';
class ChangePasswordActivity extends StatefulWidget {
  const ChangePasswordActivity({super.key});

  @override
  State<ChangePasswordActivity> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePasswordActivity> {
   ChangePasswordController controller=Get.put(ChangePasswordController());


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
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10.px),
        child: Obx(()=>controller.showProgressbar.value?
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

          if(controller.formKey.currentState!.validate()){
            if(controller.newPasswordController.text.toString()==controller.cnfPasswordController.text.toString()){
              controller.changeProgressbarStatus(true);
              controller.callingChangePasswordInForm();
            }else{
              showToastMessage('Password are not matched.');
            }

          }
        }
            ,text: StringConstants.save,
            buttonMargin: EdgeInsets.all(10.px),
            borderRadius: 30.px,
            height: 60.px)),
      ),
      body:
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 20.px,),
              Text(StringConstants.changePassword,style: MyTextStyle.titleStyle24bb,),
              Text(StringConstants.yourPasswordMustBeDifferentFromPreviousUsedPasswords,style: MyTextStyle.titleStyle16b,textAlign: TextAlign.center,),
              SizedBox(height: 50.px,),
              Obx(() => CommonWidget.commonTextField(
                  validator: (value) => FormValidator.isPasswordValid(value: value),
                  controller: controller.oldPasswordController,
                  isCard: controller.isOldPassword.value,
                  focusNode: controller.focusOldPassword,
                  obscureText: controller.hide.value,
                  hintText: StringConstants.oldPassword,
                  hintTextColor: controller.isOldPassword.value,
                  margin: EdgeInsets.all(10.px),
                  prefixIcon: Icon(Icons.lock_outline, color: text2Color, size: 18.px,),
                  suffixIcon: GestureDetector(
                    onTap: () => controller.clickOnEye1Button(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => Icon(
                          controller.hide.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: controller.isPassword.value
                              ? text2Color
                              : text2Color,
                          size: 18.px,
                        )),
                      ],
                    ),
                  ),
                  onChanged: (value){
                    controller.onFocusChange();
                  }
              ),),
              Obx(() => CommonWidget.commonTextField(
                  validator: (value) => FormValidator.isPasswordValid(value: value),
                  controller: controller.newPasswordController,
                  isCard: controller.isPassword.value,
                  focusNode: controller.focusPassword,
                  obscureText: controller.hide.value,
                  hintText: StringConstants.newPassword,
                  hintTextColor: controller.isPassword.value,
                  margin: EdgeInsets.all(10.px),
                  prefixIcon: Icon(Icons.lock_outline, color: text2Color, size: 18.px,),
                  suffixIcon: GestureDetector(
                    onTap: () => controller.clickOnEye1Button(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => Icon(
                          controller.hide.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: controller.isPassword.value
                              ? text2Color
                              : text2Color,
                          size: 18.px,
                        )),
                      ],
                    ),
                  ),
                  onChanged: (value){
                    controller.onFocusChange();
                  }
              ),),
              Obx(() => CommonWidget.commonTextField(
                validator: (value) => FormValidator.isPasswordValid(value: value),
                controller: controller.cnfPasswordController,
                isCard: controller.isCnfPassword.value,
                obscureText: controller.cnfHide.value,
                hintText: StringConstants.cnfPassword,
                hintTextColor: controller.isCnfPassword.value,
                margin: EdgeInsets.all(10.px),
                suffixIcon: GestureDetector(
                  onTap: () => controller.clickOnEye2Button(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Obx(() => Icon(
                        controller.hide.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: controller.isPassword.value
                            ? text2Color
                            : text2Color,
                        size: 18.px,
                      )),
                    ],
                  ),
                ),
                prefixIcon: Icon(Icons.lock_outline, color: text2Color, size: 18.px,),
              ),
              ),
              SizedBox(height: 20.px,),

            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}