import 'package:getx_appfilmes/app/ui/filme_app_icons_icons.dart';
import 'package:getx_appfilmes/modules/favorites/favories_bindings.dart';
import 'package:getx_appfilmes/modules/favorites/favorites_page.dart';
import 'package:getx_appfilmes/modules/home/home_controller.dart';
import 'package:getx_appfilmes/modules/movies/movies_bindings.dart';
import 'package:getx_appfilmes/modules/movies/movies_page.dart';
import 'package:flutter/material.dart';
import 'package:getx_appfilmes/app/ui/theme_extensions.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Navigator(
        initialRoute: '/movies',
        key: Get.nestedKey(HomeController.NAVIGATOR_KEY),
        onGenerateRoute: (settings) {
          if (settings.name == '/movies') {
            return GetPageRoute(
                settings: settings,
                page: () => const MoviesPage(),
                binding: MoviesBindings());
          }
          if (settings.name == '/favorites') {
            return GetPageRoute(
                settings: settings,
                page: () => FavoritesPage(),
                binding: FavoriesBindings());
          }
          return null;
        },
      ),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          selectedItemColor: context.themeRed,
          unselectedItemColor: Colors.grey,
          onTap: controller.goToPage,
          currentIndex: controller.pageIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.movie), label: 'Filmes'),
            BottomNavigationBarItem(
                icon: Icon(FilmeAppIcons.heart_empty), label: 'Favoritos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.logout_outlined), label: 'Sair'),
          ],
        );
      }),
      bottomSheet: Text(
        'JB Silva',
        style: TextStyle(
          color: context.themeBlack,
          fontSize: 10,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
