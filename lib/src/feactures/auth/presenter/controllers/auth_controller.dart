import 'package:app_receitas/src/feactures/auth/domain/services/auth_serivce.dart';
import 'package:app_receitas/src/feactures/home/presenter/ui/pages/custom_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class AuthController extends ManagerStore {
  final AuthService _authService;

  AuthController(
    this._authService,
  );

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void init(Map<String, dynamic> arguments) {
    state = StateManager.done;
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  Future<void> registerFirebase() => handleTry(
        call: () async {
          await _authService.signUp(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );
          emitNavigation(CustomBottomBar.route);
        },
        showDialogError: true,
      );

  Future<void> loginFirebase() => handleTry(
        call: () async {
          await _authService.signIn(
            email: emailController.text.trim(),
            password: passwordController.text.trim(),
          );

          emitNavigation(CustomBottomBar.route);
        },
        showDialogError: true,
      );

  Future<void> forgetPassword() => handleTry(
        call: () async {
          await _authService.forgetPassword(
            email: emailController.text.trim(),
          );
        },
        showDialogError: true,
      );

  Future<void> loginGoogle() => handleTry(
        call: () async {
          await _authService.signInGoogle();
          emitNavigation(CustomBottomBar.route);
        },
      );
}
