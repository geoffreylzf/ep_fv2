import 'package:ep_fv2/controllers/utils/db.dart';
import 'package:ep_fv2/controllers/utils/network.dart';
import 'package:ep_fv2/controllers/utils/user_credential.dart';
import 'package:ep_fv2/pages/home.dart';
import 'package:ep_fv2/pages/login.dart';
import 'package:ep_fv2/pages/setup.dart';
import 'package:ep_fv2/pages/splash.dart';
import 'package:ep_fv2/pages/update_app_ver.dart';
import 'package:ep_fv2/pages/upload.dart';
import 'package:ep_fv2/pages/visits/_id/do_id.dart';
import 'package:ep_fv2/pages/visits/_id/do_index.dart';
import 'package:ep_fv2/pages/visits/_id/fo_id.dart';
import 'package:ep_fv2/pages/visits/_id/fo_id_images.dart';
import 'package:ep_fv2/pages/visits/_id/fo_id_images_id.dart';
import 'package:ep_fv2/pages/visits/_id/fo_index.dart';
import 'package:ep_fv2/pages/visits/_id/index.dart';
import 'package:ep_fv2/pages/visits/_id/ma_id.dart';
import 'package:ep_fv2/pages/visits/_id/ma_id_images.dart';
import 'package:ep_fv2/pages/visits/_id/ma_id_images_id.dart';
import 'package:ep_fv2/pages/visits/_id/ma_index.dart';
import 'package:ep_fv2/pages/visits/_id/pasgar_index.dart';
import 'package:ep_fv2/pages/visits/_id/pasgar_order.dart';
import 'package:ep_fv2/pages/visits/_id/pm_id.dart';
import 'package:ep_fv2/pages/visits/_id/pm_id_images.dart';
import 'package:ep_fv2/pages/visits/_id/pm_id_images_id.dart';
import 'package:ep_fv2/pages/visits/_id/pm_index.dart';
import 'package:ep_fv2/pages/visits/_id/routine_id.dart';
import 'package:ep_fv2/pages/visits/_id/routine_id_images.dart';
import 'package:ep_fv2/pages/visits/_id/routine_id_images_id.dart';
import 'package:ep_fv2/pages/visits/_id/routine_index.dart';
import 'package:ep_fv2/pages/visits/_id/update.dart';
import 'package:ep_fv2/pages/visits/_id/weight_index.dart';
import 'package:ep_fv2/pages/visits/create.dart';
import 'package:ep_fv2/pages/visits/index.dart';
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
        GetPage(name: '/upload', page: () => UploadPage()),
        GetPage(name: '/visits', page: () => VisitIndexPage()),
        GetPage(name: '/visits/create/', page: () => VisitCreatePage()),
        GetPage(name: '/visits/:id', page: () => VisitIdIndexPage()),
        GetPage(name: '/visits/:id/update', page: () => VisitIdUpdatePage()),
        GetPage(name: '/visits/:id/fo', page: () => VisitIdFoIndexPage()),
        GetPage(name: '/visits/:id/fo/:id2', page: () => VisitIdFoIdPage()),
        GetPage(name: '/visits/:id/fo/:id2/images', page: () => VisitIdFoIdImagesPage()),
        GetPage(name: '/visits/:id/fo/:id2/images/:id3', page: () => VisitIdFoIdImagesIdPage()),
        GetPage(name: '/visits/:id/pm', page: () => VisitIdPmIndexPage()),
        GetPage(name: '/visits/:id/pm/:id2', page: () => VisitIdPmIdPage()),
        GetPage(name: '/visits/:id/pm/:id2/images', page: () => VisitIdPmIdImagesPage()),
        GetPage(name: '/visits/:id/pm/:id2/images/:id3', page: () => VisitIdPmIdImagesIdPage()),
        GetPage(name: '/visits/:id/do', page: () => VisitIdDoIndexPage()),
        GetPage(name: '/visits/:id/do/:id2', page: () => VisitIdDoIdPage()),
        GetPage(name: '/visits/:id/pasgar', page: () => VisitIdPasgarIndexPage()),
        GetPage(name: '/visits/:id/pasgar/:order', page: () => VisitIdPasgarOrderPage()),
        GetPage(name: '/visits/:id/ma', page: () => VisitIdMaIndexPage()),
        GetPage(name: '/visits/:id/ma/:id2', page: () => VisitIdMaIdPage()),
        GetPage(name: '/visits/:id/ma/:id2/images', page: () => VisitIdMaIdImagesPage()),
        GetPage(name: '/visits/:id/ma/:id2/images/:id3', page: () => VisitIdMaIdImagesIdPage()),
        GetPage(name: '/visits/:id/weight', page: () => VisitIdWeightIndexPage()),
        GetPage(name: '/visits/:id/routine', page: () => VisitIdRoutineIndexPage()),
        GetPage(name: '/visits/:id/routine/:id2', page: () => VisitIdRoutineIdPage()),
        GetPage(name: '/visits/:id/routine/:id2/images', page: () => VisitIdRoutineIdImagesPage()),
        GetPage(
            name: '/visits/:id/routine/:id2/images/:id3',
            page: () => VisitIdRoutineIdImagesIdPage()),
      ],
    );
  }
}
