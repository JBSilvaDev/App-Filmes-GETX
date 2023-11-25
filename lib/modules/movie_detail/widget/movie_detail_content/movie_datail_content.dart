import 'package:getx_appfilmes/models/movie_datail_model.dart';
import 'package:getx_appfilmes/modules/movie_detail/widget/movie_detail_content/movie_datail_content_credits.dart';
import 'package:getx_appfilmes/modules/movie_detail/widget/movie_detail_content/movie_datail_content_main_cast.dart';
import 'package:getx_appfilmes/modules/movie_detail/widget/movie_detail_content/movie_datail_title.dart';
import 'package:flutter/material.dart';

import 'movie_detail_contant_production_companies.dart';

class MovieDatailContent extends StatelessWidget {
  final MovieDatailModel? movie;

  const MovieDatailContent({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MovieDatailTitle(movie: movie),
        MovieDatailContentCredits(movie: movie),
        MovieDetailContantProductionCompanies(movie: movie),
        MovieDatailContentMainCast(movie: movie)
      ],
    );
  }
}
