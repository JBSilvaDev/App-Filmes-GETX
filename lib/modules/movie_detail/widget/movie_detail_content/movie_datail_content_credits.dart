// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:getx_appfilmes/models/movie_datail_model.dart';

class MovieDatailContentCredits extends StatelessWidget {
  final MovieDatailModel? movie;

  const MovieDatailContentCredits({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 50),
        child: Text(
          movie?.overview ?? '',
          style: const TextStyle(fontSize: 14, height: 1.3),
        ),
      ),
    );
  }
}
