import 'dart:io';

import 'package:bluecrown/Controller/CreateWardrobeQrController.dart';
import 'package:bluecrown/Controller/DownloadQrImageController.dart';
import 'package:bluecrown/Tool/Color.dart';
import 'package:bluecrown/common/ShowToast.dart';
import 'package:bluecrown/common/validations.dart';
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

import 'dart:async';
import 'dart:ui' as ui;

import 'package:qr_flutter/qr_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:screenshot/screenshot.dart';

import '../Tool/MyTextStyle.dart';
import '../common/CommonWidget.dart';
import '../constant/imageconstants.dart';
import '../constant/stringconstants.dart';

/// This is the screen that you'll see when the app starts
/*
void main() => runApp(ExampleApp());

/// The example application class
class ExampleApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      title: 'QR.Flutter',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}  */



class CreateWardrobeQrCodeActivity extends StatefulWidget {
  const CreateWardrobeQrCodeActivity({super.key});

  @override
  State<CreateWardrobeQrCodeActivity> createState() => _CreateWardrobeQrCodeState();
}

class _CreateWardrobeQrCodeState extends State<CreateWardrobeQrCodeActivity> {
  CreateWardrobeController controller=Get.put(CreateWardrobeController());

  @override
  void initState() {
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String message = '0 \$';

    final FutureBuilder<ui.Image> qrFutureBuilder = FutureBuilder<ui.Image>(
      future: _loadOverlayImage(),
      builder: (BuildContext ctx, AsyncSnapshot<ui.Image> snapshot) {
        const double size = 280.0;
        if (!snapshot.hasData) {
          return const SizedBox(width: size, height: size);
        }
        return CustomPaint(
          size: const Size.square(size),
          painter: QrPainter(
            data: controller.valueController.text??'0',
            version: QrVersions.auto,
            eyeStyle: const QrEyeStyle(
              eyeShape: QrEyeShape.square,
              color: Color(0xff1f1f1f),
            ),
            dataModuleStyle: const QrDataModuleStyle(
              dataModuleShape: QrDataModuleShape.circle,
              color: Color(0xff1f1f1f),
            ),
            // size: 320.0,
            embeddedImage: snapshot.data,
            embeddedImageStyle: const QrEmbeddedImageStyle(
              size: Size.square(60),
            ),
          ),
        );
      },
    );

    return Scaffold(
     backgroundColor:primary3Color,
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
      extendBody: true,
      resizeToAvoidBottomInset: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
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
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CommonWidget.commonElevatedButton(
                      onPressed: (){
                        if(controller.valueController.text.isNotEmpty&& controller.nameController.text.isNotEmpty){
                          setState(() {

                          });
                          controller.changeShowQrImage(true);
                        }else{
                          showToastMessage('Enter QR Number');
                        }


                      },
                      text: 'Show Qr Image',
                      wantContentSizeButton: true,
                      width: 150.px,
                      height: 50.px,
                      borderRadius: 25.px
                  ),
                  CommonWidget.commonElevatedButton(
                      onPressed: (){
                        controller.openClubAllHangerActivity();
                      },
                      text: StringConstants.allQrCode,
                      wantContentSizeButton: true,
                      width: 150.px,
                      height: 50.px,
                      borderRadius: 25.px,
                      buttonColor: Colors.grey
                  ),
                ],
              ),
              CommonWidget.commonElevatedButton(
                  onPressed: (){
                    if(controller.valueController.text.isNotEmpty && controller.nameController.text.isNotEmpty && controller.showQrImage.value){
                      controller.changeShowProgressBar(true);
                      controller.callingUpdateEventsForm();
                    }else{
                      showToastMessage('Create Wardrobe Qr-Code');
                    }
                  },
                  text: StringConstants.createQrCode,
                  buttonMargin: EdgeInsets.only(top: 10.px),
                  borderRadius: 25.px
              ),
            ],
          ),
          )

      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20.px,top: 20.px,right: 20.px),
              child: Obx(() =>controller.showQrImage.value?
              Container(
                width: 250.px,height: 250.px,
                padding: EdgeInsets.all(10.px),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.px)),
                    border: Border.all(color: cartColor,width: 3.px),
                    color: primary3Color
                ),
                child:qrFutureBuilder ,
              ):
              Container(
                width: 250.px,height: 250.px,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.px)),
                  border: Border.all(color: cartColor,width: 3.px),
                  color: cartColor
                ),
                //child: qrFutureBuilder,
              ),),
            ),
            CommonWidget.commonTextField(
              validator: (value) => FormValidator.isPasswordValid(value: value),
              controller: controller.nameController,
              isCard: false,
              hintText:'Name',
              margin: EdgeInsets.only(left: 20.px,right: 20.px,top: 10.px,bottom: 5),
              keyboardType: TextInputType.name,

            ),
            CommonWidget.commonTextField(
              validator: (value) => FormValidator.isPasswordValid(value: value),
              controller: controller.valueController,
              isCard: false,
              hintText:'QR Number',
              margin: EdgeInsets.only(left: 20.px,right: 20.px,top: 10.px,bottom: 5),
              keyboardType: TextInputType.number,
              suffixIcon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
               Image.asset(ImageConstants.scannerImg,width: 30.px,height: 30.px,fit: BoxFit.fill,)
                ],
              ),

            ),
          ],
        ),
      ),
    );
  }


  Future<ui.Image> _loadOverlayImage() async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final ByteData byteData = await rootBundle.load(IconsConstants.scanIcon);
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;
  }

}