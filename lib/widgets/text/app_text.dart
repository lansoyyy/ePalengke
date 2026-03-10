import 'package:flutter/material.dart';
import '../../core/theme/app_text_styles.dart';

/// Base App Text Widget
/// A customizable text widget that uses the app's default font family
class AppText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool softWrap;
  final StrutStyle? strutStyle;
  final TextDirection? textDirection;
  final Locale? locale;
  final bool? semanticsLabel;
  final TextWidthBasis? textWidthBasis;
  final TextHeightBehavior? textHeightBehavior;
  final Color? color;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double? letterSpacing;
  final double? wordSpacing;
  final double? height;
  final TextDecoration? decoration;
  final TextDecorationStyle? decorationStyle;
  final Color? decorationColor;
  final double? decorationThickness;
  final FontStyle? fontStyle;

  const AppText(
    this.text, {
    super.key,
    this.style,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap = true,
    this.strutStyle,
    this.textDirection,
    this.locale,
    this.semanticsLabel,
    this.textWidthBasis,
    this.textHeightBehavior,
    this.color,
    this.fontWeight,
    this.fontSize,
    this.letterSpacing,
    this.wordSpacing,
    this.height,
    this.decoration,
    this.decorationStyle,
    this.decorationColor,
    this.decorationThickness,
    this.fontStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: _buildStyle(),
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      softWrap: softWrap,
      strutStyle: strutStyle,
      textDirection: textDirection,
      locale: locale,
      textWidthBasis: textWidthBasis,
      textHeightBehavior: textHeightBehavior,
    );
  }

  TextStyle _buildStyle() {
    TextStyle baseStyle = style ?? AppTextStyles.bodyMedium;

    // Apply custom overrides
    if (color != null) {
      baseStyle = baseStyle.copyWith(color: color);
    }
    if (fontWeight != null) {
      baseStyle = baseStyle.copyWith(fontWeight: fontWeight);
    }
    if (fontSize != null) {
      baseStyle = baseStyle.copyWith(fontSize: fontSize);
    }
    if (letterSpacing != null) {
      baseStyle = baseStyle.copyWith(letterSpacing: letterSpacing);
    }
    if (wordSpacing != null) {
      baseStyle = baseStyle.copyWith(wordSpacing: wordSpacing);
    }
    if (height != null) {
      baseStyle = baseStyle.copyWith(height: height);
    }
    if (decoration != null) {
      baseStyle = baseStyle.copyWith(decoration: decoration);
    }
    if (decorationStyle != null) {
      baseStyle = baseStyle.copyWith(decorationStyle: decorationStyle);
    }
    if (decorationColor != null) {
      baseStyle = baseStyle.copyWith(decorationColor: decorationColor);
    }
    if (decorationThickness != null) {
      baseStyle = baseStyle.copyWith(decorationThickness: decorationThickness);
    }
    if (fontStyle != null) {
      baseStyle = baseStyle.copyWith(fontStyle: fontStyle);
    }

    return baseStyle;
  }
}

/// Display Large Text
class DisplayLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const DisplayLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.displayLarge, color!)
          : AppTextStyles.displayLarge,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Display Medium Text
class DisplayMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const DisplayMedium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.displayMedium, color!)
          : AppTextStyles.displayMedium,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Display Small Text
class DisplaySmall extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const DisplaySmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.displaySmall, color!)
          : AppTextStyles.displaySmall,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Headline Large Text
class HeadlineLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const HeadlineLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.headlineLarge, color!)
          : AppTextStyles.headlineLarge,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Headline Medium Text
class HeadlineMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const HeadlineMedium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.headlineMedium, color!)
          : AppTextStyles.headlineMedium,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Headline Small Text
class HeadlineSmall extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const HeadlineSmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.headlineSmall, color!)
          : AppTextStyles.headlineSmall,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Title Large Text
class TitleLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const TitleLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.titleLarge, color!)
          : AppTextStyles.titleLarge,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Title Medium Text
class TitleMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const TitleMedium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.titleMedium, color!)
          : AppTextStyles.titleMedium,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Title Small Text
class TitleSmall extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const TitleSmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.titleSmall, color!)
          : AppTextStyles.titleSmall,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Body Large Text
class BodyLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? bold;

  const BodyLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.bold,
  });

  @override
  Widget build(BuildContext context) {
    final style = bold == true
        ? AppTextStyles.bodyLargeBold
        : AppTextStyles.bodyLarge;
    return AppText(
      text,
      style: color != null ? AppTextStyles.withColor(style, color!) : style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Body Medium Text
class BodyMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? bold;

  const BodyMedium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.bold,
  });

  @override
  Widget build(BuildContext context) {
    final style = bold == true
        ? AppTextStyles.bodyMediumBold
        : AppTextStyles.bodyMedium;
    return AppText(
      text,
      style: color != null ? AppTextStyles.withColor(style, color!) : style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Body Small Text
class BodySmall extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool? bold;

  const BodySmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.bold,
  });

  @override
  Widget build(BuildContext context) {
    final style = bold == true
        ? AppTextStyles.bodySmallBold
        : AppTextStyles.bodySmall;
    return AppText(
      text,
      style: color != null ? AppTextStyles.withColor(style, color!) : style,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Label Large Text
class LabelLarge extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const LabelLarge(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.labelLarge, color!)
          : AppTextStyles.labelLarge,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Label Medium Text
class LabelMedium extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const LabelMedium(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.labelMedium, color!)
          : AppTextStyles.labelMedium,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Label Small Text
class LabelSmall extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const LabelSmall(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.labelSmall, color!)
          : AppTextStyles.labelSmall,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Caption Text
class Caption extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const Caption(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.caption, color!)
          : AppTextStyles.caption,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}

/// Overline Text
class Overline extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;

  const Overline(
    this.text, {
    super.key,
    this.color,
    this.textAlign,
    this.maxLines,
    this.overflow,
  });

  @override
  Widget build(BuildContext context) {
    return AppText(
      text,
      style: color != null
          ? AppTextStyles.withColor(AppTextStyles.overline, color!)
          : AppTextStyles.overline,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
    );
  }
}
