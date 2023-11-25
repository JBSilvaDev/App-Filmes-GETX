import 'package:getx_appfilmes/models/genres_model.dart';

abstract class GenresRepository {
  Future<List<GenresModel>> getGenres();
}
