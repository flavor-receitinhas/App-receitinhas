import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/view_details_recipe.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/moleculs/view_introduce_recipe.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:vsc_quill_delta_to_html/vsc_quill_delta_to_html.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CreateViewRecipePage extends StatelessWidget {
  final CreateRecipeController ct;
  const CreateViewRecipePage({super.key, required this.ct});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CookieButton(
        label: AppLocalizations.of(context)!.recipeFinish,
        onPressed: () {
          ct.createRecipe();
        },
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            CookieButton(
              label: AppLocalizations.of(context)!.profileViewProfilePageBack,
              onPressed: () {
                ct.pageController.previousPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.ease,
                );
              },
            ).back(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  FlutterCarousel(
                      options: FlutterCarouselOptions(
                        height: 250,
                        showIndicator: true,
                        autoPlay: true,
                        viewportFraction: 1,
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 500),
                        padEnds: false,
                      ),
                      items: ct.listImagesRecipe
                          .map((e) => Image.file(e, fit: BoxFit.cover))
                          .toList()),
                  const SizedBox(height: 10),
                  ViewIntroduceRecipe(
                    isCreate: true,
                    title: ct.titleController.text,
                    difficultyRecipe: ct.difficultyRecipeString,
                    portion: ct.portion,
                    subTitle: ct.subTitleController.text,
                    timePrepared: ct.timePreparedRecipe.inMinutes,
                  ),
                  const SizedBox(height: 20),
                  ViewDetailsRecipe(
                    details: ct.detailsController.text,
                    ingredients: ct.listIngredientSelect,
                    instruction: QuillDeltaToHtmlConverter(ct
                            .quillInstructionController.document
                            .toDelta()
                            .toJson())
                        .convert(),
                    serveFood: ct.quillServerController.document
                            .toPlainText()
                            .trim()
                            .isEmpty
                        ? ''
                        : QuillDeltaToHtmlConverter(ct
                                .quillServerController.document
                                .toDelta()
                                .toJson())
                            .convert(),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
