/// App Constants for ePalengke
/// Contains all constant values used throughout the application
class AppConstants {
  AppConstants._();

  // App Info
  static const String appName = 'ePalengke';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Your online market for fresh produce';

  // API Constants
  static const String baseUrl = 'https://api.epalengke.com';
  static const String apiVersion = '/v1';
  static const String apiTimeout = '30000'; // 30 seconds

  // Storage Keys
  static const String keyAuthToken = 'auth_token';
  static const String keyRefreshToken = 'refresh_token';
  static const String keyUserId = 'user_id';
  static const String keyUserName = 'user_name';
  static const String keyUserEmail = 'user_email';
  static const String keyUserPhone = 'user_phone';
  static const String keyUserAddress = 'user_address';
  static const String keyOnboardingCompleted = 'onboarding_completed';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguage = 'language';
  static const String keyCartItems = 'cart_items';
  static const String keyFavorites = 'favorites';

  // Pagination
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // Animation Durations (in milliseconds)
  static const int durationShort = 150;
  static const int durationMedium = 300;
  static const int durationLong = 500;
  static const int durationExtraLong = 1000;

  // Debounce Times (in milliseconds)
  static const int debounceSearch = 500;
  static const int debounceInput = 300;

  // Spacing
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 16.0;
  static const double spacingL = 24.0;
  static const double spacingXL = 32.0;
  static const double spacingXXL = 48.0;

  // Border Radius
  static const double radiusXS = 4.0;
  static const double radiusS = 8.0;
  static const double radiusM = 12.0;
  static const double radiusL = 16.0;
  static const double radiusXL = 20.0;
  static const double radiusXXL = 24.0;
  static const double radiusFull = 999.0;

  // Icon Sizes
  static const double iconXS = 16.0;
  static const double iconS = 20.0;
  static const double iconM = 24.0;
  static const double iconL = 32.0;
  static const double iconXL = 48.0;
  static const double iconXXL = 64.0;

  // Image Sizes
  static const double imageAvatarS = 32.0;
  static const double imageAvatarM = 48.0;
  static const double imageAvatarL = 64.0;
  static const double imageThumbnail = 80.0;
  static const double imageSmall = 120.0;
  static const double imageMedium = 240.0;
  static const double imageLarge = 360.0;
  static const double imageXLarge = 480.0;

  // Screen Padding
  static const double screenPadding = 16.0;
  static const double screenPaddingLarge = 24.0;

  // Card Elevation
  static const double elevationNone = 0.0;
  static const double elevationS = 2.0;
  static const double elevationM = 4.0;
  static const double elevationL = 8.0;
  static const double elevationXL = 16.0;

  // Button Heights
  static const double buttonHeightS = 36.0;
  static const double buttonHeightM = 44.0;
  static const double buttonHeightL = 52.0;

  // Input Field Heights
  static const double inputHeightS = 36.0;
  static const double inputHeightM = 44.0;
  static const double inputHeightL = 52.0;

  // Avatar Sizes
  static const double avatarXS = 24.0;
  static const double avatarS = 32.0;
  static const double avatarM = 40.0;
  static const double avatarL = 48.0;
  static const double avatarXL = 64.0;

  // Grid Spacing
  static const double gridSpacing = 8.0;
  static const double gridSpacingLarge = 16.0;

  // List Item Heights
  static const double listItemHeightS = 56.0;
  static const double listItemHeightM = 72.0;
  static const double listItemHeightL = 88.0;

  // Bottom Navigation Bar Height
  static const double bottomNavHeight = 60.0;

  // App Bar Height
  static const double appBarHeight = 56.0;
  static const double appBarHeightLarge = 64.0;

  // Tab Bar Height
  static const double tabBarHeight = 48.0;

  // Minimum Touch Target Size
  static const double minTouchTarget = 44.0;

  // Max Content Width
  static const double maxContentWidth = 1200.0;

  // Max Text Lines
  static const int maxLinesTitle = 2;
  static const int maxLinesSubtitle = 3;
  static const int maxLinesDescription = 5;

  // Price Formatting
  static const String currencySymbol = '₱';
  static const int decimalPlaces = 2;

  // Date Formats
  static const String dateFormatDisplay = 'MMM dd, yyyy';
  static const String dateFormatShort = 'MM/dd/yyyy';
  static const String dateFormatLong = 'MMMM dd, yyyy';
  static const String timeFormatDisplay = 'hh:mm a';
  static const String dateTimeFormatDisplay = 'MMM dd, yyyy hh:mm a';

  // Regex Patterns
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String phonePattern = r'^09\d{9}$';
  static const String passwordPattern =
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$';

  // Validation Messages
  static const String errorEmailInvalid = 'Please enter a valid email address';
  static const String errorPhoneInvalid = 'Please enter a valid phone number';
  static const String errorPasswordInvalid =
      'Password must be at least 8 characters with uppercase, lowercase, number, and special character';
  static const String errorRequired = 'This field is required';
  static const String errorMinLength = 'Must be at least {0} characters';
  static const String errorMaxLength = 'Must not exceed {0} characters';

  // Success Messages
  static const String successAddedToCart = 'Added to cart';
  static const String successRemovedFromCart = 'Removed from cart';
  static const String successAddedToFavorites = 'Added to favorites';
  static const String successRemovedFromFavorites = 'Removed from favorites';
  static const String successOrderPlaced = 'Order placed successfully';
  static const String successProfileUpdated = 'Profile updated successfully';
  static const String successPasswordChanged = 'Password changed successfully';

  // Error Messages
  static const String errorNetwork = 'No internet connection';
  static const String errorServer = 'Server error. Please try again later';
  static const String errorUnknown = 'An unknown error occurred';
  static const String errorUnauthorized = 'Unauthorized access';
  static const String errorNotFound = 'Resource not found';
  static const String errorTimeout = 'Request timeout. Please try again';

  // Loading Messages
  static const String loading = 'Loading...';
  static const String loadingData = 'Loading data...';
  static const String submitting = 'Submitting...';
  static const String processing = 'Processing...';

  // Empty Messages
  static const String emptyCart = 'Your cart is empty';
  static const String emptyFavorites = 'No favorites yet';
  static const String emptyOrders = 'No orders yet';
  static const String emptySearch = 'No results found';
  static const String emptyNotifications = 'No notifications';

  // Categories
  static const List<String> categories = [
    'Vegetables',
    'Fruits',
    'Meat',
    'Seafood',
    'Dairy',
    'Bakery',
    'Beverages',
    'Snacks',
    'Household',
    'Personal Care',
  ];

  // Sort Options
  static const List<String> sortOptions = [
    'Relevance',
    'Price: Low to High',
    'Price: High to Low',
    'Newest First',
    'Rating',
  ];

  // Filter Options
  static const List<String> priceRanges = [
    'Under ₱50',
    '₱50 - ₱100',
    '₱100 - ₱200',
    '₱200 - ₱500',
    '₱500 and above',
  ];

  static const List<String> ratings = [
    '4+ Stars',
    '3+ Stars',
    '2+ Stars',
    '1+ Stars',
  ];

  // Payment Methods
  static const List<String> paymentMethods = [
    'Cash on Delivery',
    'GCash',
    'PayMaya',
    'Credit/Debit Card',
  ];

  // Order Status
  static const List<String> orderStatuses = [
    'Pending',
    'Confirmed',
    'Preparing',
    'Out for Delivery',
    'Delivered',
    'Cancelled',
  ];

  // Social Links
  static const String facebookUrl = 'https://facebook.com/epalengke';
  static const String instagramUrl = 'https://instagram.com/epalengke';
  static const String twitterUrl = 'https://twitter.com/epalengke';
  static const String tiktokUrl = 'https://tiktok.com/@epalengke';

  // Support
  static const String supportEmail = 'support@epalengke.com';
  static const String supportPhone = '+63 912 345 6789';

  // Terms & Privacy
  static const String termsUrl = 'https://epalengke.com/terms';
  static const String privacyUrl = 'https://epalengke.com/privacy';
}
