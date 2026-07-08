import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:divya_path/app/features/auth/login/view/get_started_screen.dart';
import 'package:divya_path/utils/app_string.dart';
import 'package:divya_path/utils/app_them.dart';
import 'package:divya_path/utils/app_utils.dart';
import 'package:divya_path/utils/shared_preferences.dart';
import 'package:divya_path/app/features/dashboard/view/dashboard_screen.dart';
import 'package:divya_path/app/features/dashboard/controller/dashboard_controller.dart';
import 'package:divya_path/app_service/network/network_service.dart';
import 'package:divya_path/app_service/notification/notification_service.dart';
import 'package:divya_path/app_service/translations/app_translations.dart';

SpUtil? sp;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Note: Firebase initialize might fail if google-services.json is missing,
  // but we follow the requested structure.
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  sp = await SpUtil.getInstance();
  await NetworkService().initRepo();

  await AppUtils.saveFcmToken();

  if (AppUtils.checkUserLogin()) {
    AppUtils.updateFcmTokenApi();
  }

  await NotificationService().init();

  AppTranslations.instance.loadSavedLocale();

  SystemChannels.textInput.invokeMethod('TextInput.hide');

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // Initialize GetX Controllers

  Get.put(const GetStartedScreen());

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    _,
  ) {
    runApp(const RunApp());
  });
}

class RunApp extends StatelessWidget {
  const RunApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.lightTheme,
      translations: AppTranslations.instance,
      locale: const Locale('en', 'US'),
      fallbackLocale: const Locale('en', 'US'),
      title: AppString.appName.tr,
      home: AppUtils.checkUserLogin()
          ? const DashboardScreen()
          : const GetStartedScreen(),
    );
  }
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  debugPrint('Background message: ${message.messageId}');
}
