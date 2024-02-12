import 'dart:io';

import 'package:bluecrown/Controller/MainQrCodeController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Tool/Color.dart';
import '../Tool/MyTextStyle.dart';
import '../constant/iconsconstants.dart';
class MainQrCodeActivity extends StatefulWidget {
  const MainQrCodeActivity({super.key});

  @override
  State<MainQrCodeActivity> createState() => _MainQrCodeAppState();
}

class _MainQrCodeAppState extends State<MainQrCodeActivity> {
  Barcode? result;
  QRViewController? controller;
  MainQrCodeController mainController=Get.put(MainQrCodeController());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  int getData=0;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

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
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 10.px),
        child:Obx(() => mainController.showProgressbar.value?
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
        ):SizedBox(height: 20.px,)
        )

      ),
      body:
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10.px,),
            Text('SCAN QR CODE', style: MyTextStyle.titleStyle16bb,),
            SizedBox(height: 50.px,),
            SizedBox(
              height: 250.px,width: 250.px,
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            SizedBox(height: 70.px,),

           /* Center(
              child: (result != null)
                  ? ElevatedButton(onPressed: (){
               // openAlertBox(context);
              },
                  child: Text('Show More',style: MyTextStyle.titleStyle16bw,))
                  : Text('Scan a event qr-code',style: MyTextStyle.titleStyle16b,),

            )*/
            Obx(() => mainController.showCongratulation.value?
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15.px))
                ),
                color: primaryColor,
                margin: EdgeInsets.all(20.px),
                elevation: 0.px,
                child: SizedBox(
                  height: 120.px,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(IconsConstants.subCrownIcon, height: 30.px, width: 40.px, fit: BoxFit.fill,color: primary3Color,),
                          SizedBox(width: 5.px,),
                          Text(mainController.scanEventQrModel!.result!.points!, style: MyTextStyle.titleStyle20bw,),
                        ],
                      ),
                      SizedBox(height: 10.px,),
                      Text('Congratulations! You have received', style: MyTextStyle.titleStyle16bw,),
                    ],
                  ),
                )
            ):SizedBox(height: 20.px,))

          ],
        ),
      ),
    );

  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      result = scanData;
      if(result!=null){
        getData++;
        // setState((){
        //
        // });
        if(getData==1){
          mainController.changeCongratulation(false);
          openAlertBox(context);
        }

      }

    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }


  /// Show QR Alert Box...
  void openAlertBox(BuildContext context){
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        title:  Center(child: Text("Scan event qr-code and earn points ${result!.code}",style: MyTextStyle.titleStyle20bb,textAlign: TextAlign.center,)),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
          height: 160.px,width: MediaQuery.of(context).size.width-60.px,
          padding: EdgeInsets.all(10.px),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GFToggle(
                  onChanged: (val){
                    if(val!){
                      // controller?.stopCamera();
                      // controller?.dispose();
                      Get.back();
                      mainController.showProgressbar(true);
                      mainController.callingScanEventQrForEarnPointsForm(result!.code!);
                      result=null;
                      setState(() {
                        getData=0;
                      });

                      //openCodeAlertBox(context,"50");
                    }
                  },
                  value: false,
                  disabledTrackColor: editTextButton,
                  enabledTrackColor: primary3Color,
                  enabledThumbColor:primaryColor,
                  disabledThumbColor: primary3Color,
                  type: GFToggleType.ios,
                ),
                SizedBox(height: 5.px,),
                Text( 'Earn Points',style: MyTextStyle.titleStyle16bb,)
              ],
            ),
          ),
        ),
        alignment: Alignment.center,

        actions: <Widget>[
          Center(
            child: TextButton(onPressed: (){
              Get.back();
             // controller?.dispose();
              getData=0;
            },
                child:  Text( 'Swipe to earn event points!',style: MyTextStyle.titleStyle16blb,)),
          ),



        ],
      ),
    );
  }


}