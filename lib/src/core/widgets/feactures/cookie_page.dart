import 'package:app_receitas/src/core/widgets/feactures/pages/cookie_page_error.dart';
import 'package:flutter/material.dart';
import 'package:page_manager/export_manager.dart';

class CookiePage extends StatelessWidget {
  final Widget Function() done;
  final StateManager state;
  final Widget Function()? loading;
  final Object? error;
  final PreferredSizeWidget? appBar;
  final Widget? floatingActionButton;
  const CookiePage({
    super.key,
    required this.state,
    required this.done,
    this.error,
    this.loading,
    this.appBar,
    this.floatingActionButton,
  });

  @override
  Widget build(BuildContext context) {
    return ManagerPageBuilder(
      state: state,
      error: error,
      floatingActionButton: floatingActionButton,
      appBar: appBar,
      pageDone: done,
      pageInitial: () => Center(
        child: loading != null ? loading!() : const CircularProgressIndicator(),
      ),
      pageError: (_) => const CookiePageError(),
      pageDisconnected: () => const CookiePageError(),
      pageLoading: () => Center(
        child: loading != null ? loading!() : const CircularProgressIndicator(),
      ),
      pageLoggedOut: () => const CookiePageError(),
      pageMaintenance: () => const CookiePageError(),
    );
  }
}
