import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/ingredient_select_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/organisms/list_all_ingredients.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/organisms/list_select_ingredients.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/manager_page.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SelectIngredientsPage extends StatefulWidget {
  static const route = '/select-ingredients';
  const SelectIngredientsPage({super.key});

  @override
  State<SelectIngredientsPage> createState() => _SelectIngredientsPageState();
}

class _SelectIngredientsPageState
    extends ManagerPage<IngredientSelectController, SelectIngredientsPage> {
  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      // floatingActionButton: FloatingActionButton(
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(50),
      //   ),
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   onPressed: () {
      //     CookieSheetBottom(
      //       alignmentTitle: Alignment.center,
      //       title: CookieText(
      //         text: 'Não encontrou seu igrediente ?',
      //         typography: CookieTypography.title,
      //         color: Theme.of(context).colorScheme.onSecondary,
      //       ),
      //       body: Column(
      //         mainAxisAlignment: MainAxisAlignment.center,
      //         children: [
      //           CookieText(
      //             text: 'Digite ele no campo abaixo',
      //             color: Theme.of(context).colorScheme.onSecondary,
      //           ),
      //           const SizedBox(height: 10),
      //           const CookieTextField.outline(
      //             hintText: 'Digite o ingrediente',
      //           ),
      //           const SizedBox(height: 20),
      //           const CookieButton(label: 'Confirmar')
      //         ],
      //       ),
      //     ).show(context);
      //   },
      //   child: const Icon(Icons.question_mark_outlined),
      // ),
      done: () => SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CookieButton(
                    label: AppLocalizations.of(context)!.recipeDifficultyBack,
                    onPressed: () {
                      Navigator.pop(
                        context,
                        {'ingredients': ct.listIngredientSelect},
                      );
                    },
                  ).back(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        CookieText(
                          text: AppLocalizations.of(context)!
                              .recipeSelectIngredientsTitle,
                          typography: CookieTypography.title,
                        ),
                        const SizedBox(height: 10),
                        CookieTextFieldSearch(
                          hintText: AppLocalizations.of(context)!
                              .recipeSearchIngredientsHint,
                          controller: ct.ingredientController,
                          onEditingComplete: ct.refreshPage,
                        ),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverVisibility(
              visible: ct.listIngredientSelect.isNotEmpty,
              sliver: SliverPadding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                sliver: ListSelectIngredients(
                  ingredients: ct.listIngredientSelect,
                  deleteOnPressed: (ingredient) {
                    ct.deleteIngredientSelect(ingredient);
                  },
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
                child: CookieText(
                  text: AppLocalizations.of(context)!
                      .recipeChooseOtherIngredients,
                  typography: CookieTypography.button,
                ),
              ),
            ),
            ListAllIngredients(ct: ct),
          ],
        ),
      ),
    );
  }
}
