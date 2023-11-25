import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_appfilmes/app/ui/widgets/movies_card.dart';
import 'package:getx_appfilmes/modules/favorites/favories_controller.dart';

class FavoritesPage extends GetView<FavoriesController> {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Favoritos'),
        ),
        body: Obx(() {
          return SingleChildScrollView(
            child: SizedBox(
              width: Get.width,
              child: Wrap(
                  alignment: WrapAlignment.spaceAround,
                  children: controller.movies
                      .map(
                        (movieFavotite) => MoviesCard(
                          favoriteCallBack: () =>
                              controller.removeFavorities(movieFavotite),
                          movie: movieFavotite,
                        ),
                      )
                      .toList()),
            ),
          );
        }));
  }
}
