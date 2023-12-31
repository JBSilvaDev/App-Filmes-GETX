// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_appfilmes/app/rest_client/rest_client.dart';
import 'package:getx_appfilmes/models/movie_datail_model.dart';
import 'package:getx_appfilmes/models/movie_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import './movies_repository.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;
  MoviesRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
      },
      decoder: (data) {
        final resultData = data['results'];
        if (resultData != null) {
          return resultData
              .map<MovieModel>((v) => MovieModel.fromMap(v))
              .toList();
        }
        return <MovieModel>[];
      },
    );
    if (result.hasError) {
      print('Erro ao buscar filmes [${result.statusText}]');
      throw Exception('Erro ao buscar filmes populares');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getToRated() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1'
      },
      decoder: (data) {
        final resultData = data['results'];
        if (resultData != null) {
          return resultData
              .map<MovieModel>((v) => MovieModel.fromMap(v))
              .toList();
        }
        return <MovieModel>[];
      },
    );
    if (result.hasError) {
      print('Erro ao buscar filmes [${result.statusText}]');
      throw Exception('Erro ao buscar filmes tops');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<MovieDatailModel?> getDetail(int id) async {
    final result = await _restClient.get<MovieDatailModel?>('/movie/$id',
        query: {
          'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
          'language': 'pt-br',
          'append_to_response': 'images,credits',
          'include_image_language': 'en,pt-br'
        },
        decoder: ((data) => MovieDatailModel.fromMap(data)));

    if (result.hasError) {
      print('Erro ao buscar detalhes [${result.statusText}]');
      throw Exception('Erro ao buscar detalhes');
    }
    return result.body;
  }

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) async {
    try {
      var favoriteCollection = FirebaseFirestore.instance
          .collection('favorities')
          .doc(userId)
          .collection('movies');

      if (movie.favorite) {
        favoriteCollection.add(movie.toMap());
      } else {
        var favoriteData = await favoriteCollection
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();

        var docs = favoriteData.docs.first.reference.delete();
      }
    } catch (e) {
      print('Erro ao favoritar - $e');
      rethrow;
    }
  }

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) async {
    var favoritesMovies = await FirebaseFirestore.instance
        .collection('favorities')
        .doc(userId)
        .collection('movies')
        .get();

    final listFavorities = <MovieModel>[];
    for (var movie in favoritesMovies.docs) {
      listFavorities.add(MovieModel.fromMap(movie.data()));
    }
    return listFavorities;
  }
}
