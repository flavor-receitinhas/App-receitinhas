import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/global/icon_enum.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/controller/create_recipe_controller.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/atomic/container_create_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:google_fonts/google_fonts.dart';

class ServerDishPage extends StatefulWidget {
  final CreateRecipeController ct;
  const ServerDishPage({super.key, required this.ct});

  @override
  State<ServerDishPage> createState() => _ServerDishPageState();
}

class _ServerDishPageState extends State<ServerDishPage> {
  @override
  Widget build(BuildContext context) {
    final colorText = Theme.of(context).colorScheme.onPrimary;
    TextStyle baseStyle = GoogleFonts.lexendDeca(
      color: colorText,
    );

    // Personaliza os estilos padrão para usar o baseStyle
    DefaultStyles defaultStyles = DefaultStyles(
      paragraph: DefaultTextBlockStyle(
          baseStyle.copyWith(
            fontSize: 16,
          ),
          const HorizontalSpacing(0, 0),
          const VerticalSpacing(0, 0),
          const VerticalSpacing(0, 0),
          null),
      placeHolder: DefaultTextBlockStyle(
        baseStyle.copyWith(color: colorText.withOpacity(0.5), fontSize: 16),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      h1: DefaultTextBlockStyle(
        baseStyle.copyWith(fontSize: 34, fontWeight: FontWeight.bold),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      h2: DefaultTextBlockStyle(
        baseStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      h3: DefaultTextBlockStyle(
        baseStyle.copyWith(fontSize: 20, fontWeight: FontWeight.bold),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
      ),
      lists: DefaultListBlockStyle(
        baseStyle.copyWith(
          color: colorText,
          fontSize: 16,
        ),
        const HorizontalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        const VerticalSpacing(0, 0),
        null,
        null,
      ),
    );
    // print(QuillDeltaToHtmlConverter(
    //         widget.ct.quillServerController.document.toDelta().toJson())
    //     .convert());
    return Scaffold(
      bottomNavigationBar: CookieButton(
        label: 'Finalizar',
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        onPressed: () {
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
              label: 'Voltar',
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
                  const CookieText(
                    text: 'Hora de se servir!',
                    typography: CookieTypography.title,
                  ),
                  const SizedBox(height: 20),
                  const CookieText(
                    text:
                        'Escreva um consideração final dando alguma dica ou informação útil para quem estiver concluindo ou concluir a receita.',
                  ),
                  const SizedBox(height: 10),
                  QuillToolbar.simple(
                    configurations: QuillSimpleToolbarConfigurations(
                      buttonOptions: QuillSimpleToolbarButtonOptions(
                        selectHeaderStyleDropdownButton:
                            QuillToolbarSelectHeaderStyleDropdownButtonOptions(
                          textStyle: baseStyle,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      controller: widget.ct.quillServerController,
                      showAlignmentButtons: false,
                      showCodeBlock: false,
                      showDividers: false,
                      showFontFamily: false,
                      showFontSize: false,
                      showLink: false,
                      showColorButton: false,
                      showBackgroundColorButton: false,
                      showQuote: false,
                      showSubscript: false,
                      showSuperscript: false,
                      showListCheck: false,
                      showSearchButton: false,
                      showInlineCode: false,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    children: [
                      ContainerCreateInfo(
                        iconSvg: IconEnum.pan.path,
                        child: QuillEditor.basic(
                          configurations: QuillEditorConfigurations(
                            customStyles: defaultStyles,
                            controller: widget.ct.quillServerController,
                            minHeight: 200,
                            placeholder:
                                'Escreva em detalhes como servir o prato...',
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
