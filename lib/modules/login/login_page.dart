import 'package:getx_appfilmes/modules/login/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Stack(
          children: [
            Image.asset(
              'assets/images/background.png',
              width: Get.width,
              height: Get.height,
              fit: BoxFit.cover,
            ),
            Container(
              color: Colors.black45,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 80.0),
              child: Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    SizedBox(
                      width: Get.width * .9,
                      height: 42,
                      child: SignInButton(
                        Buttons.Google,
                        onPressed: () {
                          controller.login();
                        },
                        text: ' Entrar com Google',
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Center(
//         child: Container(
//             width: Get.width,
//             height: Get.height,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                   image: AssetImage('assets/images/background.png'),
//                   fit: BoxFit.cover),
//             ),
//             child: Image.asset('assets/images/logo.png')),
//       ),