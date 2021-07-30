import 'package:ep_fv2/controllers/utils/db.dart';
import 'package:ep_fv2/controllers/utils/network.dart';
import 'package:ep_fv2/controllers/utils/user_credential.dart';
import 'package:ep_fv2/pages/home.dart';
import 'package:ep_fv2/pages/login.dart';
import 'package:ep_fv2/pages/setup.dart';
import 'package:ep_fv2/pages/splash.dart';
import 'package:ep_fv2/pages/update_app_ver.dart';
import 'package:ep_fv2/pages/visits/create.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NetworkController());
    Get.put(UserCredentialController());
    Get.put(DbController());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Eng Peng Farm Visit 2',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.deepOrange,
          textTheme: ButtonTextTheme.primary,
        ),
      ),
      initialBinding: InitialBinding(),
      initialRoute: '/splash',
      getPages: [
        GetPage(name: '/splash', page: () => SplashPage()),
        GetPage(name: '/login', page: () => LoginPage()),
        GetPage(name: '/', page: () => HomePage()),
        GetPage(name: '/updateAppVer', page: () => UpdateAppVerPage()),
        GetPage(name: '/setup', page: () => SetupPage()),
        GetPage(name: '/visits/create/', page: () => VisitCreatePage()),
      ],
    );
  }
}
