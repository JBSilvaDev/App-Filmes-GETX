// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:getx_appfilmes/models/cast_model.dart';
import 'package:getx_appfilmes/models/genres_model.dart';

class MovieDatailModel {
  final String title;
  final double stars;
  final List<GenresModel> genres;
  final List<String> urlImages;
  final DateTime reliaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> cast;
  MovieDatailModel({
    required this.title,
    required this.stars,
    required this.genres,
    required this.urlImages,
    required this.reliaseDate,
    required this.overview,
    required this.productionCompanies,
    required this.originalLanguage,
    required this.cast,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'stars': stars,
      'genres': genres.map((x) => x.toMap()).toList(),
      'urlImages': urlImages,
      'reliaseDate': reliaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'productionCompanies': productionCompanies,
      'originalLanguage': originalLanguage,
      'cast': cast.map((x) => x.toMap()).toList(),
    };
  }

  factory MovieDatailModel.fromMap(Map<String, dynamic> map) {
    var urlImagesPosters = map['images']['posters'] ?? const [];
    var urlImagesJson = urlImagesPosters
            ?.map<String>(
                (i) => 'https://image.tmdb.org/t/p/w500${i['file_path']}')
            .toList() ??
        [];

    return MovieDatailModel(
      title: map['title'] as String,
      stars: map['vote_average'] as double,
      genres: List<GenresModel>.from(
          map['genres']?.map((x) => GenresModel.fromMap(x)) ?? const []),
      urlImages: urlImagesJson,
      reliaseDate: DateTime.parse(map['release_date']),
      overview: map['overview'] as String,
      productionCompanies:
          List<dynamic>.from(map['production_companies'] ?? const [])
              .map<String>((p) => p['name'])
              .toList(),
      originalLanguage: map['original_language'] as String,
      cast: List<CastModel>.from(
        map['credits']['cast']?.map<CastModel>((x) => CastModel.fromMap(x)) ??
            const [],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDatailModel.fromJson(String source) =>
      MovieDatailModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
