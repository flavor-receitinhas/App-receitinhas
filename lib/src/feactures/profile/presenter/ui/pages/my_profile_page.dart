import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/global/image_profile_enum.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field_search.dart';
import 'package:app_receitas/src/feactures/profile/presenter/controller/profile_controller.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/appbar_profile.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/pages/edit_profile_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:page_manager/export_manager.dart';

class MyProfilePage extends StatefulWidget {
  static const route = '/my-perfil';
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState
    extends ManagerPage<ProfileController, MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CookiePage(
      state: ct.state,
      done: () => SafeArea(
        child: ListView(
          children: [
            const AppBarProfile(
              title: 'Seu perfil',
              subTitle: 'Aqui fica suas receitas publicadas',
            ),
            CookieButton(
              label: 'Voltar',
              onPressed: () {
                Global.profile = ct.profile;
                Navigator.pop(context);
              },
            ).back(context),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            CookieText(
                              text: ct.profile.name,
                              typography: CookieTypography.title,
                            ),
                            CookieText(
                              text: 'mestre-cuca',
                              color: theme.primary,
                              typography: CookieTypography.button,
                            ),
                            const SizedBox(height: 10),
                            CookieText(
                              text: ct.profile.biography,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      CircleAvatar(
                        radius: 45,
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        backgroundImage: ct.profile.image != null
                            ? NetworkImage(ct.profile.image!)
                            : AssetImage(ImageProfileEnum.avatar.path)
                                as ImageProvider,
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: CookieButton(
                          label: 'Editar perfil',
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              EditProfilePage.route,
                              arguments: {'profile' : ct.profile},
                            ).then((value) {
                              if (value == true) {
                                ct.getProfile(Global.user!.id);
                              }
                            });
                          },
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 20),
                  const CookieTextFieldSearch(
                    hintText: 'Pesquise sua receita favorita',
                  ),
                  const SizedBox(height: 20),
                  ct.recipes.isEmpty
                      ? const CookieText(
                          text: 'Você ainda não tem receitas publicadas...',
                          typography: CookieTypography.button,
                        )
                      : MasonryGridView.builder(
                          gridDelegate:
                              const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          mainAxisSpacing: 6,
                          crossAxisSpacing: 6,
                          itemCount: ct.recipes.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(2),
                              child: Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      Global.imageRecipeDefault,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: CookieText(
                                      text: ct.recipes[index].title,
                                      color: Colors.white,
                                      maxLine: 2,
                                      overflow: TextOverflow.ellipsis,
                                      typography: CookieTypography.button,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
