import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/view_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/view_details_recipe.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/view_introduce_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:page_manager/export_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewRecipesPage extends StatefulWidget {
  static const route = '/view-recipe';
  const ViewRecipesPage({super.key});

  @override
  State<ViewRecipesPage> createState() => _ViewRecipesPageState();
}

class _ViewRecipesPageState
    extends ManagerPage<ViewRecipeController, ViewRecipesPage> {
  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      appBar: AppBar(
        surfaceTintColor: Theme.of(context).colorScheme.surface,
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: CookieButton(
          label: AppLocalizations.of(context)!.recipeDifficultyBack,
        ).back(context),
        backgroundColor: Theme.of(context).colorScheme.surface,
      ),
      // bottomNavigationBar: Padding(
      //   padding: const EdgeInsets.all(10),
      //   child: CookieButton(
      //     label: 'Preparar esta receita',
      //     onPressed: () {},
      //   ),
      // ),
      done: () => SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(height: 10),
            FlutterCarousel(
                options: FlutterCarouselOptions(
                  height: 250,
                  showIndicator: true,
                  autoPlay: true,
                  viewportFraction: 1,
                  autoPlayAnimationDuration: const Duration(milliseconds: 500),
                  padEnds: false,
                ),
                items: ct.images
                    .map((e) => Image.network(e.link, fit: BoxFit.cover))
                    .toList()),
            const SizedBox(height: 10),
            ViewIntroduceRecipe(
              title: ct.recipe.title,
              difficultyRecipe: ct.recipe.difficultyRecipe.name,
              portion: ct.recipe.portion,
              subTitle: ct.recipe.subTitle,
              timePrepared: ct.recipe.timePrepared,
              isCreate: ct.recipe.userId == Global.user!.id,
            ),
            const SizedBox(height: 20),
            ViewDetailsRecipe(
              details: ct.recipe.details!,
              ingredients: ct.ingredients,
              serveFood: ct.recipe.serveFood!,
              instruction: ct.recipe.instruction,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
