import 'package:app_receitas/src/core/global/image_profile_enum.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_page.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_sheet_bottom.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_svg.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field.dart';
import 'package:app_receitas/src/core/global/icon_enum.dart';
import 'package:app_receitas/src/feactures/profile/presenter/controller/edit_profile_controller.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/atomic/appbar_profile.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/moleculs/back_sheet.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/moleculs/container_privacy.dart';
import 'package:app_receitas/src/feactures/profile/presenter/ui/moleculs/save_sheet.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EditProfilePage extends StatefulWidget {
  static const route = '/edit-perfil';
  const EditProfilePage({
    super.key,
  });

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState
    extends ManagerPage<EditProfileController, EditProfilePage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CookiePage(
      state: ct.state,
      floatingActionButton: FloatingActionButton(
        backgroundColor: theme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
        ),
        child: CookieSvg(path: IconEnum.save.path),
        onPressed: () {
          CookieSheetBottom(
            title: CookieText(
              text: AppLocalizations.of(context)!
                  .profileEditProfilePageSaveChanges,
              color: Theme.of(context).colorScheme.onSecondary,
              typography: CookieTypography.title,
            ),
            body: SaveSheet(ct: ct),
          ).show(context);
        },
      ),
      done: () => ListView(
        children: [
          AppBarProfile(
            title: AppLocalizations.of(context)!.profileEditProfilePageTitle,
            subTitle:
                AppLocalizations.of(context)!.profileEditProfilePageSubtitle,
          ),
          CookieButton(
            label: AppLocalizations.of(context)!.profileEditProfilePageBack,
            onPressed: () {
              CookieSheetBottom(
                title: CookieText(
                  text: AppLocalizations.of(context)!
                      .profileEditProfilePageConfirmExit,
                  color: Theme.of(context).colorScheme.onSecondary,
                  typography: CookieTypography.title,
                ),
                body: const BackSheet(),
              ).show(context);
            },
          ).back(context),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Builder(
                      builder: (context) {
                        if (ct.image != null && ct.image!.path.isNotEmpty) {
                          return CircleAvatar(
                            radius: 60,
                            backgroundImage: FileImage(ct.image!),
                          );
                        }
                        if (ct.profile?.image != null &&
                            ct.profile!.image!.isNotEmpty) {
                          return CircleAvatar(
                            radius: 60,
                            backgroundImage: NetworkImage(ct.profile!.image!),
                          );
                        }
                        return CircleAvatar(
                          radius: 60,
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          backgroundImage:
                              AssetImage(ImageProfileEnum.avatar.path),
                        );
                      },
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CookieButton(
                            label: AppLocalizations.of(context)!
                                .profileEditProfilePageChangeProfilePicture,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            onPressed: () {
                              setState(() {
                                ct.pickImageLogo();
                              });
                            },
                          ),
                          const SizedBox(height: 10),
                          CookieTextButton(
                            text: AppLocalizations.of(context)!
                                .profileEditProfilePageRemoveProfilePicture,
                            onPressed: () {
                              setState(() {
                                ct.removeImage();
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Center(
                  child: CookieText(
                    text: AppLocalizations.of(context)!
                        .profileEditProfilePageImageRequirement,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 20),
                CookieText(
                  text: AppLocalizations.of(context)!
                      .profileEditProfilePageTitleLabel,
                ),
                const SizedBox(height: 10),
                DropdownButtonFormField(
                  isExpanded: true,
                  dropdownColor: theme.secondary,
                  borderRadius: BorderRadius.circular(10),
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!
                        .profileEditProfilePageTitleHint,
                    hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context)
                              .colorScheme
                              .onPrimary
                              .withOpacity(0.4),
                        ),
                    filled: true,
                    fillColor: Theme.of(context).colorScheme.secondary,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide.none),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(),
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  items: const [
                    DropdownMenuItem(
                      value: 0,
                      child: CookieText(text: 'data'),
                    ),
                    DropdownMenuItem(
                      value: 1,
                      child: CookieText(text: 'data'),
                    ),
                    DropdownMenuItem(
                      value: 2,
                      child: CookieText(text: 'data'),
                    ),
                  ],
                  onChanged: (value) {},
                ),
                const SizedBox(height: 10),
                Center(
                  child: CookieText(
                    text: AppLocalizations.of(context)!
                        .profileEditProfilePageTitleDescription,
                    textAlign: TextAlign.center,
                    color: Theme.of(context)
                        .colorScheme
                        .onPrimary
                        .withOpacity(0.5),
                  ),
                ),
                const SizedBox(height: 20),
                CookieText(
                  text: AppLocalizations.of(context)!
                      .profileEditProfilePageAboutMe,
                ),
                const SizedBox(height: 10),
                CookieTextField.outline(
                  hintText: AppLocalizations.of(context)!
                      .profileEditProfilePageAboutMeHint,
                  maxLines: 6,
                  maxLength: 400,
                  controller: ct.biographyController,
                ),
                const SizedBox(height: 20),
                CookieText(
                  text: AppLocalizations.of(context)!
                      .profileEditProfilePagePrivacy,
                ),
                const SizedBox(height: 10),
                ContainerPrivacy(
                    text: AppLocalizations.of(context)!
                        .profileEditProfilePageHideFollowers),
                const SizedBox(height: 10),
                ContainerPrivacy(
                    text: AppLocalizations.of(context)!
                        .profileEditProfilePageHideLikes),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
