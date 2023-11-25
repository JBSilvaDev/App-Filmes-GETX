// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class FilmesAppUiConfig {
  FilmesAppUiConfig._();
  static String get title => 'Filmes App';
  static ThemeData get Theme => ThemeData(
      fontFamily: 'Metropolis',
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
              color: Color(0xff222222),
              fontSize: 19,
              fontWeight: FontWeight.w500)));
}
