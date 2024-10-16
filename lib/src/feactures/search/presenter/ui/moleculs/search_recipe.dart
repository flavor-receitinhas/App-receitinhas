import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field_search.dart';

import 'package:app_receitas/src/feactures/search/presenter/ui/pages/filter_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchRecipe extends StatelessWidget {
  const SearchRecipe({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: CookieTextFieldSearch(
                  hintText:
                      AppLocalizations.of(context)!.searchRecipeSearchHint,
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FilterPage(),
                    ),
                  );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: const CookieSvg(svg: IconsSvgEnum.menu),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              CookieTextButton(
                text: AppLocalizations.of(context)!.searchRecipeClearFilters,
                typography: CookieTypography.button,
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
