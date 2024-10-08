import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:app_receitas/src/core/widgets/feactures/icon_enum.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/config_controller.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/atomic/introduce_config.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/moleculs/container_config.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/moleculs/leave_alert_dialog.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/about_team_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/changed_password_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/edit_account_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/privacy_policy_page.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/pages/term_page.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/manager_page.dart';

class ConfigPage extends StatefulWidget {
  static const route = 'config';
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends ManagerPage<ConfigController, ConfigPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return CookiePage(
      state: ct.state,
      done: () => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: ListView(
          children: [
            const IntroduceConfig(),
            const SizedBox(height: 20),
            CookieText(
              text: 'Conta',
              typography: CookieTypography.button,
              color: theme.onPrimary,
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconEnum.person.path,
              text: 'Editar Conta',
              action: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(context, EditAccountPage.route);
              },
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconEnum.key.path,
              text: 'Alterar senha',
              action: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ChangedPasswordPage.route,
                );
              },
            ),
            const SizedBox(height: 20),
            CookieText(
              text: 'Personalização',
              typography: CookieTypography.button,
              color: theme.onPrimary,
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconEnum.moon.path,
              text: 'Modo notuno',
              action: SizedBox(
                height: 20,
                child: Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    thumbIcon: WidgetStateProperty.all(
                      ct.darkTheme
                          ? const Icon(
                              Icons.light_mode,
                              color: Colors.white,
                            )
                          : const Icon(
                              Icons.dark_mode,
                              color: Colors.white,
                            ),
                    ),
                    activeColor: theme.primary,
                    value: ct.darkTheme,
                    onChanged: (value) {
                      ct.changeTheme();
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            CookieText(
              text: 'Personalização',
              typography: CookieTypography.button,
              color: theme.onPrimary,
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconEnum.eye.path,
              text: 'Politicas de privacidade',
              action: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  PrivacyPolicyPage.route,
                );
              },
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconEnum.document.path,
              text: 'Termos e condições',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  TermPage.route,
                );
              },
              action: const Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconEnum.persons.path,
              text: 'Nossa equipe',
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AboutTeamPage.route,
                );
              },
              action: const Icon(Icons.chevron_right),
            ),
            const SizedBox(height: 10),
            ContainerConfig(
              icon: IconEnum.logOut.path,
              text: 'Sair da conta',
              textColor: const Color(0xffFF5757),
              action: const Icon(Icons.chevron_right),
              onTap: () {
                LeaveAlertDialog(ct: ct).show(context);
              },
            ),
            const SizedBox(height: 20),
            Center(
              child: CookieText(
                text: 'Versão do Aplicativo',
                color: theme.onPrimary.withOpacity(0.5),
              ),
            ),
            Center(
              child: CookieText(
                text:
                    '${ct.packageInfo?.version} (${ct.packageInfo?.buildNumber})',
                color: theme.onPrimary.withOpacity(0.5),
              ),
            )
          ],
        ),
      ),
    );
  }
}
