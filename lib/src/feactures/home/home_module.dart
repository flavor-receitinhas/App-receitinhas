import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/home/presenter/controller/home_controller.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:flutter/widgets.dart';

class HomeModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    CustomBottomBar.route: const CustomBottomBar(),
  };

  @override
  void inicialize() {
    di.registerFactory<HomeController>(
      () => HomeController(
        di(),
        di(),
        di(),
      ),
    );
  }
}
