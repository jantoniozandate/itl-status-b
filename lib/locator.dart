import 'package:itlstatusb/src/services/authentication_service.dart';
// import 'package:itlstatusb/src/services/cloud_storage_service.dart';
// import 'package:itlstatusb/src/services/firestore_service.dart';
import 'package:itlstatusb/src/services/push_notification_service.dart';
// import 'package:itlstatusb/src/utils/image_selector.dart';
import 'package:get_it/get_it.dart';
import 'package:itlstatusb/src/services/navigation_service.dart';
import 'package:itlstatusb/src/services/dialog_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => AuthenticationService());
  // locator.registerLazySingleton(() => FirestoreService());
  // locator.registerLazySingleton(() => CloudStorageService());
  // locator.registerLazySingleton(() => ImageSelector());
  locator.registerLazySingleton(() => PushNotificationService());
}
