import 'package:getx_appfilmes/app/ui/loader/loader_mixin.dart';
import 'package:getx_appfilmes/app/ui/messages/messages_mixin.dart';
import 'package:getx_appfilmes/services/login/login_service.dart';
import 'package:get/get.dart';

class LoginController extends GetxController with LoaderMixin, MessagesMixin {
  final loading = false.obs;
  final message = Rxn<MessageModel>();
  final LoginService _loginService;
  LoginController({required LoginService loginService})
      : _loginService = loginService;

  @override
  void onInit() {
    loaderListener(loading);
    messageListener(message);
    super.onInit();
  }

  void login() async {
    try {
      loading.value = true;
      await _loginService.login();
      loading.value = false;
      message.value = MessageModel.info(
          title: 'Status', message: 'Login efetuado com sucesso');
    } on Exception catch (e, s) {
      print(e);
      print(s);
      loading.value = false;
      message.value = MessageModel.error(
          title: 'Status', message: 'Erro ao realizar login');
    }
  }
}
