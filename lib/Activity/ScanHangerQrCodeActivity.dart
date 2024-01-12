import 'dart:io';
import 'dart:math';
import 'package:bluecrown/Controller/ScanHangerQrCodeController.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Tool/Color.dart';
import '../Tool/MyTextStyle.dart';
class ScanHangerQrCodeActivity extends StatefulWidget {
  const ScanHangerQrCodeActivity({super.key});

  @override
  State<ScanHangerQrCodeActivity> createState() => _ScanHangerQrCodeState();
}

class _ScanHangerQrCodeState extends State<ScanHangerQrCodeActivity> {
  ScanHangerQrCodeController mainController=Get.put(ScanHangerQrCodeController());
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

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
        padding: const EdgeInsets.only(bottom: 10),
        child:  Obx(() => mainController.showProgressBar.value?
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
        SizedBox(height: 5.px,),
        ),
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
            SizedBox(height: 100.px,),

            /* CommonWidget.commonElevatedButton(
                  onPressed: (){

                  },
                  text: StringConstants.scanQrCode,
                  wantContentSizeButton: true,
                  width: 150.px,
                  height: 50.px,
                  borderRadius: 25.px
              ),*/

            Center(
              child: (result != null)
                  ? Text(
                  'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                  : Text('Scan a code'),

            )
            /*  Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: (result != null)
                      ? Text(
                      'Barcode Type: ${describeEnum(result!.format)}   Data: ${result!.code}')
                      : Text('Scan a code'),
                ),
              )*/
          ],
        ),
      ),
    );

  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        if(result!=null){
          // controller?.dispose();
          openAlertBox(context);
        }
      });
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
        title:  Center(child: Text("Are you sure you want to check in your jacket? ${result!.code}",style: MyTextStyle.titleStyle24bb,textAlign: TextAlign.center,)),
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
            child: GFToggle(
              onChanged: (val){
                if(val!){
                  controller?.stopCamera();
                  controller?.dispose();
                  Get.back();
                  openCodeAlertBox(context);
                }
              },
              value: false,
              disabledTrackColor: editTextButton,
              enabledTrackColor: editTextButton,
              enabledThumbColor:primaryColor,
              type: GFToggleType.ios,
            ),
          ),
        ),
        alignment: Alignment.center,

        actions: <Widget>[
          Center(
            child: TextButton(onPressed: (){
              Get.back();
              controller?.dispose();
            },
                child:  Text( 'Swipe to get recive personal code!',style: MyTextStyle.titleStyle16blb,)),
          ),



        ],
      ),
    );
  }


  /// Show Code Alert Box...
  void openCodeAlertBox(BuildContext context){
    showDialog(
      context: context,
      builder: (ctx)=>AlertDialog(
        title:  Center(child: Text("Do you want to hang your jacket ?",style: MyTextStyle.titleStyle24bb,textAlign: TextAlign.center,)),
        insetPadding: EdgeInsets.symmetric(horizontal: 20.px),
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.px))
        ),
        content:  Container(
          height: 260.px,width: MediaQuery.of(context).size.width-60.px,
          padding: EdgeInsets.all(10.px),
          child:  CircularPercentIndicator(
            radius: 100.0.px,
            lineWidth: 13.0.px,
            animation: true,
            percent: 0.7,
            center:Text(mainController.parameterData['hangerCode']!, style:const TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
            ),
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: primaryColor,
          ),
        ),
        alignment: Alignment.center,

        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(onPressed: (){
                Get.back();
              },
                  child: const Text( 'No',style: TextStyle(fontWeight: FontWeight.bold,fontSize:16,color: Colors.redAccent),)),
              TextButton(onPressed: (){
                Get.back();
                mainController.changeProgressbarStatus(true);
                mainController.callingHangJacket();
              },
                  child: const Text( 'Yes',style: TextStyle(fontWeight: FontWeight.bold,fontSize:16,color: Colors.green),)),
            ],
          ),



        ],
      ),
    );
  }

  String generateRandomString() {
    var random = Random();
    int randomNumber = random.nextInt(100);
    return randomNumber.toString();
  }
}