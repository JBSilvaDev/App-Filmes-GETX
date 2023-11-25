import 'package:getx_appfilmes/modules/movies/movies_controller.dart';
import 'package:getx_appfilmes/modules/movies/widgets/movies_filters.dart';
import 'package:getx_appfilmes/modules/movies/widgets/movies_group.dart';
import 'package:getx_appfilmes/modules/movies/widgets/movies_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviesPage extends GetView<MoviesController> {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: ListView(
        children: [
          const MoviesHeader(),
          const MoviesFilters(),
          MoviesGroup(
            title: 'Mais Populares',
            movies: controller.popularMovies,
          ),
          MoviesGroup(
            title: 'Tops filmes',
            movies: controller.topRateMovies,
          ),
          // MoviesGroup(
          //   title: 'Todos',
          //   movies: controller.topRateMovies,
          // ), Aqui configurar para exibir todos com botao para mudar de pagina na url
        ],
      ),
    );
  }
}
