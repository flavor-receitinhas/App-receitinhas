import 'package:app_receitas/src/core/widgets/feactures/cookie_button.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_field.dart';
import 'package:app_receitas/src/core/widgets/feactures/cookie_text_span.dart';
import 'package:app_receitas/src/feactures/auth/presenter/controllers/auth_controller.dart';
import 'package:app_receitas/src/feactures/auth/presenter/ui/organisms/custom_screen.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_manager/export_manager.dart';

class RegisterPage extends StatefulWidget {
  static const route = '/register';
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends ManagerPage<AuthController, RegisterPage> {
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    ct.onNavigation(
      (event) => Navigator.pushNamedAndRemoveUntil(
        context,
        event,
        (route) => false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return CustomScreen(
      iconAppBar: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back_ios_outlined),
      ),
      sideAppBar: MainAxisAlignment.start,
      image:
          'https://media.discordapp.net/attachments/1071892919633576117/1139752601982873670/image.png?width=550&height=475',
      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: formKey,
        child: Column(
          children: [
            CookieText(
              text: AppLocalizations.of(context)!.registerTitle,
              typography: CookieTypography.title,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            CookieTextField(
              hintText: AppLocalizations.of(context)!.registerEmail,
              controller: ct.emailController,
              prefixIcon: const Icon(Icons.person),
              validator: (value) {
                if (value != null && !EmailValidator.validate(value)) {
                  return AppLocalizations.of(context)!.registerValidatorEmail;
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            CookieTextField(
              hintText: AppLocalizations.of(context)!.registerPassword,
              controller: ct.passwordController,
              prefixIcon: const Icon(Icons.lock_outline_rounded),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return AppLocalizations.of(context)!
                      .registerValidatorPassword1;
                }
                if (value.length < 8) {
                  return AppLocalizations.of(context)!
                      .registerValidatorPassword2;
                }
                if (!RegExp(r'[A-Z]').hasMatch(value)) {
                  return AppLocalizations.of(context)!
                      .registerValidatorPassword3;
                }
                if (!RegExp(r'[a-z]').hasMatch(value)) {
                  return AppLocalizations.of(context)!
                      .registerValidatorPassword4;
                }
                if (!RegExp(r'[0-9]').hasMatch(value)) {
                  return AppLocalizations.of(context)!
                      .registerValidatorPassword5;
                }
                return null;
              },
            ),
            const SizedBox(height: 10),
            CookieButton(
              label: 'Google',
              onPressed: () async {
                await ct.loginGoogle();
              },
            ),
            const SizedBox(height: 10),
            RichText(
              textAlign: TextAlign.center,
              text: CookieTextSpan(
                children: [
                  CookieTextSpan(
                    text: AppLocalizations.of(context)!.registerTerms1,
                    color: color.onPrimary,
                  ),
                  CookieTextSpan(
                    text: AppLocalizations.of(context)!.registerTerms2,
                    color: color.primary,
                  ),
                  CookieTextSpan(
                    text: AppLocalizations.of(context)!.registerTerms3,
                    color: color.onPrimary,
                  ),
                  CookieTextSpan(
                    text: AppLocalizations.of(context)!.registerTerms4,
                    color: color.primary,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomBar: [
        CookieButton(
          margin: const EdgeInsets.symmetric(horizontal: 12),
          label: AppLocalizations.of(context)!.registerButton,
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              await ct.registerFirebase();
            }
          },
        ),
        const SizedBox(height: 5)
      ],
    );
  }
}
