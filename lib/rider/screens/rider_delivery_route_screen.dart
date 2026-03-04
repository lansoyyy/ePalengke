import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class RiderDeliveryRouteScreen extends StatelessWidget {
  const RiderDeliveryRouteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Customer + Order header ────────────────────────────────────
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: const BoxDecoration(
                      color: Color(0xFFD4A574),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text('👤', style: TextStyle(fontSize: 22)),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'John Doe',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                          ),
                        ),
                        Text(
                          'Order #88219',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF8F1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: const Color(0xFF6EE7B7)),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.circle, size: 8, color: AppColors.primary),
                        SizedBox(width: 5),
                        Text(
                          'EN ROUTE',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // ── Map Placeholder ────────────────────────────────────────────
            Expanded(
              flex: 5,
              child: Stack(
                children: [
                  // Map background
                  Container(
                    color: const Color(0xFFD4E9F7),
                    child: CustomPaint(
                      painter: _MapPlaceholderPainter(),
                      child: const SizedBox.expand(),
                    ),
                  ),
                  // Zoom controls
                  Positioned(
                    top: 16,
                    right: 16,
                    child: Column(
                      children: [
                        _MapControlButton(
                          icon: Icons.add,
                          onTap: () {},
                        ),
                        const SizedBox(height: 8),
                        _MapControlButton(
                          icon: Icons.remove,
                          onTap: () {},
                        ),
                        const SizedBox(height: 8),
                        _MapControlButton(
                          icon: Icons.my_location,
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  // Rider marker (top-left area)
                  Positioned(
                    left: 60,
                    top: 160,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 3),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primary.withValues(alpha: 0.4),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: const Icon(
                        Icons.two_wheeler,
                        size: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  // Destination label
                  Positioned(
                    left: 120,
                    top: 290,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.15),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: const Text(
                        'Destination',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                  ),
                  // Destination pin
                  Positioned(
                    left: 148,
                    top: 318,
                    child: Icon(
                      Icons.location_pin,
                      size: 40,
                      color: Colors.red.shade600,
                    ),
                  ),
                ],
              ),
            ),
            // ── Delivery info panel ────────────────────────────────────────
            Expanded(
              flex: 4,
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Address row
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.location_on_outlined,
                          size: 22,
                          color: AppColors.primary,
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'DELIVERY ADDRESS',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 1.0,
                                  color: Color(0xFF9CA3AF),
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '123 Maple St., Brgy. San Juan',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF111827),
                                  height: 1.3,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.primary),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'View Map',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    // Rider note
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF0FAF4),
                        borderRadius: BorderRadius.circular(10),
                        border: const Border(
                          left: BorderSide(
                              color: AppColors.primary, width: 3),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.receipt_long_outlined,
                                size: 16,
                                color: AppColors.primary,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Rider Note',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            'Blue gate, near the sari-sari store. Please ring the doorbell twice.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              color: Color(0xFF374151),
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    // Call / Chat buttons
                    Row(
                      children: [
                        Expanded(
                          child: _ContactButton(
                            icon: Icons.phone_outlined,
                            label: 'Call',
                            onTap: () {},
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _ContactButton(
                            icon: Icons.chat_bubble_outline,
                            label: 'Chat',
                            onTap: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    // Confirm Delivery button (disabled — not within 50m)
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFE5E7EB),
                          disabledBackgroundColor: const Color(0xFFE5E7EB),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.check_circle_outline,
                              size: 20,
                              color: Color(0xFF9CA3AF),
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Confirm Delivery',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Center(
                      child: Text(
                        'You must be within 50m of the destination to confirm.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 11,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MapControlButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  const _MapControlButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(icon, size: 20, color: const Color(0xFF374151)),
      ),
    );
  }
}

class _ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  const _ContactButton(
      {required this.icon, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 48,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 18, color: AppColors.primary),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Color(0xFF111827),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Map placeholder painter ───────────────────────────────────────────────────

class _MapPlaceholderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Road grid (light grey lines)
    final roadPaint = Paint()
      ..color = const Color(0xFFFFFFFF)
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke;

    final majorRoadPaint = Paint()
      ..color = const Color(0xFFFFF3B0)
      ..strokeWidth = 6
      ..style = PaintingStyle.stroke;

    // Water body (bay area simulation)
    final waterPaint = Paint()
      ..color = const Color(0xFF9DC8E8)
      ..style = PaintingStyle.fill;

    final waterPath = Path();
    waterPath.moveTo(0, size.height * 0.3);
    waterPath.lineTo(size.width * 0.12, size.height * 0.25);
    waterPath.lineTo(size.width * 0.08, size.height * 0.45);
    waterPath.lineTo(size.width * 0.13, size.height * 0.65);
    waterPath.lineTo(0, size.height * 0.75);
    waterPath.close();
    canvas.drawPath(waterPath, waterPaint);

    // Land background
    final landPaint = Paint()
      ..color = const Color(0xFFE8F0E0)
      ..style = PaintingStyle.fill;
    canvas.drawRect(
      Rect.fromLTWH(size.width * 0.1, 0, size.width, size.height),
      landPaint,
    );

    // Draw horizontal roads
    for (int i = 1; i <= 8; i++) {
      final y = (size.height / 9) * i;
      canvas.drawLine(
        Offset(size.width * 0.1, y),
        Offset(size.width, y),
        i % 3 == 0 ? majorRoadPaint : roadPaint,
      );
    }

    // Draw vertical roads
    for (int i = 1; i <= 6; i++) {
      final x = size.width * 0.1 + (size.width * 0.9 / 7) * i;
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        i % 2 == 0 ? majorRoadPaint : roadPaint,
      );
    }

    // Green route line
    final routePaint = Paint()
      ..color = const Color(0xFF22C55E)
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final routePath = Path();
    routePath.moveTo(size.width * 0.22, size.height * 0.38);
    routePath.lineTo(size.width * 0.22, size.height * 0.55);
    routePath.lineTo(size.width * 0.35, size.height * 0.55);
    routePath.lineTo(size.width * 0.35, size.height * 0.72);
    canvas.drawPath(routePath, routePaint);

    // Watermark text
    final textPainter = TextPainter(
      text: const TextSpan(
        text: 'Map data ©2026 Google',
        style: TextStyle(
          color: Color(0xFF888888),
          fontSize: 9,
          fontFamily: 'Poppins',
        ),
      ),
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(size.width - textPainter.width - 6, size.height - 14),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
