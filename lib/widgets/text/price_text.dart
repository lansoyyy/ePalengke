import 'package:flutter/material.dart';
import '../../core/theme/app_text_styles.dart';
import '../../core/theme/app_colors.dart';
import '../../core/constants/app_constants.dart';
import 'app_text.dart';

/// Price Text Widget
/// Displays price with currency symbol and optional discount
class PriceText extends StatelessWidget {
  final double price;
  final double? originalPrice;
  final PriceSize size;
  final Color? color;
  final TextAlign? textAlign;
  final bool showOriginalPrice;

  const PriceText(
    this.price, {
    super.key,
    this.originalPrice,
    this.size = PriceSize.medium,
    this.color,
    this.textAlign,
    this.showOriginalPrice = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: _getCrossAxisAlignment(textAlign),
      children: [
        _buildPriceText(),
        if (showOriginalPrice &&
            originalPrice != null &&
            originalPrice! > price) ...[
          const SizedBox(height: 4),
          _buildOriginalPriceText(),
        ],
      ],
    );
  }

  Widget _buildPriceText() {
    final formattedPrice =
        '${AppConstants.currencySymbol}${price.toStringAsFixed(AppConstants.decimalPlaces)}';
    final style = _getPriceStyle();

    return AppText(
      formattedPrice,
      style: color != null ? AppTextStyles.withColor(style, color!) : style,
      textAlign: textAlign,
    );
  }

  Widget _buildOriginalPriceText() {
    final formattedPrice =
        '${AppConstants.currencySymbol}${originalPrice!.toStringAsFixed(AppConstants.decimalPlaces)}';
    return AppText(
      formattedPrice,
      style: AppTextStyles.priceOriginal,
      textAlign: textAlign,
    );
  }

  TextStyle _getPriceStyle() {
    switch (size) {
      case PriceSize.small:
        return AppTextStyles.priceSmall;
      case PriceSize.medium:
        return AppTextStyles.priceMedium;
      case PriceSize.large:
        return AppTextStyles.priceLarge;
    }
  }

  CrossAxisAlignment _getCrossAxisAlignment(TextAlign? textAlign) {
    switch (textAlign) {
      case TextAlign.left:
        return CrossAxisAlignment.start;
      case TextAlign.right:
        return CrossAxisAlignment.end;
      case TextAlign.center:
        return CrossAxisAlignment.center;
      case TextAlign.justify:
        return CrossAxisAlignment.stretch;
      case TextAlign.start:
        return CrossAxisAlignment.start;
      case TextAlign.end:
        return CrossAxisAlignment.end;
      default:
        return CrossAxisAlignment.start;
    }
  }
}

/// Price Size Enum
enum PriceSize { small, medium, large }

/// Simple Price Text Widget
/// Displays just the price without original price
class SimplePriceText extends StatelessWidget {
  final double price;
  final PriceSize size;
  final Color? color;
  final TextAlign? textAlign;

  const SimplePriceText(
    this.price, {
    super.key,
    this.size = PriceSize.medium,
    this.color,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    final formattedPrice =
        '${AppConstants.currencySymbol}${price.toStringAsFixed(AppConstants.decimalPlaces)}';
    final style = _getPriceStyle();

    return AppText(
      formattedPrice,
      style: color != null ? AppTextStyles.withColor(style, color!) : style,
      textAlign: textAlign,
    );
  }

  TextStyle _getPriceStyle() {
    switch (size) {
      case PriceSize.small:
        return AppTextStyles.priceSmall;
      case PriceSize.medium:
        return AppTextStyles.priceMedium;
      case PriceSize.large:
        return AppTextStyles.priceLarge;
    }
  }
}

/// Discount Badge Text Widget
/// Displays discount percentage
class DiscountText extends StatelessWidget {
  final double discount;
  final DiscountSize size;
  final Color? color;

  const DiscountText(
    this.discount, {
    super.key,
    this.size = DiscountSize.small,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDiscount = '${discount.toStringAsFixed(0)}% OFF';
    final style = _getDiscountStyle();

    return AppText(
      formattedDiscount,
      style: color != null ? AppTextStyles.withColor(style, color!) : style,
    );
  }

  TextStyle _getDiscountStyle() {
    switch (size) {
      case DiscountSize.small:
        return AppTextStyles.labelSmall.copyWith(
          color: AppColors.priceDiscount,
          fontWeight: FontWeight.w600,
        );
      case DiscountSize.medium:
        return AppTextStyles.labelMedium.copyWith(
          color: AppColors.priceDiscount,
          fontWeight: FontWeight.w600,
        );
    }
  }
}

/// Discount Size Enum
enum DiscountSize { small, medium }
