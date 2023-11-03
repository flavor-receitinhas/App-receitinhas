import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/favorite/presenter/ui/moleculs/container_recipe.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatelessWidget {
  static const route = '/favorite';
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CookieText(
                        text: 'Lista de Favoritos',
                        typography: CookieTypography.title,
                      ),
                      CookieText(text: 'Gerencie suas receitas favoritas'),
                    ],
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              const CookieTextFieldSearch(
                hintText: 'Pesquise sua receita favorita',
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CookieText(text: 'Organizar por'),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.menu),
                  )
                ],
              ),
              const ContainerRecipe(),
            ],
          ),
        ),
      ),
    );
  }
}
