// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_appfilmes/app/ui/theme_extensions.dart';
import 'package:getx_appfilmes/modules/movie_detail/widget/movie_detail_content/movie_cast.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../models/movie_datail_model.dart';

class MovieDatailContentMainCast extends StatelessWidget {
  final MovieDatailModel? movie;
  final showPanel = false.obs;
  MovieDatailContentMainCast({
    Key? key,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
          color: context.themeGray,
        ),
        Obx(() {
          return ExpansionPanelList(
            elevation: 0,
            expandedHeaderPadding: EdgeInsets.zero,
            expansionCallback: (panelIndex, isExpanded) {
              showPanel.toggle();
            },
            children: [
              ExpansionPanel(
                canTapOnHeader: false,
                backgroundColor: Colors.white,
                isExpanded: showPanel.value,
                headerBuilder: (context, isExpanded) {
                  return const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Elenco Principal',
                      style: TextStyle(fontSize: 16),
                    ),
                  );
                },
                body: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: movie?.cast
                            .map((cast) => MovieCast(cast: cast))
                            .toList() ??
                        [],
                  ),
                ),
              )
            ],
          );
        })
      ],
    );
  }
}
