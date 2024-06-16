import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/register_module.dart';
import 'package:app_receitas/src/feactures/recipes/domain/mappers/recipe_mapper.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository_imp.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/view_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/create_recipe_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:flutter/widgets.dart';

class RecipeModule extends RegisterModule {
  @override
  Map<String, Widget> routers = {
    ViewRecipesPage.route: const ViewRecipesPage(),
    CreateRecipePage.route: const CreateRecipePage(),
  };

  @override
  void inicialize() {
    //Mapper
    di.registerFactory(() => RecipeMapper());

    //Repository
    di.registerFactory<RecipeRepository>(
      () => RecipeRepositoryImp(
        di(),
        di(),
      ),
    );

    //Controller
    di.registerFactory<CreateRecipeController>(
      () => CreateRecipeController(
        di(),
      ),
    );
    di.registerFactory<ViewRecipeController>(
      () => ViewRecipeController(
        di(),
      ),
    );
  }
}
