// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_appfilmes/app/auth/auth_service.dart';
import 'package:getx_appfilmes/app/ui/messages/messages_mixin.dart';
import 'package:getx_appfilmes/models/genres_model.dart';
import 'package:getx_appfilmes/models/movie_model.dart';
import 'package:getx_appfilmes/services/movies/movies_services.dart';
import 'package:get/get.dart';

import 'package:getx_appfilmes/services/genres/genres_services.dart';

class MoviesController extends GetxController with MessagesMixin {
  final GenresServices _genresServices;
  final MoviesServices _moviesServices;
  final AuthService _authService;

  final _message = Rxn<MessageModel>();
  final genres = <GenresModel>[].obs;
  final popularMovies = <MovieModel>[].obs;
  var _popularMoviesOriginal = <MovieModel>[];
  final topRateMovies = <MovieModel>[].obs;
  var _topRateMoviesOriginal = <MovieModel>[];
  final genreSelected = Rxn<GenresModel>();

  MoviesController({
    required AuthService authService,
    required GenresServices genresServices,
    required MoviesServices moviesServices,
  })  : _genresServices = genresServices,
        _authService = authService,
        _moviesServices = moviesServices;

  @override
  void onInit() {
    messageListener(_message);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      final genresData = await _genresServices.getGenres();
      genres.assignAll(genresData);

      await getMovies();
    } catch (e) {
      _message(MessageModel(
          title: 'Status',
          message: 'Erro ao carregar dados',
          type: MessageType.erro));
    }
  }

  Future<void> getMovies() async {
    try {
      var popularMoviesData = await _moviesServices.getPopularMovies();
      var topRateMoviesData = await _moviesServices.getToRated();
      final favorities = await getFavorities();

      popularMoviesData = popularMoviesData.map((m) {
        if (favorities.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      topRateMoviesData = topRateMoviesData.map((m) {
        if (favorities.containsKey(m.id)) {
          return m.copyWith(favorite: true);
        } else {
          return m.copyWith(favorite: false);
        }
      }).toList();

      popularMovies.assignAll(popularMoviesData);
      _popularMoviesOriginal = popularMoviesData;

      topRateMovies.assignAll(topRateMoviesData);
      _topRateMoviesOriginal = topRateMoviesData;
    } catch (e, s) {
      _message(MessageModel(
          title: 'Status',
          message: 'Erro ao carregar dados',
          type: MessageType.erro));
    }
  }

  void filterByName(String title) {
    if (title.isNotEmpty) {
      var newPopularMovies = _popularMoviesOriginal.where((element) {
        return element.title.toLowerCase().contains(title.toLowerCase());
      });
      var newTopRateMovies = _topRateMoviesOriginal.where((element) {
        return element.title.toLowerCase().contains(title.toLowerCase());
      });
      popularMovies.assignAll(newPopularMovies);
      topRateMovies.assignAll(newTopRateMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRateMovies.assignAll(_topRateMoviesOriginal);
    }
  }

  void filterByGenre(GenresModel? genresModel) {
    if (genresModel?.id == genreSelected.value?.id) {
      genresModel = null;
    }
    genreSelected.value = genresModel;

    if (genresModel != null) {
      var newPopularMovies = _popularMoviesOriginal.where((element) {
        return element.genres.contains(genresModel?.id);
      });
      var newTopRateMovies = _topRateMoviesOriginal.where((element) {
        return element.genres.contains(genresModel?.id);
      });
      popularMovies.assignAll(newPopularMovies);
      topRateMovies.assignAll(newTopRateMovies);
    } else {
      popularMovies.assignAll(_popularMoviesOriginal);
      topRateMovies.assignAll(_topRateMoviesOriginal);
    }
  }

  Future<void> favoriteMovie(MovieModel movie) async {
    final user = _authService.user;
    if (user != null) {
      var newMovie = movie.copyWith(favorite: !movie.favorite);
      await _moviesServices.addOrRemoveFavorite(user.uid, newMovie);
      await getMovies();
    }
  }

  Future<Map<int, MovieModel>> getFavorities() async {
    var user = _authService.user;
    if (user != null) {
      final favorities = await _moviesServices.getFavoritiesMovies(user.uid);
      return <int, MovieModel>{for (var fav in favorities) fav.id: fav};
    }
    return {};
  }
}
