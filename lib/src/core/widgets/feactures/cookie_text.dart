import 'package:flutter/material.dart';

enum CookieTypography {
  giga(45, true),
  title(22, true),
  button(14, true),
  body(14, false);

  final double size;
  final bool isBold;

  const CookieTypography(this.size, this.isBold);
}

class CookieText extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;
  final CookieTypography typography;
  final Color? color;
  final TextOverflow? overflow;
  final int? maxLine;
  const CookieText(
      {super.key,
      required this.text,
      this.typography = CookieTypography.body,
      this.color,
      this.textAlign,
      this.overflow,
      this.maxLine});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLine,
      style: TextStyle(
        fontSize: typography.size,
        fontWeight: typography.isBold ? FontWeight.bold : FontWeight.normal,
        color: color ?? Theme.of(context).colorScheme.onPrimary,
      ),
    );
  }
}
