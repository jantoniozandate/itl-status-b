import 'dart:async';
import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationProvider {
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  final _messagesStreamController = StreamController<String>.broadcast();
  Stream<String> get messages => _messagesStreamController.stream;

  initNotifications() {
    _firebaseMessaging.requestNotificationPermissions();
    _firebaseMessaging.getToken().then((token) {
      print('======= FCM TOKEN ========');
      print(token);
      // e0T_XiWuTeyaT5FpsRmEh_:APA91bH9fxB9mC5kClsrqJDcMAxv0qi0x5WT6ApbDiDKzYwaqkPgR4t7wd_hWaYxoaeGk5NA7goNa_1d43yGgeoYp1xHUThY4a0QUUlh99T7bDj2emQChsPmZhKx4nuALJxCgu9br7iW
    });

    _firebaseMessaging.configure(
      onMessage: (info) {
        print('==== On Message ====');
        print(info);

        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = info['data']['postId'] ?? 'no-data';
        }
        _messagesStreamController.sink.add(argumento);
        return null;
      },
      onLaunch: (info) {
        print('==== On Launch ====');
        print(info);
        return null;
      },
      onResume: (info) {
        print('==== On Resume ====');
        print(info);
        String argumento = 'no-data';
        if (Platform.isAndroid) {
          argumento = info['data']['postId'] ?? 'no-data';
        }
        _messagesStreamController.sink.add(argumento);
        return null;
      }
    );
  }
}