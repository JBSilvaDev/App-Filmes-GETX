// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';

import 'package:getx_appfilmes/app/ui/theme_extensions.dart';
import 'package:getx_appfilmes/models/genres_model.dart';

class FilterTag extends StatelessWidget {
  final GenresModel model;
  final bool selected;
  final VoidCallback onPressed;
  const FilterTag({
    Key? key,
    required this.model,
    this.selected = false,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.all(5),
        padding: EdgeInsets.all(3),
        constraints: BoxConstraints(minWidth: 100, minHeight: 30),
        decoration: BoxDecoration(
          color: selected ? context.themeRed : context.themeBlack,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Align(
          child: Text(
            model.name,
            style: TextStyle(color: Colors.white, fontSize: 14),
          ),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
