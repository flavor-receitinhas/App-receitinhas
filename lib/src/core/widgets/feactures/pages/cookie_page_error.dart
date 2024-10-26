import 'package:app_receitas/src/core/services/api/api_response.dart';
import 'package:app_receitas/src/core/widgets/cookie_export.dart';
import 'package:flutter/material.dart';

class CookiePageError extends StatelessWidget {
  final Exception? error;
  const CookiePageError({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CookieButton(label: 'Voltar').back(context),
            const Spacer(),
            const CookieText(
              text: '404',
              typography: CookieTypography.giga,
              color: Colors.yellow,
            ),
            const CookieText(
              text: 'Alguma coisa deu errado, mas não se preocupe.',
            ),
            SizedBox(height: 10),
            CookieTextButton(
              text: 'Tentar novamente',
              color: Colors.yellow,
              typography: CookieTypography.title,
              onPressed: () {},
            ),
            SizedBox(height: 30),
            CookieText(
              text: ApiResponseParser().handleMessage(error),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
