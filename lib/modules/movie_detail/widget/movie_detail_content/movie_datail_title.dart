import 'package:getx_appfilmes/app/ui/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

import '../../../../models/movie_datail_model.dart';

class MovieDatailTitle extends StatelessWidget {
  final MovieDatailModel? movie;
  const MovieDatailTitle({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Text(
            movie?.title ?? '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 10,
          ),
          RatingStars(
            value: (movie?.stars ?? 1) / 2,
            valueLabelVisibility: false,
            starColor: context.themeOrange,
            starSize: 14,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            movie?.genres.map((e) => e.name).join(', ') ?? '',
            style: TextStyle(fontSize: 11, color: context.themeGray),
          )
        ],
      ),
    );
  }
}
