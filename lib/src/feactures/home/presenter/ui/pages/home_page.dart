import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/home/presenter/controller/home_controller.dart';
import 'package:app_receitas/src/feactures/onboarding/presenter/ui/pages/onboarding_page.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/container_profile_image.dart';
import 'package:app_receitas/src/feactures/recipes/presenter/ui/pages/create_recipe_page.dart';
import 'package:app_receitas/src/feactures/search/presenter/ui/pages/search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_manager/manager_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ManagerPage<HomeController, HomePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        ct.verifyOnboading().then((value) =>
            value ? Navigator.pushNamed(context, OnBoardingPage.route) : null);
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CookiePage(
      state: ct.state,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, CreateRecipePage.route);
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        child: SvgPicture.asset('assets/icons/edit.svg'),
      ),
      done: () => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CookieText(
                          text: 'Olá, ${Global.profile?.name}',
                          maxLine: 1,
                          overflow: TextOverflow.ellipsis,
                          typography: CookieTypography.title,
                        ),
                        const CookieText(
                          text: 'O que vamos cozinhar hoje ?',
                        ),
                      ],
                    ),
                  ),
                  const ContainerProfileImage(),
                ],
              ),
              const SizedBox(height: 20),
              CookieTextFieldSearch(
                hintText: 'Procure algo para cozinhar',
                onTap: () {
                  Navigator.pushNamed(context, SearchPage.route);
                },
              ),
              const SizedBox(height: 20),
              const CookieText(
                text: 'Últimas receitas postadas',
                typography: CookieTypography.title,
              ),
              const SizedBox(height: 10),
              MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: ct.recipes.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        Global.imageRecipeDefault,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

                  //       const CookieText(
                  //         text: 'Se liga nessas receitas em alta',
                  //         typography: CookieTypography.title,
                  //       ),
                  //       const SizedBox(height: 20),
                  //       const CookieText(
                  //         text: 'Receitas rápidas para seu dia-dia corrido',
                  //         typography: CookieTypography.title,
                  //       ),
                  //       const SizedBox(height: 10),
                  //       SizedBox(
                  //         width: 200,
                  //         child: Stack(
                  //           alignment: Alignment.topCenter,
                  //           children: [
                  //             Container(
                  //               margin: const EdgeInsets.only(top: 70),
                  //               padding: const EdgeInsets.all(16),
                  //               height: 180,
                  //               width: 200,
                  //               decoration: BoxDecoration(
                  //                 color: Colors.white,
                  //                 borderRadius: BorderRadius.circular(10),
                  //               ),
                  //               child: Column(
                  //                 mainAxisAlignment: MainAxisAlignment.end,
                  //                 children: [
                  //                   CookieText(
                  //                     text: 'Salada de legumes',
                  //                     color:
                  //                         Theme.of(context).colorScheme.onSecondary,
                  //                   ),
                  //                   const Row(
                  //                     children: [],
                  //                   ),
                  //                 ],
                  //               ),
                  //             ),
                  //             Image.network(
                  //               'https://www.omachoalpha.com.br/wp-content/uploads/2017/07/food-17.jpg',
                  //               height: 140,
                  //               width: 140,
                  //             ),
                  //           ],
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  // SliverToBoxAdapter(
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       const CookieText(
                  //         text: 'Ingredientes mais procurados',
                  //         typography: CookieTypography.title,
                  //       ),
                  //       const SizedBox(height: 20),
                  //       Container(
                  //         height: 100,
                  //         width: 100,
                  //         padding: const EdgeInsets.all(16),
                  //         margin: const EdgeInsets.only(
                  //           right: 10,
                  //         ),
                  //         decoration: BoxDecoration(
                  //           color: Colors.black,
                  //           borderRadius: BorderRadius.circular(50),
                  //         ),
                  //         child: Image.network(
                  //           'https://th.bing.com/th/id/R.e0fc37fb962b12449228c61b1966c305?rik=XRVOAwQCZME0%2fw&pid=ImgRaw&r=0',
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // )