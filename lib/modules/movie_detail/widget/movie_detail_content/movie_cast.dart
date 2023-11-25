// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:getx_appfilmes/app/ui/theme_extensions.dart';
import 'package:flutter/material.dart';

import '../../../../models/cast_model.dart';

class MovieCast extends StatelessWidget {
  final CastModel? cast;
  const MovieCast({
    Key? key,
    required this.cast,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 95,
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              cast?.image ??
                  'https://yt3.ggpht.com/ytc/AMLnZu-gy15ZR-sZauH9syFU4IZlBlMDUNYmOu5D9EVI=s88-c-k-c0x00ffffff-no-rj',
              width: 85,
              height: 85,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            cast?.name ?? 'JB Development',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
          ),
          Text(
            cast?.character ?? '',
            style: TextStyle(fontSize: 12, color: context.themeGray),
          ),
        ],
      ),
    );
  }
}
