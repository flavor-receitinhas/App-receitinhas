import 'package:app_receitas/src/feactures/onboarding/domain/enums/difficulty_recipe_enum.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';

class RecipeMapper {
  Map<String, dynamic> toMap(RecipeEntity entity) {
    return <String, dynamic>{
      'title': entity.title,
      'subTitle': entity.subTitle,
      'images': entity.images,
      'details': entity.details,
      'timePrepared': entity.timePrepared,
      'difficultyRecipe': entity.difficultyRecipe.name,
      'portion': entity.portion,
      'ingredients': entity.ingredients,
      'instruction': entity.instruction,
      'serveFood': entity.serveFood,
      'thumb': entity.thumb,
    };
  }

  RecipeEntity fromMap(Map<String, dynamic> map) {
    return RecipeEntity(
      id: map['id'] as String,
      title: map['title'] as String,
      subTitle: map['subTitle'] as String?,
      images: (map['images'] as List).map((e) => e.toString()).toList(),
      details: map['details'] as String?,
      timePrepared: map['timePrepared'] as int,
      difficultyRecipe: DifficultyRecipe.values.firstWhere(
        (e) => e.toString().split('.').last == map['difficultyRecipe'],
      ),
      portion: map['portion'] as int,
      ingredients:
          (map['ingredients'] as List).map((e) => e.toString()).toList(),
      instruction: map['instruction'],
      serveFood: map['serveFood'] as String?,
      thumb: map['thumb'] as String,
    );
  }
}
