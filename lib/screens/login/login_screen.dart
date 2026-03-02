import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../core/theme/app_colors.dart';
import '../otp/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _phoneController = TextEditingController();
  final FocusNode _phoneFocus = FocusNode();

  @override
  void dispose() {
    _phoneController.dispose();
    _phoneFocus.dispose();
    super.dispose();
  }

  void _onSendOtp() {
    final phone = _phoneController.text.trim();
    if (phone.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => OtpScreen(phoneNumber: '+63 $phone')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 72),
              // Logo
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  color: const Color(0xFFE8F5EE),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Center(
                  child: Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      color: const Color(0xFFF5EDE3),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Center(
                      child: Text('🧺', style: TextStyle(fontSize: 56)),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),
              // App Name
              const Text(
                'ePalengke',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 32,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0D1B2A),
                  letterSpacing: -0.5,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Fresh market finds, delivered\nstraight to your doorstep.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF6B7280),
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),
              // Phone Number Label
              Align(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'Enter your mobile number',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // Phone Input
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 14),
                    // Philippines Flag
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        width: 28,
                        height: 20,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                        ),
                        child: _PhFlagIcon(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      '+63',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                    Container(
                      height: 22,
                      width: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      color: const Color(0xFFD1D5DB),
                    ),
                    Expanded(
                      child: TextField(
                        controller: _phoneController,
                        focusNode: _phoneFocus,
                        keyboardType: TextInputType.phone,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          LengthLimitingTextInputFormatter(10),
                        ],
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF111827),
                        ),
                        decoration: const InputDecoration(
                          hintText: '917 123 4567',
                          hintStyle: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFFB0B7C3),
                          ),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 14),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Send OTP Button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: _onSendOtp,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: AppColors.white,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Send OTP',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20, color: Colors.white),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 36),
              // Secure note
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.lock_outline, size: 14, color: Color(0xFF9CA3AF)),
                  SizedBox(width: 6),
                  Text(
                    'Secure 256-bit Encryption',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Compliance text
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11.5,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF9CA3AF),
                    height: 1.6,
                  ),
                  children: [
                    TextSpan(
                      text:
                          'By continuing, you agree to our Terms. Your data is\nsecured in compliance with ',
                    ),
                    TextSpan(
                      text: 'R.A. 10175 (Cybercrime\nPrevention Act).',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _PhFlagIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 28,
      height: 20,
      child: CustomPaint(painter: _PhFlagPainter()),
    );
  }
}

class _PhFlagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Blue top half
    final bluePaint = Paint()..color = const Color(0xFF0038A8);
    canvas.drawRect(
      Rect.fromLTWH(0, 0, size.width, size.height / 2),
      bluePaint,
    );

    // Red bottom half
    final redPaint = Paint()..color = const Color(0xFFCE1126);
    canvas.drawRect(
      Rect.fromLTWH(0, size.height / 2, size.width, size.height / 2),
      redPaint,
    );

    // White triangle on left
    final whitePaint = Paint()..color = Colors.white;
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width * 0.45, size.height / 2);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, whitePaint);

    // Small yellow sun
    final yellowPaint = Paint()..color = const Color(0xFFFCD116);
    canvas.drawCircle(
      Offset(size.width * 0.18, size.height / 2),
      size.height * 0.18,
      yellowPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
