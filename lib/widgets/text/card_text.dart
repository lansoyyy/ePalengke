import 'package:flutter/material.dart';
import '../../core/theme/app_text_styles.dart';
import 'app_text.dart';

/// Card Title Widget
/// A specialized text widget for card titles
class CardTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const CardTitle(
    this.title, {
    super.key,
    this.color,
    this.maxLines = 2,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.cardTitle, color!)
          : AppTextStyles.cardTitle,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}

/// Card Subtitle Widget
/// A specialized text widget for card subtitles
class CardSubtitle extends StatelessWidget {
  final String subtitle;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const CardSubtitle(
    this.subtitle, {
    super.key,
    this.color,
    this.maxLines = 3,
    this.overflow = TextOverflow.ellipsis,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      subtitle,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.cardSubtitle, color!)
          : AppTextStyles.cardSubtitle,
      maxLines: maxLines,
      overflow: overflow,
      textAlign: textAlign,
    );
  }
}
