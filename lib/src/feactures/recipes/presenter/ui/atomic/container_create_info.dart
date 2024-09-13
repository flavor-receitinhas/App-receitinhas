import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContainerCreateInfo extends StatelessWidget {
  final String? title;
  final String iconSvg;
  final Widget child;
  const ContainerCreateInfo(
      {super.key, this.title, required this.iconSvg, required this.child});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CookieText(
                text: title ?? '',
                typography: CookieTypography.button,
              ),
              SvgPicture.asset(
                iconSvg,
                colorFilter: ColorFilter.mode(
                  Theme.of(context).colorScheme.onPrimary,
                  BlendMode.srcIn,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          child
        ],
      ),
    );
  }
}
