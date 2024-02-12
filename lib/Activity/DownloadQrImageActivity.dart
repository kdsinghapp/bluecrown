

import 'dart:convert';
import 'dart:io';
import 'dart:ui';

import 'package:bluecrown/Controller/DownloadQrImageController.dart';
import 'package:bluecrown/Tool/Color.dart';
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



class DownloadQrImageActivity extends StatefulWidget {
  const DownloadQrImageActivity({super.key,required this.price});
  final String price;
  @override
  State<DownloadQrImageActivity> createState() => _DownloadQrImageState();
}

class _DownloadQrImageState extends State<DownloadQrImageActivity> {
  DownloadQrImageController controller=Get.put(DownloadQrImageController());
  ScreenshotController screenshotController = ScreenshotController();
  
  @override
  void initState() {
    // if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    super.initState();
  }

  Future<void> saveQrImage() async {
     try {
       final qrImage = await QrPainter(data: '50', version: QrVersions.auto)
           .toImage(300);
       final ByteData? byteData = await qrImage.toByteData(
           format: ImageByteFormat.png);
       final Uint8List uint8List = byteData!.buffer.asUint8List();
       final result = await ImageGallerySaver.saveImage(
           uint8List, name: "QR_Code_50_rupees");
       print("Data Path" + result.toString());
     }catch(e){
       print("Data Path" + e.toString());
     }

  }

  @override
  Widget build(BuildContext context) {
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
            data: widget.price,
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
      //color: Colors.white,
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
          screenshotController
              .capture(delay: Duration(milliseconds: 10))
              .then((capturedImage) async {
            ShowCapturedWidget(context, capturedImage!);
          }).catchError((onError) {
            print("Error:-"+onError);
          });

         // saveQrImage();

        }
            ,text: StringConstants.download,
            buttonMargin: EdgeInsets.all(10.px),
            borderRadius: 30.px,
            height: 60.px)),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Screenshot(
                controller: screenshotController,
                child: Container(
                  width: 250.px,height: 250.px,
                  padding: EdgeInsets.all(10.px),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10.px)),
                    border: Border.all(color: text2Color,width: 2.px)
                  ),
                  child: qrFutureBuilder,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<ui.Image> _loadOverlayImage() async {
    final Completer<ui.Image> completer = Completer<ui.Image>();
    final ByteData byteData = await rootBundle.load(IconsConstants.scanIcon,);
    ui.decodeImageFromList(byteData.buffer.asUint8List(), completer.complete);
    return completer.future;

  }

  void ShowCapturedWidget(BuildContext context, Uint8List capturedImage) async{

    //File('my_image.jpg').writeAsBytes(capturedImage);
    final result = await ImageGallerySaver.saveImage(Uint8List.fromList(capturedImage),
        name: 'BlueCrown',
        quality: 100);
    print("Result:-"+result.toString());
    print("Result:- ${result['path']}");

  }

  /*_saveNetworkImage(img) async {
    var response = await Dio().get(img, options: Options(responseType: ResponseType.bytes));
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(response.data),
        quality: 60,
        name: "Asdelogy".tr);
    print(result);
    Utils.toast("$result");
    Navigator.pop(context);
  } */
}