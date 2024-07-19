import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:page_manager/export_manager.dart';

class ProfileController extends ManagerStore {
  final ProfileRepository _repository;
  final RecipeRepository _recipeRepository;
  ProfileController(this._repository, this._recipeRepository);

  late ProfileEntity profile;
  List<RecipeEntity> recipes = [];

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          profile = arguments['profile'] as ProfileEntity;
          recipes = await getUserRecipes(profile.userID);
        },
      );

  Future<void> getProfile(String id) => handleTry(
        call: () async {
          profile = await _repository.getProfile(id);
        },
      );

  Future<List<RecipeEntity>> getUserRecipes(String userID) async {
    final result = await _recipeRepository.getUserRecipes(userID);
    return result;
  }

  Future<void> updateProfile(ProfileEntity profile) async {
    await _repository.updateProfile(profile);
  }
}
