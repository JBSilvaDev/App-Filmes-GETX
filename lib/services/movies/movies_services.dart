import '../../models/movie_datail_model.dart';
import '../../models/movie_model.dart';

abstract class MoviesServices {
  Future<List<MovieModel>> getPopularMovies();
  Future<List<MovieModel>> getToRated();
  Future<MovieDatailModel?> getDetail(int id);
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie);
  Future<List<MovieModel>> getFavoritiesMovies(String userId);
}
