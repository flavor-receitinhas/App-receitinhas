import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/container_ingredient.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ListSelectIngredients extends StatelessWidget {
  const ListSelectIngredients({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return SliverToBoxAdapter(
      child: DottedBorder(
        dashPattern: const [4, 5],
        borderPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 5,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        borderType: BorderType.RRect,
        radius: const Radius.circular(10),
        color: Theme.of(context).colorScheme.onPrimary,
        strokeWidth: 1,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CookieText(
              text: 'Ingredientes selecionados (1)',
              typography: CookieTypography.button,
            ),
            const SizedBox(height: 10),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return ContainerIngredient(
                  body: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CookieText(
                        text: 'Salada de Legumes ',
                        typography: CookieTypography.button,
                        maxLine: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      CookieText(
                        text: '2 unidades',
                      ),
                    ],
                  ),
                  icon: SvgPicture.asset(
                    'assets/icons/delete.svg',
                    colorFilter: ColorFilter.mode(
                      theme.onPrimary,
                      BlendMode.srcIn,
                    ),
                  ),
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
