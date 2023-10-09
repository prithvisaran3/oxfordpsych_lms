import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


FlutterLocalNotificationsPlugin fltNotification =
    FlutterLocalNotificationsPlugin();
FirebaseMessaging messaging = FirebaseMessaging.instance;
//notification settings
void initMessaging() async {
  var androidInit =
      const AndroidInitializationSettings("@mipmap/ic_launcher"); //for logo
  var iosInit = const DarwinInitializationSettings(
    defaultPresentAlert: true,
    defaultPresentBadge: true,
    defaultPresentSound: true,
  );
  var initSetting = InitializationSettings(android: androidInit, iOS: iosInit);
  fltNotification = FlutterLocalNotificationsPlugin();
  fltNotification.initialize(initSetting);
  var androidDetails = const AndroidNotificationDetails("1", "Oxford Psych",
      importance: Importance.max,
      priority: Priority.max,
      visibility: NotificationVisibility.public,
      icon: "@mipmap/ic_launcher",
      playSound: true,
      sound: RawResourceAndroidNotificationSound('tone'));
  var iosDetails = const DarwinNotificationDetails(sound: 'ios_message');
  var generalNotificationDetails =
      NotificationDetails(android: androidDetails, iOS: iosDetails);
  // NotificationSettings settings =  messaging.requestPermission();
  // debugPrint("permission status : ${settings.authorizationStatus}");
  FirebaseMessaging.onMessage.listen(
    (RemoteMessage message) {
      debugPrint("Notification data details: ${message.data}");

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;
      if (notification != null && android != null) {
        // startMessage();

        fltNotification.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails,
            payload: 'Custom_Sound');
      } else if (notification != null) {
        fltNotification.show(notification.hashCode, notification.title,
            notification.body, generalNotificationDetails,
            payload: 'Custom_Sound');
      } else {
        debugPrint("error on notification");
      }
    },
    onDone: () {
      debugPrint("lkhklhjklhjklghjkgkjgjk");
    },
  );

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    if (message.data.isNotEmpty) {
      // Get.to(NewRideRequest(
      //   isFromNotification: true,
      //   packageId: "${message.data['package_id']}",
      // ));
    }
  });
}
