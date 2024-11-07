import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:flutter/material.dart';

class CookiePageError extends StatelessWidget {
  const CookiePageError({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            Center(
              child: const CookieText(
                text: '404',
                typography: CookieTypography.title,
              ),
            ),
            const CookieText(
                text: 'Alguma coisa deu errado, mas não se preocupe.'),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
