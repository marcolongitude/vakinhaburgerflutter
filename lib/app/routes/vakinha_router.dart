import 'package:get/get.dart';

import 'auth_routers.dart';
import 'splash_routers.dart';

class VakinhaRouter {
  static List<GetPage<dynamic>>? routes() {
    return [
      ...SplashRouters.routers,
      ...AuthRouters.routers,
    ];
  }
}
