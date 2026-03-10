import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'rider/screens/rider_login_screen.dart';
import 'rider/screens/rider_registration_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme.copyWith(
        textTheme: GoogleFonts.poppinsTextTheme(AppTheme.lightTheme.textTheme),
      ),
      themeMode: ThemeMode.light,
      initialRoute: '/rider/login',
      routes: {
        '/rider/login': (context) => const RiderLoginScreen(),
        '/rider/register': (context) => const RiderRegistrationScreen(),
      },
    );
  }
}
