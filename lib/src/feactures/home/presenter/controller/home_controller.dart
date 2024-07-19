import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_omboarding_repository.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:app_receitas/src/feactures/recipes/domain/entities/recipe_entity.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:page_manager/export_manager.dart';

class HomeController extends ManagerStore {
  final RecipeRepository _recipeRepository;
  final UserOmboardingRepository _userFoodPrefRepository;
  final ProfileRepository _profileRepository;

  HomeController(this._recipeRepository, this._userFoodPrefRepository,
      this._profileRepository);

  List<RecipeEntity> recipes = [];

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          await loadingProfile();
          recipes = await listRecipe();
        },
      );

  Future<List<RecipeEntity>> listRecipe() async {
    return await _recipeRepository.listRecipe();
  }

  Future<void> loadingProfile() async {
    Global.profile = await _profileRepository.getProfile(Global.user!.id);
    notifyListeners();
  }

  Future<bool> verifyOnboading() async {
    final result =
        await _userFoodPrefRepository.getUserPref(userId: Global.user!.id);
    if (result.dietaryRestriction.isEmpty) {
      return true;
    }
    if (result.difficultyRecipe.isEmpty) {
      return true;
    }
    if (result.protein.isEmpty) {
      return true;
    }
    return false;
  }
}
