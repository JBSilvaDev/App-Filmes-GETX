import 'package:getx_appfilmes/app/auth/auth_service.dart';
import 'package:getx_appfilmes/app/rest_client/rest_client.dart';
import 'package:getx_appfilmes/repositories/login/login_repository.dart';
import 'package:getx_appfilmes/repositories/login/login_repository_impl.dart';
import 'package:getx_appfilmes/repositories/movies/movies_repository.dart';
import 'package:getx_appfilmes/repositories/movies/movies_repository_impl.dart';
import 'package:getx_appfilmes/services/login/login_service.dart';
import 'package:getx_appfilmes/services/login/login_service_impl.dart';
import 'package:getx_appfilmes/services/movies/movies_services.dart';
import 'package:getx_appfilmes/services/movies/movies_services_impl.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings {
  @override
  void dependencies() {
    // Usar o Get.find() quando o solicitado ja esta declado, em LoginService pede um LoginServiceImpl e o mesmo esta declarado acima
    // em MoviesRepository pe de um RestClient e o mesmo esta declarado acima
    Get.lazyPut(() => RestClient(), fenix: true); // verificar uso do fenix aqui
    Get.put(AuthService()).init();
    Get.lazyPut<LoginRepository>(() => LoginRepositoryImpl(), fenix: true);
    Get.lazyPut<LoginService>(
        () => LoginServiceImpl(loginRepository: Get.find()),
        fenix: true);
    Get.lazyPut<MoviesRepository>(
        () => MoviesRepositoryImpl(restClient: Get.find()),
        fenix: true);
    Get.lazyPut<MoviesServices>(
        () => MoviesServicesImpl(moviesRepository: Get.find()),
        fenix: true);
  }
}
