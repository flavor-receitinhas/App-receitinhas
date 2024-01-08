import 'package:app_receitas/src/core/global/global_variables.dart';
import 'package:app_receitas/src/core/widgets/cookie_text.dart';
import 'package:app_receitas/src/feactures/config/presenter/controllers/config_controller.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/moleculs/container_config.dart';
import 'package:app_receitas/src/feactures/config/presenter/ui/moleculs/leave_alert_dialog.dart';
import 'package:flutter/material.dart';

class ConfigPage extends StatefulWidget {
  static const route = 'config';
  const ConfigPage({super.key});

  @override
  State<ConfigPage> createState() => _ConfigPageState();
}

class _ConfigPageState extends State<ConfigPage> {
  final ConfigController ct = di();
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CookieText(
                        text: 'Configurações',
                        typography: CookieTypography.title,
                        color: theme.primary,
                      ),
                      const CookieText(
                        text: 'Personalize conforme sua preferência',
                      ),
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
              CookieText(
                text: 'Conta',
                typography: CookieTypography.button,
                color: theme.onPrimary.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              const ContainerConfig(
                icon: 'assets/icons/person.svg',
                text: 'Editar Conta',
                action: Icon(Icons.chevron_right),
              ),
              const SizedBox(height: 10),
              const ContainerConfig(
                icon: 'assets/icons/key.svg',
                text: 'Alterar senha',
                action: Icon(Icons.chevron_right),
              ),
              const SizedBox(height: 20),
              CookieText(
                text: 'Personalização',
                typography: CookieTypography.button,
                color: theme.onPrimary.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              ContainerConfig(
                icon: 'assets/icons/moon.svg',
                text: 'Modo notuno',
                action: SizedBox(
                  height: 20,
                  child: Transform.scale(
                    scale: 0.8,
                    child: Switch(
                      value: true,
                      onChanged: (value) {},
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              CookieText(
                text: 'Personalização',
                typography: CookieTypography.button,
                color: theme.onPrimary.withOpacity(0.5),
              ),
              const SizedBox(height: 10),
              const ContainerConfig(
                icon: 'assets/icons/eye.svg',
                text: 'Politicas de privacidade',
                action: Icon(Icons.chevron_right),
              ),
              const SizedBox(height: 10),
              const ContainerConfig(
                icon: 'assets/icons/document.svg',
                text: 'Termos e condições',
                action: Icon(Icons.chevron_right),
              ),
              const SizedBox(height: 10),
              const ContainerConfig(
                icon: 'assets/icons/persons.svg',
                text: 'Nossa equipe',
                action: Icon(Icons.chevron_right),
              ),
              const SizedBox(height: 10),
              ContainerConfig(
                icon: 'assets/icons/sing_out.svg',
                text: 'Sair da conta',
                textColor: const Color(0xffFF5757),
                action: const Icon(Icons.chevron_right),
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return LeaveAlertDialog(ct: ct);
                    },
                  );
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: CookieText(
                  text: 'Versão do Aplicativo',
                  color: theme.secondary,
                ),
              ),
              Center(
                child: CookieText(
                  text: '0.0.1',
                  color: theme.secondary,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
