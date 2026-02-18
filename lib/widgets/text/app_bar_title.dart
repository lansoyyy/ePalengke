import 'package:flutter/material.dart';
import '../../core/theme/app_text_styles.dart';
import 'app_text.dart';

/// App Bar Title Widget
/// A specialized text widget for app bar titles
class AppBarTitle extends StatelessWidget {
  final String title;
  final Color? color;
  final int? maxLines;
  final TextOverflow? overflow;

  const AppBarTitle(
    this.title, {
    super.key,
    this.color,
    this.maxLines = 1,
    this.overflow = TextOverflow.ellipsis,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      title,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.appBarTitle, color!)
          : AppTextStyles.appBarTitle,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
