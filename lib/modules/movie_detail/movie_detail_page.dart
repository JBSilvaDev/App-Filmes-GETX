import 'package:getx_appfilmes/modules/movie_detail/widget/movie_detail_content/movie_datail_content.dart';
import 'package:getx_appfilmes/modules/movie_detail/widget/movie_detail_header.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './movie_detail_controller.dart';

class MovieDetailPage extends GetView<MovieDetailController> {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalhe'),
      ),
      body: SingleChildScrollView(child: Obx(() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MovieDetailHeader(
              movie: controller.movie.value,
            ),
            MovieDatailContent(movie: controller.movie.value)
          ],
        );
      })),
    );
  }
}
