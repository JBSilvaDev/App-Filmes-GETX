// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_appfilmes/models/genres_model.dart';

abstract class GenresServices {
  Future<List<GenresModel>> getGenres();
}
