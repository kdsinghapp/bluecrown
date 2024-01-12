
import 'package:bluecrown/Controller/OtpController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/common/CommonWidget.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:bluecrown/constant/stringconstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Tool/MyTextStyle.dart';
class OtpActivity extends StatefulWidget {
  const OtpActivity({super.key});

  @override
  State<OtpActivity> createState() => _OtpState();
}

class _OtpState extends State<OtpActivity> {
  OtpController controller=Get.put(OtpController());
  TextEditingController fieldOne = TextEditingController();
  TextEditingController fieldTwo = TextEditingController();
  TextEditingController fieldThree = TextEditingController();
  TextEditingController fieldFour = TextEditingController();
  String otpValue='';

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
      bottomNavigationBar:  Padding(
        padding: EdgeInsets.only(bottom: 10.px,left: 10.px,right: 10.px),
        child:Obx(()=>controller.showProgressbar.value?
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
          FocusManager.instance.primaryFocus?.unfocus();
          controller.changeProgressbarStatus(true);
          otpValue='${fieldOne.text}${fieldTwo.text}${fieldThree.text}${fieldFour.text}';
          controller.callingCheckOtpInForm(otpValue);
        }
            ,text: StringConstants.continues,
            buttonMargin: EdgeInsets.all(10.px),
            borderRadius: 30.px,
            height: 60.px) ),
      ),
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(StringConstants.checkYourMail,style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,),
            SizedBox(height: 3.px,),
            Text(StringConstants.pleasePutThe4DigitsSendToYou,style: MyTextStyle.titleStyle14b,textAlign: TextAlign.center,),
            SizedBox(height: 20.px,),
            Padding(
              padding: const EdgeInsets.only(left: 20,right: 20,top: 60),
              child: SizedBox(
                width: double.infinity,
                height: 50 ,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OtpInput(fieldOne, true), // auto focus
                    OtpInput(fieldTwo, false),
                    OtpInput(fieldThree, false),
                    OtpInput(fieldFour, false)
                  ],
                ),
              ),
            ),


          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}




// Create an input widget that takes only one digit
class OtpInput extends StatelessWidget {
  final TextEditingController controller;
  final bool autoFocus;
  const OtpInput(this.controller, this.autoFocus, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 50,
      decoration: const BoxDecoration(
        color: editTextButton,
        borderRadius: BorderRadius.all(Radius.circular(5),),

      ),
      child: TextField(
        autofocus: autoFocus,
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        controller: controller,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        decoration:  const InputDecoration(
          border: OutlineInputBorder(),
          counterText: '',
          hintStyle: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
      ),
    );
  }
}