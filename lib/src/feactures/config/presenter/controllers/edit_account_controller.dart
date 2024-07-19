import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/services/api/api_error/api_error.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/entities/user_food_pref_entity.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/dietary_restriction_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/enums/proteins_enum.dart';
import 'package:app_receitas/src/feactures/onboarding/domain/repositories/user_omboarding_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class EditAccountController extends ManagerStore {
  final UserOmboardingRepository _onBoardingRepository;

  EditAccountController(this._onBoardingRepository);

  TextEditingController userNameController = TextEditingController();
  final List<Proteins> selectProteins = [];
  final List<DietaryRestrictions> selectRestriction = [];
  UserFoodPrefEntity? userPref;

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          userNameController.text = Global.profile?.name ?? '';
          await loadingOnBoardingPrefs();
        },
      );

  Future<String?> updateNameProfile() async {
    try {
      await _onBoardingRepository.updateUserName(
        userId: Global.user!.id,
        name: userNameController.text,
      );
      Global.profile?.name = userNameController.text;
    } catch (e) {
      if (e is ApiError) {
        return e.message;
      }
      rethrow;
    }
    return null;
  }

  Future<void> loadingOnBoardingPrefs() async {
    userPref = await _onBoardingRepository.getUserPref(userId: Global.user!.id);
    for (var e in userPref!.protein) {
      selectProteins.add(e);
    }
    for (var e in userPref!.dietaryRestriction) {
      selectRestriction.add(e);
    }
    notifyListeners();
  }

  Future<void> updateOnBoarding() async {
    await _onBoardingRepository.updateUserPref(
      user: UserFoodPrefEntity(
        userId: userPref!.userId,
        dietaryRestriction: selectRestriction,
        difficultyRecipe: userPref!.difficultyRecipe,
        protein: selectProteins,
      ),
    );
  }
}
