import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/search/presenter/controller/research_controller.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/moleculs/recipe_search_container.dart';
import 'package:flutter/material.dart';

class ResultRecipes extends StatelessWidget {
  final ResearchController ct;
  const ResultRecipes({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: ct.recipes.isNotEmpty,
            child: CookieText(
              text: 'Resultados da pesquisa (${ct.recipes.length})',
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: ct.recipes.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, idx) {
              final recipe = ct.recipes[idx];
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: RecipeSearchContainer(
                    image: recipe.images.first,
                    title: recipe.title,
                    timePrepared: recipe.timePrepared),
              );
            },
          )
        ],
      ),
    );
  }
}
