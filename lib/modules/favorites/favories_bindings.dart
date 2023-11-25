import 'package:get/get.dart';
import 'favories_controller.dart';

class FavoriesBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(FavoriesController(authService: Get.find(), moviesServices: Get.find(),));
    }
}