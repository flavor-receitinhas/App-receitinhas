import 'package:app_receitas/src/core/global/assets_enum.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ViewIntroduceRecipe extends StatelessWidget {
  final String title;
  final String? subTitle;
  final int timePrepared;
  final int portion;
  final String difficultyRecipe;
  final bool isCreate;

  const ViewIntroduceRecipe({
    super.key,
    required this.title,
    required this.subTitle,
    required this.timePrepared,
    required this.portion,
    required this.difficultyRecipe,
    this.isCreate = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CookieText(
          text: title,
          typography: CookieTypography.title,
        ),
        const SizedBox(height: 20),
        subTitle!.isNotEmpty && subTitle != null
            ? CookieText(
                text: subTitle!,
              )
            : const SizedBox.shrink(),
        subTitle!.isNotEmpty && subTitle != null
            ? const SizedBox(height: 20)
            : const SizedBox.shrink(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomContainer(
              child: Row(
                children: [
                  Column(
                    children: [
                      const CookieSvg(svg: IconsSvgEnum.clock),
                      const SizedBox(height: 5),
                      CookieText(
                        text:
                            '$timePrepared ${AppLocalizations.of(context)!.recipeIntroduceTimePrepared}',
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      const CookieSvg(
                        svg: IconsSvgEnum.fire,
                      ),
                      const SizedBox(height: 5),
                      CookieText(text: difficultyRecipe)
                    ],
                  ),
                  const SizedBox(width: 16),
                  Column(
                    children: [
                      const CookieSvg(svg: IconsSvgEnum.pot),
                      const SizedBox(height: 5),
                      CookieText(
                        text: portion != 1
                            ? '$portion ${AppLocalizations.of(context)!.recipeIntroducePortionPlural}'
                            : '$portion ${AppLocalizations.of(context)!.recipeIntroducePortionSingular}',
                      )
                    ],
                  ),
                ],
              ),
            ),
            Visibility(
              visible: !isCreate,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    topLeft: Radius.circular(30),
                    bottomRight: Radius.circular(10),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite,
                    color: Theme.of(context).colorScheme.primary,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
