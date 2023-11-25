import 'package:getx_appfilmes/models/genres_model.dart';

import '../../repositories/geners/genres_repository.dart';
import './genres_services.dart';

class GenresServicesImpl implements GenresServices {
  final GenresRepository _genresRepository;
  GenresServicesImpl({
    required GenresRepository genresRepository,
  }) : _genresRepository = genresRepository;

  @override
  Future<List<GenresModel>> getGenres() => _genresRepository.getGenres();
}
