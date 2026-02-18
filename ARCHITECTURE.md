# ePalengke - Project Architecture

## Overview
ePalengke is a Flutter application for online shopping of fresh produce. This document outlines the project structure and architecture.

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── core/                     # Core utilities and configurations
│   ├── constants/           # App constants
│   │   └── app_constants.dart
│   ├── theme/               # App theme, colors, and text styles
│   │   ├── app_colors.dart
│   │   ├── app_text_styles.dart
│   │   ├── app_theme.dart
│   │   └── theme.dart       # Barrel export
│   ├── utils/               # Utility files
│   │   └── app_assets.dart
│   └── core.dart            # Barrel export for core
├── widgets/                 # Custom widgets
│   ├── text/               # Text widgets
│   │   ├── app_text.dart   # Base text widget and variants
│   │   ├── price_text.dart # Price display widgets
│   │   ├── app_bar_title.dart
│   │   ├── card_text.dart
│   │   └── text_widgets.dart # Barrel export
│   └── widgets.dart        # Barrel export for widgets
└── (screens will be added later)

assets/
├── fonts/                  # Custom fonts
│   ├── Poppins-*.ttf
│   └── Inter-*.ttf
├── images/                 # Images
│   ├── logo.png
│   └── (other images)
└── icons/                  # Icons
    └── (SVG icons)
```

## Theme System

### Colors (`app_colors.dart`)
- Primary Colors: Green (#00AA4F) as the main brand color
- Secondary Colors: Orange (#FF6B35) for accents
- Semantic Colors: Success, Warning, Error, Info
- Neutral Colors: Gray scale palette
- Special Colors: Price, Rating, Navigation, etc.

### Text Styles (`app_text_styles.dart`)
- Font Families: Poppins (headings), Inter (body)
- Material Design 3 text styles:
  - Display (Large, Medium, Small)
  - Headline (Large, Medium, Small)
  - Title (Large, Medium, Small)
  - Body (Large, Medium, Small)
  - Label (Large, Medium, Small)
- Custom styles: Price, Card, Navigation, Chip, Input, etc.

### App Theme (`app_theme.dart`)
- Light and Dark theme support
- Material Design 3 implementation
- Custom widget themes: Card, Button, Input, Dialog, etc.

## Text Widgets

### Base Text Widget (`AppText`)
- Customizable text widget with app font family
- Supports all text styling options

### Pre-built Text Widgets
- **Display Text**: `DisplayLarge`, `DisplayMedium`, `DisplaySmall`
- **Headline Text**: `HeadlineLarge`, `HeadlineMedium`, `HeadlineSmall`
- **Title Text**: `TitleLarge`, `TitleMedium`, `TitleSmall`
- **Body Text**: `BodyLarge`, `BodyMedium`, `BodySmall` (with bold option)
- **Label Text**: `LabelLarge`, `LabelMedium`, `LabelSmall`
- **Special Text**: `Caption`, `Overline`
- **Price Text**: `PriceText`, `SimplePriceText`, `DiscountText`
- **UI Text**: `AppBarTitle`, `CardTitle`, `CardSubtitle`

## Constants (`app_constants.dart`)
- App info (name, version, description)
- API configuration
- Storage keys
- Pagination settings
- Animation durations
- Spacing, border radius, icon sizes
- Validation patterns and messages
- Categories, sort options, filter options
- Payment methods, order status
- Social links and support info

## Assets (`app_assets.dart`)
- Centralized asset path constants
- Images (logo, placeholders, onboarding, empty states)
- Icons (navigation, category, payment, social)
- Easy to reference assets throughout the app

## Fonts

The app uses two font families:

1. **Poppins** - Primary font for headings and UI elements
   - Regular, Medium, SemiBold, Bold, ExtraBold
   - Italic variants for Medium, SemiBold, Bold

2. **Inter** - Secondary font for body text
   - Regular, Medium, SemiBold, Bold
   - Italic variants for Medium, SemiBold, Bold

## Usage Examples

### Using Text Widgets
```dart
import 'package:epalengke/widgets/widgets.dart';

// Display text
DisplayLarge('Welcome to ePalengke');

// Body text
BodyMedium('This is a sample text', bold: true);

// Price text
PriceText(99.99, originalPrice: 129.99, size: PriceSize.medium);

// Card text
CardTitle('Product Name');
CardSubtitle('Product description here');
```

### Using Theme
```dart
import 'package:epalengke/core/core.dart';

// Access colors
Container(color: AppColors.primary);

// Access text styles
Text('Hello', style: AppTextStyles.headlineMedium);
```

### Using Constants
```dart
import 'package:epalengke/core/core.dart';

// App info
Text(AppConstants.appName);

// Spacing
SizedBox(height: AppConstants.spacingM);
```

## Barrel Exports

Barrel files make importing easier by grouping related exports:

- `lib/core/core.dart` - Exports all core utilities
- `lib/core/theme/theme.dart` - Exports all theme files
- `lib/widgets/widgets.dart` - Exports all widgets
- `lib/widgets/text/text_widgets.dart` - Exports all text widgets

## Next Steps

The following features are planned for future implementation:

1. Screen implementations (Home, Product, Cart, Profile, etc.)
2. State management setup
3. API service layer
4. Data models
5. Repository pattern
6. Additional widgets (buttons, cards, inputs, etc.)
7. Animations and transitions

## Notes

- The app follows Material Design 3 guidelines
- All text widgets use custom fonts by default
- Theme supports both light and dark modes
- Asset paths are centralized for easy maintenance
- Constants are used throughout the app for consistency
