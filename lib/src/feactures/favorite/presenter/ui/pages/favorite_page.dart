import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/favorite_entity.dart';
import 'package:app_receitas/src/feactures/favorite/domain/entities/order_enum.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/controllers/favorite_controller.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/moleculs/container_recipe.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/moleculs/organize_recipes.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/container_profile_image.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/view_recipe_page.dart';
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:page_manager/manager_page.dart';

class FavoritePage extends StatefulWidget {
  static const route = '/favorite';
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteController ct = di();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ct.addListener(() {
          setState(() {});
        });
        ct.init();
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      done: () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CookieText(
                          text: 'Lista de Favoritos',
                          typography: CookieTypography.title,
                        ),
                        CookieText(text: 'Gerencie suas receitas favoritas'),
                      ],
                    ),
                    ContainerProfileImage()
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    CookieTextFieldSearch(
                      hintText: 'Pesquise sua receita favorita',
                      controller: ct.favoriteController,
                      onEditingComplete: () {
                        ct.refreshPage();
                      },
                    ),
                    const SizedBox(height: 10),
                    OrganizeRecipes(
                      onTapRecent: () {
                        setState(() {
                          ct.order = OrderEnum.createdAtAsc;
                          ct.refreshPage();
                        });
                        Navigator.pop(context);
                      },
                      onTapOld: () {
                        setState(() {
                          ct.order = OrderEnum.createdAtDesc;
                          ct.refreshPage();
                        });
                        Navigator.pop(context);
                      },
                      onTapAsc: () {
                        setState(() {
                          ct.order = OrderEnum.nameAsc;
                          ct.refreshPage();
                        });
                        Navigator.pop(context);
                      },
                      onTapDesc: () async {
                        setState(() {
                          ct.order = OrderEnum.nameDesc;
                          ct.refreshPage();
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              PagedSliverList<int, FavoriteEntity>(
                pagingController: ct.pagingController,
                builderDelegate: PagedChildBuilderDelegate<FavoriteEntity>(
                    animateTransitions: true,
                    firstPageErrorIndicatorBuilder: (context) {
                      return const Center(
                        child: CookieText(
                          text: 'Erro ao carregar receitas',
                        ),
                      );
                    },
                    noItemsFoundIndicatorBuilder: (context) {
                      return const Center(
                        child: CookieText(
                          text: 'Nenhuma receita encontrada',
                        ),
                      );
                    },
                    newPageErrorIndicatorBuilder: (context) {
                      return const Center(
                        child: CookieText(
                          text: 'Erro ao carregar receitas',
                        ),
                      );
                    },
                    itemBuilder: (context, favorite, idx) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, ViewRecipesPage.route);
                          },
                          child: ContainerRecipe(
                            nameRecipe: favorite.name,
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
