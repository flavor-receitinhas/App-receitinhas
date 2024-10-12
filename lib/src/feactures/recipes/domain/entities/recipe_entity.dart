import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';

class RecipeEntity {
  final String? id;
  final String title;
  final String? subTitle;
  final String? details;
  final int timePrepared;
  final DifficultyRecipe difficultyRecipe;
  final int portion;
  final List<String> ingredients;
  final String instruction;
  final String? serveFood;

  RecipeEntity({
    this.id,
    required this.title,
    this.subTitle,
    this.details,
    required this.timePrepared,
    required this.difficultyRecipe,
    required this.portion,
    required this.ingredients,
    required this.instruction,
    this.serveFood,
  });
}
