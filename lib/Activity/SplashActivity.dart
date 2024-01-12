
import 'package:bluecrown/constant/iconsconstants.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

import '../Controller/SplashController.dart';
import '../Tool/Color.dart';
import '../main.dart';
class SplashActivity extends StatefulWidget {
  const SplashActivity({super.key, required this.title});
  final String title;

  @override
  State<SplashActivity> createState() => _SplashState();
}

class _SplashState extends State<SplashActivity> {
  SplashController controller=Get.put(SplashController());

  @override
  void initState() {
    super.initState();
    notificationSetup();
  }

  void notificationSetup(){
    var initializationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initialzationSettingsAndroid =
    const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
    InitializationSettings(android: initialzationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        //bool a= notification!['kl'==null];
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,
                //   channel.description,
                color: Colors.white,
                // TODO add a proper drawable resource to android, for now using
                //      one that already exists in example app.
                icon: "@mipmap/ic_launcher",
              ),
            ));
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title!),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(notification.body!)],
                  ),
                ),
              );
            });
      }
    });

    getToken();
  }
  late String token;
  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
    print("My Token:-"+token);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:primary3Color ,
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             SizedBox(
               height: 120,
                 width: 230,
                 child: Image.asset(IconsConstants.splashIcon)),

          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}