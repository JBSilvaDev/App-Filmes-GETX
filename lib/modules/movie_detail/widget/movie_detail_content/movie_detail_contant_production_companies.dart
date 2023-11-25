// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:getx_appfilmes/models/movie_datail_model.dart';

class MovieDetailContantProductionCompanies extends StatelessWidget {
  final MovieDatailModel? movie;
  const MovieDetailContantProductionCompanies({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      child: RichText(
        text: TextSpan(
          text: 'Companhia(s) produtora(s): ',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xff222222),
          ),
          children: [
            TextSpan(
              text: movie?.productionCompanies.join(', ') ?? '',
              style: const TextStyle(
                fontWeight: FontWeight.normal,
                color: Color(0xff222222),
              ),
            )
          ],
        ),
      ),
    );
  }
}
