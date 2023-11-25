// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_appfilmes/app/rest_client/rest_client.dart';
import 'package:getx_appfilmes/models/genres_model.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';

import 'genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final RestClient _restClient;
  GenresRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;
  @override
  Future<List<GenresModel>> getGenres() async {
    final result = await _restClient.get<List<GenresModel>>(
      '/genre/movie/list',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br'
      },
      decoder: (data) {
        final resultData = data['genres'];
        if (resultData != null) {
          return resultData
              .map<GenresModel>((g) => GenresModel.fromMap(g))
              .toList();
        }
        return <GenresModel>[];
      },
    );
    if (result.hasError) {
      print(result.statusText);
      throw Exception('Erro ao buscar generos');
    }
    return result.body ?? <GenresModel>[];
  }
}
