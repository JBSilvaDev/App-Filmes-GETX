import 'package:getx_appfilmes/app/modules/module.dart';
import 'package:getx_appfilmes/modules/movie_detail/movie_detail_bindings.dart';
import 'package:getx_appfilmes/modules/movie_detail/movie_detail_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MovieDetailModule extends Module {
  @override
  List<GetPage> routers = [
    GetPage(
        name: '/movie/detail',
        page: () => const MovieDetailPage(),
        binding: MovieDetailBindings())
  ];
}
