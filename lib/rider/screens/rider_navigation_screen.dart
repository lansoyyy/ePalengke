import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class RiderNavigationScreen extends StatefulWidget {
  const RiderNavigationScreen({super.key});

  @override
  State<RiderNavigationScreen> createState() => _RiderNavigationScreenState();
}

class _RiderNavigationScreenState extends State<RiderNavigationScreen> {
  bool _arrived = false;
  int _currentStep = 0;

  final List<_NavStep> _steps = const [
    _NavStep(
      icon: Icons.arrow_upward,
      instruction: 'Head north on Quezon Ave',
      distance: '0.3 km',
      highlight: true,
    ),
    _NavStep(
      icon: Icons.turn_right,
      instruction: 'Turn right onto EDSA',
      distance: '1.2 km',
    ),
    _NavStep(
      icon: Icons.arrow_upward,
      instruction: 'Continue straight on EDSA',
      distance: '0.8 km',
    ),
    _NavStep(
      icon: Icons.turn_left,
      instruction: 'Turn left onto Tomas Morato Ave',
      distance: '200 m',
    ),
    _NavStep(
      icon: Icons.location_on,
      instruction: 'Arrive at destination on the right',
      distance: '50 m',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // ── Map placeholder ────────────────────────────────────────────
            Positioned.fill(child: CustomPaint(painter: _MapPainter())),
            // ── Top overlay ────────────────────────────────────────────────
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.12),
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    // ── Header ─────────────────────────────────────────────
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 10, 14, 10),
                      child: Row(
                        children: [
                          IconButton(
                            onPressed: () => Navigator.of(context).pop(),
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Color(0xFF111827),
                              size: 22,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  '123 Mapagmahal St., QC',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'Customer: Maria Santos',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    color: Color(0xFF9CA3AF),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Call button
                          Container(
                            width: 38,
                            height: 38,
                            decoration: BoxDecoration(
                              color: const Color(0xFFEBF8F1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.call,
                                size: 18,
                                color: AppColors.primary,
                              ),
                              padding: EdgeInsets.zero,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ── ETA row ────────────────────────────────────────────
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(14),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _EtaTile(
                            label: 'ETA',
                            value: '12 min',
                            icon: Icons.access_time,
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.white30,
                          ),
                          _EtaTile(
                            label: 'Distance',
                            value: '2.3 km',
                            icon: Icons.straighten,
                          ),
                          Container(
                            width: 1,
                            height: 30,
                            color: Colors.white30,
                          ),
                          _EtaTile(
                            label: 'Order',
                            value: '#EP-89231',
                            icon: Icons.receipt_long,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ── Turn-by-turn panel (expandable) ────────────────────────────
            Positioned(
              left: 12,
              right: 12,
              bottom: 12,
              child: Column(
                children: [
                  // ── Next turn card ────────────────────────────────────
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(14),
                      ),
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 46,
                          height: 46,
                          decoration: BoxDecoration(
                            color: AppColors.primary,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Icon(
                            _steps[_currentStep].icon,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),
                        const SizedBox(width: 14),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'NEXT',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 10,
                                  color: Color(0xFF94A3B8),
                                  letterSpacing: 1.2,
                                ),
                              ),
                              Text(
                                _steps[_currentStep].instruction,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          _steps[_currentStep].distance,
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // ── Step list ─────────────────────────────────────────
                  Container(
                    constraints: const BoxConstraints(maxHeight: 180),
                    decoration: const BoxDecoration(
                      color: Color(0xFF0F172A),
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(14),
                      ),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      itemCount: _steps.length,
                      separatorBuilder: (_, __) =>
                          const Divider(height: 1, color: Color(0xFF1E293B)),
                      itemBuilder: (_, i) {
                        final active = i == _currentStep;
                        return GestureDetector(
                          onTap: () => setState(() => _currentStep = i),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Icon(
                                  _steps[i].icon,
                                  size: 16,
                                  color: active
                                      ? AppColors.primary
                                      : const Color(0xFF64748B),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    _steps[i].instruction,
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      fontWeight: active
                                          ? FontWeight.w700
                                          : FontWeight.w400,
                                      color: active
                                          ? Colors.white
                                          : const Color(0xFF64748B),
                                    ),
                                  ),
                                ),
                                Text(
                                  _steps[i].distance,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    color: active
                                        ? AppColors.primary
                                        : const Color(0xFF475569),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  // ── Action buttons ────────────────────────────────────
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          child: OutlinedButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.navigation_outlined,
                              size: 18,
                            ),
                            label: const Text(
                              'Google Maps',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Colors.white,
                              foregroundColor: const Color(0xFF374151),
                              side: const BorderSide(color: Color(0xFFE5E7EB)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: SizedBox(
                          height: 52,
                          child: ElevatedButton.icon(
                            onPressed: () => setState(() => _arrived = true),
                            icon: const Icon(
                              Icons.check_circle_outline,
                              size: 18,
                            ),
                            label: const Text(
                              'I Arrived',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // ── Arrived overlay ────────────────────────────────────────────
            if (_arrived)
              Positioned.fill(
                child: Container(
                  color: Colors.black87,
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 32),
                      padding: const EdgeInsets.all(28),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.check_circle,
                            size: 64,
                            color: AppColors.primary,
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'You\'ve Arrived!',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Please hand over the order to the customer.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                          const SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).pop(),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              child: const Text(
                                'Mark as Delivered',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _EtaTile extends StatelessWidget {
  final String label;
  final String value;
  final IconData icon;
  const _EtaTile({
    required this.label,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, size: 14, color: Colors.white70),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13,
            fontWeight: FontWeight.w800,
            color: Colors.white,
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 10,
            color: Colors.white60,
          ),
        ),
      ],
    );
  }
}

class _NavStep {
  final IconData icon;
  final String instruction;
  final String distance;
  final bool highlight;
  const _NavStep({
    required this.icon,
    required this.instruction,
    required this.distance,
    this.highlight = false,
  });
}

class _MapPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // Draw a simple placeholder map with a road grid
    final bgPaint = Paint()..color = const Color(0xFFE8F5E9);
    canvas.drawRect(Offset.zero & size, bgPaint);

    final roadColor = const Color(0xFFFFFFFF);
    final roadPaint = Paint()
      ..color = roadColor
      ..strokeWidth = 14;

    // Horizontal roads
    for (double y = 60; y < size.height; y += 80) {
      canvas.drawLine(Offset(0, y), Offset(size.width, y), roadPaint);
    }
    // Vertical roads
    for (double x = 60; x < size.width; x += 80) {
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), roadPaint);
    }

    // Route highlight
    final routePaint = Paint()
      ..color = const Color(0xFF00AA4F)
      ..strokeWidth = 5
      ..strokeCap = StrokeCap.round;

    final path = Path()
      ..moveTo(size.width / 2, size.height * 0.7)
      ..lineTo(size.width / 2, size.height * 0.4)
      ..lineTo(size.width * 0.65, size.height * 0.4)
      ..lineTo(size.width * 0.65, size.height * 0.2);

    canvas.drawPath(
      path,
      routePaint
        ..style = PaintingStyle.stroke
        ..strokeJoin = StrokeJoin.round,
    );

    // Destination pin
    final pinPaint = Paint()..color = const Color(0xFFEF4444);
    canvas.drawCircle(
      Offset(size.width * 0.65, size.height * 0.2),
      14,
      pinPaint,
    );
    final innerPaint = Paint()..color = Colors.white;
    canvas.drawCircle(
      Offset(size.width * 0.65, size.height * 0.2),
      6,
      innerPaint,
    );

    // Rider dot
    final riderPaint = Paint()..color = const Color(0xFF00AA4F);
    canvas.drawCircle(
      Offset(size.width / 2, size.height * 0.7),
      12,
      riderPaint,
    );
    canvas.drawCircle(Offset(size.width / 2, size.height * 0.7), 5, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
