import 'package:getx_appfilmes/models/movie_datail_model.dart';
import 'package:flutter/material.dart';

class MovieDetailHeader extends StatelessWidget {
  final MovieDatailModel? movie;
  const MovieDetailHeader({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (movie != null) {
      return SizedBox(
        height: 278,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movie!.urlImages.length,
            itemBuilder: ((context, index) {
              final image = movie!.urlImages[index];

              return Padding(
                padding: const EdgeInsets.all(2),
                child: Image.network(image),
              );
            })),
      );
    }
    return const SizedBox.shrink(
      child: Text('Detalhes nao disponiveis'),
    );
  }
}
