import 'package:getx_appfilmes/app/ui/loader/loader_mixin.dart';
import 'package:getx_appfilmes/app/ui/messages/messages_mixin.dart';
import 'package:getx_appfilmes/models/movie_datail_model.dart';
import 'package:getx_appfilmes/services/movies/movies_services.dart';
import 'package:get/get.dart';

class MovieDetailController extends GetxController
    with LoaderMixin, MessagesMixin {
  final MoviesServices _moviesServices;
  MovieDetailController({required MoviesServices moviesServices})
      : _moviesServices = moviesServices;

  var loading = false.obs;
  var message = Rxn<MessageModel>();
  var movie = Rxn<MovieDatailModel>();

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }

  @override
  Future<void> onReady() async {
    try {
      final movieId = Get.arguments;
      loading(true);
      final movieDetailData = await _moviesServices.getDetail(movieId);
      movie.value = movieDetailData;
      loading(false);
    } catch (e, s) {
      print(e);
      print(s);
      loading(false);
      message(MessageModel.error(
          title: 'Status', message: 'Erro ao buscar dados do filme'));
    }
    super.onReady();
  }
}
