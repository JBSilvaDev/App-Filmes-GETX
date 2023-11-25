// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_appfilmes/modules/movies/movies_controller.dart';
import 'package:flutter/material.dart';

import 'package:getx_appfilmes/app/ui/theme_extensions.dart';
import 'package:getx_appfilmes/app/ui/widgets/movies_card.dart';
import 'package:getx_appfilmes/models/movie_model.dart';
import 'package:get/get.dart';

class MoviesGroup extends GetView<MoviesController> {
  final String title;
  final List<MovieModel> movies;
  const MoviesGroup({
    Key? key,
    required this.title,
    required this.movies,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: context.themeBlack),
          ),
          SizedBox(
              height: 280,
              child: Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: movies.length,
                    itemBuilder: ((context, index) {
                      var movie = movies[index];
                      return MoviesCard(
                        movie: movie,
                        favoriteCallBack: () => controller.favoriteMovie(movie),
                      );
                    }));
              })),
        ],
      ),
    );
  }
}
