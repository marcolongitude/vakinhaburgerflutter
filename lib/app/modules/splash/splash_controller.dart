import 'package:get/get.dart';
import 'package:vakinha_burger_mobile/app/core/services/auth_service.dart';

class SplashController extends GetxController {
  void checkedLogged() {
    Get.putAsync(() => AuthService().init());
  }
}
