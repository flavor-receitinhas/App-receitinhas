import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/image_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/enum/order_recipe_enum.dart';

abstract class RecipeRepository {
  Future<RecipeEntity> createRecipe(RecipeEntity recipe);
  Future<RecipeEntity> getRecipe(String id);
  Future<List<RecipeEntity>> getUserRecipes(String userID);
  Future<List<RecipeDto>> listRecipe({
    String? search,
    bool? isDesc,
    OrderRecipeEnum? orderBy,
    required int page,
    int? timePreparedTo,
    int? timePreparedFrom,
    int? portionTo,
    int? portionFrom,
     List<DifficultyRecipe>? difficultyRecipe,
  });
  Future<void> createImages(
      {required String recipeId, required String filePath});
  Future<void> deleteImages(String recipeId, String imageId);
  Future<void> createThumb(
      {required String recipeId, required String filePath});
  Future<void> deleteThumb(String recipeId, String thumbId);
  Future<List<ImageEntity>> getImages(String recipeId);
}
