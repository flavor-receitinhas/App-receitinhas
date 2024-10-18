import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_snack_bar.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/container_create_info.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/select_ingredients_page.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/validator/number_convert.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IngredientCreatePage extends StatefulWidget {
  final CreateRecipeController ct;
  const IngredientCreatePage({super.key, required this.ct});

  @override
  State<IngredientCreatePage> createState() => _IngredientCreatePageState();
}

class _IngredientCreatePageState extends State<IngredientCreatePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CookieButton(
        label: AppLocalizations.of(context)!.recipeDifficultyNext,
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        onPressed: () {
          if (widget.ct.listIngredientSelect.isEmpty) {
            CookieSnackBar(
              text: AppLocalizations.of(context)!.recipeAddAtLeastOneIngredient,
            ).show(context);
            return;
          }
          widget.ct.pageController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            CookieButton(
              label: AppLocalizations.of(context)!.recipeDifficultyBack,
              onPressed: () {
                widget.ct.pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            ).back(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  CookieText(
                    text: AppLocalizations.of(context)!.recipeIngredientsTitle,
                    typography: CookieTypography.title,
                  ),
                  const SizedBox(height: 20),
                  CookieText(
                    text: AppLocalizations.of(context)!
                        .recipeBasicInfoDescription,
                  ),
                  const SizedBox(height: 20),
                  ContainerCreateInfo(
                    title: AppLocalizations.of(context)!.recipeIngredientsTitle,
                    svg: IconsSvgEnum.carrot,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, SelectIngredientsPage.route,
                            arguments: {
                              'ingredients': widget.ct.listIngredientSelect,
                            }).then((value) {
                          setState(() {});
                        });
                      },
                      child: Column(
                        children: [
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: widget.ct.listIngredientSelect.length,
                            itemBuilder: (context, index) {
                              final ingredient =
                                  widget.ct.listIngredientSelect[index];
                              return Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CookieText(
                                      text: ingredient.ingredient.name,
                                      typography: CookieTypography.button,
                                    ),
                                    CookieText(
                                      text:
                                          '${formatDouble(ingredient.quantity)} ${ingredient.unit}',
                                      typography: CookieTypography.body,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const Center(
                            child: Icon(
                              Icons.add_circle_outline_rounded,
                              size: 34,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
