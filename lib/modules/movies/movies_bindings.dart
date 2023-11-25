import 'package:getx_appfilmes/modules/movies/movies_controller.dart';
import 'package:getx_appfilmes/repositories/geners/genres_repository.dart';
import 'package:getx_appfilmes/repositories/geners/genres_repository_impl.dart';
import 'package:getx_appfilmes/services/genres/genres_services.dart';
import 'package:getx_appfilmes/services/genres/genres_services_impl.dart';
import 'package:get/get.dart';

class MoviesBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GenresRepository>(
        () => GenresRepositoryImpl(restClient: Get.find()));

    Get.lazyPut<GenresServices>(
        () => GenresServicesImpl(genresRepository: Get.find()));
    Get.lazyPut(() => MoviesController(
          genresServices: Get.find(),
          moviesServices: Get.find(),
          authService: Get.find(),
        ));
  }
}
