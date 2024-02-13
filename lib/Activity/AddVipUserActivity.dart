import 'package:bluecrown/Controller/AddVipUserController.dart';
import 'package:bluecrown/Controller/SignUpController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../common/validations.dart';
class AddVipUserActivity extends StatefulWidget {
  const AddVipUserActivity({super.key});

  @override
  State<AddVipUserActivity> createState() => _AddVipUserState();
}

class _AddVipUserState extends State<AddVipUserActivity> {
  AddVipUserController controller=Get.put(AddVipUserController());


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
        ),
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Create vip user account',style: MyTextStyle.titleStyle30bb,),
                  SizedBox(height: 20.px,),
                  CommonWidget.commonTextField(
                      validator: (value)=>FormValidator.isEmptyValid(value: value),
                      controller: controller.fullNameController,
                      isCard: controller.isFullName.value,
                      focusNode: controller.focusFullName,
                      hintText: StringConstants.fullName,
                      keyboardType: TextInputType.name,
                      hintTextColor: controller.isFullName.value,
                      margin: EdgeInsets.all(10.px)
                  ),
                  CommonWidget.commonTextField(
                      validator: (value)=>FormValidator.isEmailValid(value: value),
                      controller: controller.emailPhoneController,
                      autofillHint: const [AutofillHints.email],
                      isCard: controller.isEmail.value,
                      focusNode: controller.focusEmail,
                      keyboardType: TextInputType.emailAddress,
                      hintText: StringConstants.email,
                      hintTextColor: controller.isEmail.value,
                      margin: EdgeInsets.all(10.px)
                  ),
                  CommonWidget.commonTextField(
                      validator: (value)=>FormValidator.isNumberValid(value: value),
                      controller: controller.phoneController,
                      autofillHint: const [AutofillHints.telephoneNumber],
                      isCard: controller.isPhone.value,
                      focusNode: controller.focusPhone,
                      keyboardType: TextInputType.phone,
                      hintText: StringConstants.enterPhone,
                      hintTextColor: controller.isPhone.value,
                      margin: EdgeInsets.all(10.px)
                  ),
                  CommonWidget.commonTextField(
                    validator: (value) => FormValidator.isPasswordValid(value: value),
                    controller: controller.passwordController,
                    isCard: controller.isPassword.value,
                    focusNode: controller.focusPassword,
                    obscureText: controller.hide.value,
                    keyboardType: TextInputType.visiblePassword,
                    hintText: StringConstants.password,
                    hintTextColor: controller.isEmail.value,
                    margin: EdgeInsets.all(10.px),
                    suffixIcon: GestureDetector(
                      onTap: () => controller.clickOnEyeButton(),
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
                  ),
                  CommonWidget.commonTextField(
                    validator: (value)=>FormValidator.isEmptyValid(value: value),
                    controller: controller.dateOfBirthController,
                    isCard: controller.isDateOfBirth.value,
                    focusNode: controller.focusDateOfBirth,
                    hintText: StringConstants.dateOfBirth,
                    hintTextColor: controller.isDateOfBirth.value,
                    keyboardType: TextInputType.datetime,
                    margin: EdgeInsets.all(10.px),
                    suffixIcon: GestureDetector(
                      onTap: () => openDatePickerBox(context),
                      child:Icon(Icons.date_range, color: text2Color, size: 18.px,),
                    ),
                  ),
                  SizedBox(height: 20.px,),
                  Obx(() => controller.showProgressbar.value?
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
                        //controller.pressButton(2);
                        if(controller.formKey.currentState!.validate()){
                          print("true");
                          controller.changeProgressbarStatus(true);
                          controller.callingSubmitRegistrationForm();
                        }else{
                          print("false");
                        }
                      }
                      ,text: 'SignUp Vip User',
                      buttonMargin: EdgeInsets.all(10.px),
                      borderRadius: 30.px,
                      height: 60.px)),

                  SizedBox(height: 10.px,),



                ],
              ),
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
    );
  }

  /// Show Date Picker Box...
  void openDatePickerBox(BuildContext context) async {
    List<DateTime?> _dates=[];
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
            height: 260.px,width: MediaQuery.of(context).size.width-60.px,
            padding: EdgeInsets.all(10.px),
            child: CalendarDatePicker2(
              config: CalendarDatePicker2Config(
                calendarType: CalendarDatePicker2Type.range,
              ),
              value: _dates,
              onValueChanged: (dates) => _dates = dates,
            )
        ),
        alignment: Alignment.center,

        actions: <Widget>[
          CommonWidget.commonElevatedButton(
              onPressed: (){
                controller.setDOB(_dates[0].toString());
                Get.back();
                //controller.openAdminWardrobeActivity();
              },
              text: StringConstants.submit,
              buttonMargin: EdgeInsets.all(10.px),
              borderRadius: 25.px
          ),

        ],
      ),
    );

  }
}