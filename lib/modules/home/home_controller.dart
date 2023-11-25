import 'package:get/get.dart';

import '../../services/login/login_service.dart';

class HomeController extends GetxController {
  static const NAVIGATOR_KEY = 1;
  static const INDEX_PAGE_EXIT = 2;
  final LoginService _loginService;
  HomeController({
    required LoginService loginService,
  }) : _loginService = loginService;

  final _pages = ['/movies', '/favorites'];
  final _pageIndex = 0.obs;

  int get pageIndex => _pageIndex.value;

  void goToPage(int page) {
    _pageIndex.value = page;

    switch (page) {
      case INDEX_PAGE_EXIT:
        _loginService.logout();
        break;
      default:
        Get.offNamed(_pages[page], id: NAVIGATOR_KEY);
        break;
    }
  }
}
