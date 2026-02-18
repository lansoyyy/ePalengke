import 'package:flutter/material.dart';

/// App Colors for ePalengke
/// Contains all color constants used throughout the application
class AppColors {
  AppColors._();

  // Transparent Color
  static const Color transparent = Colors.transparent;

  // Primary Colors
  static const Color primary = Color(0xFF00AA4F);
  static const Color primaryDark = Color(0xFF008840);
  static const Color primaryLight = Color(0xFF33CC7A);

  // Secondary Colors
  static const Color secondary = Color(0xFFFF6B35);
  static const Color secondaryDark = Color(0xFFE55A2B);
  static const Color secondaryLight = Color(0xFFFF8C5C);

  // Accent Colors
  static const Color accent = Color(0xFFFFD700);
  static const Color accentDark = Color(0xFFE6C200);
  static const Color accentLight = Color(0xFFFFE066);

  // Neutral Colors
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

  // Semantic Colors
  static const Color success = Color(0xFF10B981);
  static const Color successLight = Color(0xFFD1FAE5);
  static const Color warning = Color(0xFFF59E0B);
  static const Color warningLight = Color(0xFFFEF3C7);
  static const Color error = Color(0xFFEF4444);
  static const Color errorLight = Color(0xFFFEE2E2);
  static const Color info = Color(0xFF3B82F6);
  static const Color infoLight = Color(0xFFDBEAFE);

  // Background Colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundDark = Color(0xFFF5F5F5);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceDark = Color(0xFFF8F9FA);

  // Text Colors
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textDisabled = Color(0xFFD1D5DB);
  static const Color textInverse = Color(0xFFFFFFFF);

  // Border Colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderDark = Color(0xFFD1D5DB);
  static const Color divider = Color(0xFFE5E7EB);

  // Shadow Colors
  static const Color shadow = Color(0x1A000000);
  static const Color shadowLight = Color(0x0D000000);
  static const Color shadowMedium = Color(0x1A000000);
  static const Color shadowDark = Color(0x33000000);

  // Overlay Colors
  static const Color overlay = Color(0x80000000);
  static const Color overlayLight = Color(0x40000000);

  // Gradient Colors
  static const List<Color> primaryGradient = [primary, primaryLight];

  static const List<Color> secondaryGradient = [secondary, secondaryLight];

  // Card Colors
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color cardBackgroundDark = Color(0xFFF8F9FA);

  // Input Colors
  static const Color inputBackground = Color(0xFFF9FAFB);
  static const Color inputBorder = Color(0xFFE5E7EB);
  static const Color inputBorderFocused = Color(0xFF00AA4F);
  static const Color inputBorderError = Color(0xFFEF4444);

  // Button Colors
  static const Color buttonPrimary = Color(0xFF00AA4F);
  static const Color buttonPrimaryHover = Color(0xFF008840);
  static const Color buttonSecondary = Color(0xFFFFFFFF);
  static const Color buttonSecondaryHover = Color(0xFFF3F4F6);
  static const Color buttonDisabled = Color(0xFFD1D5DB);
  static const Color buttonText = Color(0xFFFFFFFF);
  static const Color buttonTextSecondary = Color(0xFF111827);

  // Navigation Colors
  static const Color navBarBackground = Color(0xFFFFFFFF);
  static const Color navBarBorder = Color(0xFFE5E7EB);
  static const Color navBarActive = Color(0xFF00AA4F);
  static const Color navBarInactive = Color(0xFF9CA3AF);

  // Chip Colors
  static const Color chipBackground = Color(0xFFF3F4F6);
  static const Color chipText = Color(0xFF374151);
  static const Color chipSelectedBackground = Color(0xFF00AA4F);
  static const Color chipSelectedText = Color(0xFFFFFFFF);

  // Rating Colors
  static const Color starActive = Color(0xFFFFD700);
  static const Color starInactive = Color(0xFFD1D5DB);

  // Price Colors
  static const Color price = Color(0xFF00AA4F);
  static const Color priceDiscount = Color(0xFFEF4444);
  static const Color priceOriginal = Color(0xFF9CA3AF);
}
