// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:getx_appfilmes/app/ui/theme_extensions.dart';
import 'package:getx_appfilmes/models/movie_model.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';

import '../filme_app_icons_icons.dart';

class MoviesCard extends StatelessWidget {
  final dateFormat = DateFormat('MM/y');
  final MovieModel movie;
  final VoidCallback favoriteCallBack;
  MoviesCard({
    Key? key,
    required this.favoriteCallBack,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Get.toNamed('/movie/detail', arguments: movie.id);
        },
        child: SizedBox(
          width: 158,
          height: 280,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(20),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.antiAlias,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w200${movie.posterPath}',
                        width: 148,
                        height: 184,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    movie.title,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: context.themeBlack),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                  Text(
                    dateFormat.format(DateTime.parse(movie.releaseDate)),
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: context.themeGray),
                  ),
                ],
              ),
              Positioned(
                bottom: 80,
                right: -3,
                child: Material(
                  elevation: 5,
                  shape: const CircleBorder(),
                  clipBehavior: Clip.antiAlias,
                  child: SizedBox(
                    height: 30,
                    child: IconButton(
                      iconSize: 14,
                      onPressed: favoriteCallBack,
                      icon: Icon(
                        movie.favorite
                            ? FilmeAppIcons.heart
                            : FilmeAppIcons.heart_empty,
                        color: movie.favorite
                            ? context.themeRed
                            : context.themeGray,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
