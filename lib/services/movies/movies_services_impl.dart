// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_appfilmes/models/movie_datail_model.dart';
import 'package:getx_appfilmes/models/movie_model.dart';
import 'package:getx_appfilmes/repositories/movies/movies_repository.dart';

import './movies_services.dart';

class MoviesServicesImpl implements MoviesServices {
  final MoviesRepository _moviesRepository;
  MoviesServicesImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getToRated() => _moviesRepository.getToRated();

  @override
  Future<MovieDatailModel?> getDetail(int id) =>
      _moviesRepository.getDetail(id);

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) =>
      _moviesRepository.addOrRemoveFavorite(userId, movie);

  @override
  Future<List<MovieModel>> getFavoritiesMovies(String userId) =>
      _moviesRepository.getFavoritiesMovies(userId);
}
