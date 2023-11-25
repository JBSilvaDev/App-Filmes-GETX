import 'package:getx_appfilmes/app/bindings/app_bindings.dart';
import 'package:getx_appfilmes/app/ui/filmes_app_ui_config.dart';
import 'package:getx_appfilmes/modules/home/home_module.dart';
import 'package:getx_appfilmes/modules/login/login_module.dart';
import 'package:getx_appfilmes/modules/movie_detail/movie_detail_module.dart';
import 'package:getx_appfilmes/modules/splash/splash_module.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/sr\c/root/get_material_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
// ...
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseRemoteConfig.instance.fetchAndActivate();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: AppBindings(),
      title: FilmesAppUiConfig.title,
      theme: FilmesAppUiConfig.Theme,
      getPages: [
        ...SplashModule().routers,
        ...LoginModule().routers,
        ...HomeModule().routers,
        ...MovieDetailModule().routers,
      ],
    );
  }
}
