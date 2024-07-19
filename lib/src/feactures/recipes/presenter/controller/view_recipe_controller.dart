import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:page_manager/export_manager.dart';

class ViewRecipeController extends ManagerStore {
  final RecipeRepository _recipeRepository;

  ViewRecipeController(this._recipeRepository);

  String id = '';
  late RecipeEntity recipe;

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          id = arguments['id'] as String;
          recipe = await getRecipe();
        },
      );

  Future<RecipeEntity> getRecipe() async {
    return await _recipeRepository.getRecipe(id);
  }
}
