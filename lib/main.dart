import 'package:bird_wallpaper/home/home_bird.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

FirebaseAuth ? auth;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  await Firebase.initializeApp();
  auth=FirebaseAuth.instance; 
  // firebase notification
  final FlutterLocalNotificationsPlugin firebaseremote =
    FlutterLocalNotificationsPlugin();

  const AndroidNotificationChannel firebasechannel = AndroidNotificationChannel(
    'Title',
    'Content',
    description: 'Content',
    importance: Importance.max,
    enableVibration: true,
    playSound: true,
  );
  await firebaseremote.resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(firebasechannel);

  Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp(); 
  }
  //FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(const HOME());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class HOME extends StatefulWidget {
  const HOME({Key? key}) : super(key: key);

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
      primarySwatch:Colors.grey,
      ),
     debugShowCheckedModeBanner: false,
     home: HomeBird(),
    );
  }
}