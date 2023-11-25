import 'package:getx_appfilmes/app/modules/module.dart';
import 'package:getx_appfilmes/modules/splash/splash_bindings.dart';
import 'package:getx_appfilmes/modules/splash/splash_page.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
        name: '/', page: () => const SplashPage(), binding: SplashBindings()),
  ];
}
