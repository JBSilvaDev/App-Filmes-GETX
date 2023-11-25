import 'package:get/get.dart';
import 'package:getx_appfilmes/app/auth/auth_service.dart';
import 'package:getx_appfilmes/models/movie_model.dart';
import 'package:getx_appfilmes/services/movies/movies_services.dart';

class FavoriesController extends GetxController {
  final MoviesServices _moviesServices;
  final AuthService _authService;
  var movies = <MovieModel>[].obs;

  FavoriesController(
      {required MoviesServices moviesServices,
      required AuthService authService})
      : _authService = authService,
        _moviesServices = moviesServices;

  @override
  Future<void> onReady() async {
    super.onReady();
    await _getFavorities();
  }

  Future<void> _getFavorities() async {
    var user = _authService.user;
    if (user != null) {
      var favorities = await _moviesServices.getFavoritiesMovies(user.uid);
      movies.assignAll(favorities);
    }
  }

  Future<void> removeFavorities(MovieModel movie) async {
    var user = _authService.user;
    if (user != null) {
      var favorities = await _moviesServices.addOrRemoveFavorite(
          user.uid, movie.copyWith(favorite: false));
      movies.remove(movie);
    }
  }
}
