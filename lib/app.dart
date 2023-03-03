import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/controller/main_controller.dart';
import 'package:worldcup_app/common/languages/language.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/main.dart' as main;

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(MainController());
    return GetMaterialApp(
      title: 'FootBall 2022',
      theme: themeData,
      initialRoute: AppRoutes.splash,
      debugShowCheckedModeBanner: false,
      fallbackLocale: const Locale('en', 'US'),
      locale: const Locale('en', 'US'),
      translations: Languages(),
      getPages: AppRoutes.route,
      navigatorKey: main.navigator,
    );
  }
}
