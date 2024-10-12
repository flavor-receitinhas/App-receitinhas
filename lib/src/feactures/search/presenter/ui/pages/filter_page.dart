import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/atomic/container_filter.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/moleculs/custom_slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  final List<String> order = ['Popular', 'De A - Z', 'De Z - A'];
  final List<String> preference = ['Vegetariana', 'Vegana', 'Peixe', 'Carne'];
  final List<String> difficulty = ['Fácil', 'Moderada', 'Difícil'];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      bottomNavigationBar: CookieButton(
        label: AppLocalizations.of(context)!.searchRecipeApplyFilter,
        margin: const EdgeInsets.only(bottom: 10, left: 16, right: 16),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            children: [
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipeFilterBy,
                typography: CookieTypography.title,
                color: theme.primary,
              ),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipeOrderBy,
              ),
              const SizedBox(height: 10),
              Row(
                children: order
                    .map(
                      (e) => Expanded(
                        child: ContainerFilter(
                          text: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipePreparationTime,
                typography: CookieTypography.button,
              ),
              const CustomSlide(),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipeIngredients,
                typography: CookieTypography.button,
              ),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipePortions,
                typography: CookieTypography.button,
              ),
              const CustomSlide(),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipeFoodPreference,
                typography: CookieTypography.button,
              ),
              const SizedBox(height: 10),
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 50,
                ),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: preference.length,
                itemBuilder: (context, index) {
                  return ContainerFilter(
                    text: preference[index],
                  );
                },
              ),
              const SizedBox(height: 20),
              CookieText(
                text: AppLocalizations.of(context)!.searchRecipeDifficulty,
                typography: CookieTypography.button,
              ),
              const SizedBox(height: 10),
              Row(
                children: difficulty
                    .map(
                      (e) => Expanded(
                        child: ContainerFilter(
                          text: e,
                        ),
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
