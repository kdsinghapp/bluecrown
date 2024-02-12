import 'package:bluecrown/Activity/BookingRequestActivity.dart';
import 'package:bluecrown/Activity/ChooseEventActivity.dart';
import 'package:bluecrown/Activity/ClubAllEventListActivity.dart';
import 'package:bluecrown/Activity/CreateQrActivity.dart';
import 'package:bluecrown/Activity/LoginTypeActivity.dart';
import 'package:bluecrown/Activity/MyPurchasingEventActivity.dart';
import 'package:bluecrown/Activity/OtpActivity.dart';
import 'package:bluecrown/Activity/QrScannerActivity.dart';
import 'package:bluecrown/Activity/UsePointEventsActivity.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'Activity/AddListActivity.dart';
import 'Activity/AdminWardrobeActivity.dart';
import 'Activity/ChangeEventActivity.dart';
import 'Activity/ChangePasswordActivity.dart';
import 'Activity/ClubAllHangerListActivity.dart';
import 'Activity/ClubPurchasedUserActivity.dart';
import 'Activity/CreateWardrobeQrCodeActivity.dart';
import 'Activity/EnterEventDetailActivity.dart';
import 'Activity/EventDetailActivity.dart';
import 'Activity/GetHangerListActivity.dart';
import 'Activity/ListActivity.dart';
import 'Activity/LoginActivity.dart';
import 'Activity/MainActivity.dart';
import 'Activity/MyBookingEventActivity.dart';
import 'Activity/MyWalletHistoryActivity.dart';
import 'Activity/NewPasswordActivity.dart';
import 'Activity/NotificationActivity.dart';
import 'Activity/PublishEventActivity.dart';
import 'Activity/ResetPasswordActivity.dart';
import 'Activity/SplashActivity.dart';
import 'Activity/UsePointClubsActivity.dart';
import 'Activity/UsePointsActivity.dart';
import 'Tool/Styles.dart';

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title
  // 'This channel is used for important notifications.', // description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {

  await Firebase.initializeApp();
  print('Handling a background message ${message.messageId}');
}

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
        getPages: [
       GetPage(name: '/loginActivity', page: ()=>const LoginActivity()),
        GetPage(name: '/loginTypeActivity', page: ()=>const LoginTypeActivity()),
        GetPage(name: '/listActivity', page: ()=>const ListActivity()),
        GetPage(name: '/mainActivity', page: ()=>const MainActivity()),
        GetPage(name: '/eventDetailActivity', page: ()=>const EventDetailActivity()),
          GetPage(name: '/otpActivity', page:()=>const OtpActivity()),
          GetPage(name: '/newPasswordActivity', page:()=> const NewPasswordActivity()),
          GetPage(name: '/resetPasswordActivity', page: ()=> const ResetPasswordActivity()),
          GetPage(name: '/changePasswordActivity', page: ()=>const ChangePasswordActivity()),
          GetPage(name: '/listActivity', page: ()=> const ListActivity()),
          GetPage(name: '/enterEventDetailsActivity', page: ()=> const EnterEventDetailActivity()),
          GetPage(name: '/createQrActivity', page: ()=> const CreateQrActivity()),
          GetPage(name: '/changeMyPublishEventActivity', page:()=> const ChangeEventActivity()),
          GetPage(name: '/notificationActivity', page: ()=>const NotificationActivity()),
          GetPage(name: '/getHangerListActivity', page: ()=> const GetHangerListActivity()),
          GetPage(name: '/qrScannerActivity', page: ()=> const QrScannerActivity()),
          GetPage(name: '/adminWardrobeActivity', page: ()=> const AdminWardrobeActivity()),
          GetPage(name: '/clubAllEventActivity', page: ()=> const ClubAllEventActivity()),
          GetPage(name: '/chooseEventActivity', page: ()=> const ChooseEventActivity()),
          GetPage(name: '/addListActivity', page: ()=> const AddListActivity()),
          GetPage(name: '/bookingRequestActivity', page: ()=> const BookingRequestActivity()),
          GetPage(name: '/createWardrobeQrCodeActivity', page: ()=> const CreateWardrobeQrCodeActivity()),
          GetPage(name: '/clubAllHangerListActivity', page: ()=> const ClubAllHangerListActivity()),
          GetPage(name: '/myBookingEventActivity', page:()=> const MyBookingEventActivity()),
          GetPage(name: '/usePointEventsActivity', page:()=> const UsePointEventsActivity()),
          GetPage(name: '/usePointClubsActivity', page:()=> const UsePointClubsActivity()),
          GetPage(name: '/usePointsActivity', page:()=> const UserPointsActivity()),
          GetPage(name: '/myPurchasingEventActivity', page:()=> const MyPurchasingEventActivity()),
          GetPage(name: '/clubPurchasedUserActivity', page:()=> const ClubPurchasedUserActivity()),
          GetPage(name: '/myWalletHistoryActivity', page:()=> const MyWalletHistoryActivity()),

      ],
      theme:Styles.themeData(false, context),
      debugShowCheckedModeBanner: false,
      home: const SplashActivity(title: 'Splash Activity'),
    );
  }
}
