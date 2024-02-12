
import 'package:bluecrown/Apis/api_models/get_usercategory_model.dart';
import 'package:bluecrown/Controller/AddVipClubHostController.dart';
import 'package:bluecrown/Controller/ClubHostSignUpController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/Tool/MyTextStyle.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../common/validations.dart';
class AddVipClubHostActivity extends StatefulWidget {
  const AddVipClubHostActivity({super.key});

  @override
  State<AddVipClubHostActivity> createState() => _AddVipClubHostState();
}

class _AddVipClubHostState extends State<AddVipClubHostActivity> {
  AddVipClubHostController controller=Get.put(AddVipClubHostController());

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
                  Text(StringConstants.createAccountAs,style: MyTextStyle.titleStyle30bb,),
                  Text(StringConstants.clubOrHost,style: MyTextStyle.titleStyle30bb,),
                  SizedBox(height: 20.px,),
                  CommonWidget.commonTextField(
                      validator: (value) => FormValidator.isEmptyValid(value: value),
                      controller: controller.fullNameController,
                      isCard: controller.isFullName.value,
                      keyboardType: TextInputType.name,
                      focusNode: controller.focusFullName,
                      hintText: StringConstants.fullName,
                      hintTextColor: controller.isFullName.value,
                      margin: EdgeInsets.all(10.px)
                  ),
                  CommonWidget.commonTextField(
                      validator: (value) => FormValidator.isEmailValid(value: value),
                      controller: controller.emailPhoneController,
                      isCard: controller.isEmail.value,
                      focusNode: controller.focusEmail,
                      keyboardType: TextInputType.emailAddress,
                      hintText: StringConstants.email,
                      hintTextColor: controller.isEmail.value,
                      margin: EdgeInsets.all(10.px)
                  ),
                  CommonWidget.commonTextField(
                      validator: (value) => FormValidator.isNumberValid(value: value),
                      controller: controller.phoneController,
                      keyboardType: TextInputType.phone,
                      isCard: controller.isPhone.value,
                      focusNode: controller.focusPhone,
                      hintText: StringConstants.enterPhone,
                      hintTextColor: controller.isPhone.value,
                      margin: EdgeInsets.all(10.px)
                  ),
                  Card(
                      elevation: controller.isCategory.value ? 4 : 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.px),),
                      clipBehavior:Clip.hardEdge,
                      color: editTextButton,
                      margin: EdgeInsets.all(10.px),
                      child:Obx(() => controller.categoryDataPresent.value?
                      Container(
                        height: 50.px,
                        padding: EdgeInsets.only(left: 10.px,right: 10.px),
                        child: GetBuilder<AddVipClubHostController>(builder: (context) {
                          return  DropdownButtonHideUnderline(
                            child: DropdownButton<GetUserCategoryResult>(
                              style: MyTextStyle.titleStyle14blb,
                              hint: Text("Select Category", style: MyTextStyle.titleStyle16blb,
                              ),
                              items: controller.getUserCategoryModel!.result!
                                  .map<DropdownMenuItem<GetUserCategoryResult>>(
                                      (GetUserCategoryResult value) {
                                    return DropdownMenuItem(
                                      value: value,
                                      child: Text(value.name!,style: MyTextStyle.titleStyle14bb,),
                                    );
                                  }).toList(),
                              isExpanded: true,
                              isDense: true,
                              onChanged: (GetUserCategoryResult? newCategory) {
                                controller.changeSelectedCategory(newCategory!);
                              },
                              value: controller.selectUserCategoryModel,
                            ),
                          );
                        }

                        ),
                      ):Container(height: 50.px,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        decoration: const BoxDecoration(
                            color: editTextButton
                        ),
                        child: Text("Select Category",style: MyTextStyle.titleStyle14b,),))
                  ),
                  CommonWidget.commonTextField(
                      validator: (value) => FormValidator.isEmptyValid(value: value),
                      controller: controller.cityController,
                      keyboardType: TextInputType.name,
                      isCard: controller.isCity.value,
                      focusNode: controller.focusCity,
                      hintText: StringConstants.city,
                      hintTextColor: controller.isCity.value,
                      margin: EdgeInsets.all(10.px)
                  ),
                  CommonWidget.commonTextField(
                    validator: (value) => FormValidator.isPasswordValid(value: value),
                    controller: controller.passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    isCard: controller.isPassword.value,
                    focusNode: controller.focusPassword,
                    obscureText: controller.hide.value,
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
                  CommonWidget.commonElevatedButton(onPressed: (){
                    if(controller.formKey.currentState!.validate()){
                      controller.changeProgressbarStatus(true);
                      controller.callingSubmitVipRegistrationForm();
                    }


                  }
                      ,text: StringConstants.addClubHostAsVip,
                      buttonMargin: EdgeInsets.all(10.px),
                      borderRadius: 30.px,
                      height: 60.px)),
                  SizedBox(height: 10.px,) ,



                ],
              ),
            ),
          ),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
    );
  }
}