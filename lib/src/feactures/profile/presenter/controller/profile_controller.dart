import 'package:app_receitas/src/feactures/profile/domain/dtos/profile_dto.dart';
import 'package:app_receitas/src/feactures/profile/domain/entities/profile_entity.dart';
import 'package:app_receitas/src/feactures/profile/domain/repositories/profile_repository.dart';
import 'package:app_receitas/src/feactures/recipes/domain/dtos/recipe_dto.dart';
import 'package:app_receitas/src/feactures/recipes/domain/repositories/recipe_repository.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class ProfileController extends ManagerStore {
  final ProfileRepository _repository;
  final RecipeRepository _recipeRepository;
  ProfileController(this._repository, this._recipeRepository);

  late ProfileEntity profile;
  String? id;
  List<RecipeDto> recipes = [];
  final ScrollController scrollController = ScrollController();
  int page = 0;
  final int limit = 25;
  bool hasMore = true;
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  @override
  void init(Map<String, dynamic> arguments) => handleTry(
        call: () async {
          if (arguments['profile'] is ProfileEntity) {
            profile = arguments['profile'] as ProfileEntity;
          }
          if (arguments['id'] is String) {
            id = arguments['id'] as String;
          }

          if (id != null) {
            profile = await getProfile(id!);
          }

          await getMoreRecipes();
          _setupScrollController();
        },
      );

  Future<ProfileEntity> getProfile(String id) async =>
      await _repository.getProfile(id);

  void _setupScrollController() {
    scrollController.addListener(() async {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          !isLoading) {
        await getMoreRecipes();
      }
    });
  }

  Future<List<RecipeDto>> getUserRecipes(int page) async {
    final result = await _recipeRepository.getUserRecipes(
      userID: profile.userId,
      page: page,
      search: searchController.text,
    );
    return result;
  }

  Future<void> getMoreRecipes() async {
    if (!hasMore || isLoading) return;

    isLoading = true;
    final result = await getUserRecipes(page);

    if (result.length < limit) {
      hasMore = false;
    } else {
      page++;
    }
    recipes.addAll(result);

    isLoading = false;
    notifyListeners();
  }

  Future<void> updateProfile(ProfileEntity profile) async {
    await _repository.updateProfile(
      userId: profile.userId,
      profileDto: ProfileDto(
        name: profile.name,
        biography: profile.biography,
      ),
    );
  }

  Future<void> refresh() => handleTry(
        call: () async {
          page = 0;
          hasMore = true;
          isLoading = false;
          recipes = [];
          await getMoreRecipes();
        },
      );
}
