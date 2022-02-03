import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:vakinha_burger_mobile/app/core/bindings/application_binding.dart';

import 'app/core/ui/vakinha_ui.dart';
import 'app/routes/vakinha_router.dart';

class VakinhaBurgerMainApp extends StatelessWidget {
  const VakinhaBurgerMainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBinding(),
      defaultTransition: Transition.leftToRight,
      title: 'Vakinha Burger',
      theme: VakinhaUi.theme,
      getPages: VakinhaRouter.routes(),
    );
  }
}
