import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class RiderAvailabilityScreen extends StatefulWidget {
  const RiderAvailabilityScreen({super.key});

  @override
  State<RiderAvailabilityScreen> createState() =>
      _RiderAvailabilityScreenState();
}

class _RiderAvailabilityScreenState
    extends State<RiderAvailabilityScreen> {
  bool _isOnline = true;
  bool _autoAccept = false;
  bool _onlyNearby = true;

  // Mock stats
  final _onlineSince = '08:32 AM';
  final _hoursOnline = '2h 14m';
  final int _jobsReceived = 7;
  final int _jobsAccepted = 6;

  double get _acceptanceRate =>
      _jobsReceived == 0 ? 0 : _jobsAccepted / _jobsReceived * 100;

  void _toggleOnline() {
    if (_isOnline) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          title: const Text(
            'Go Offline?',
            style: TextStyle(
                fontFamily: 'Poppins', fontWeight: FontWeight.w700),
          ),
          content: const Text(
            'You won\'t receive new job requests while offline. Active deliveries will not be affected.',
            style: TextStyle(fontFamily: 'Poppins', fontSize: 13),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel',
                  style: TextStyle(fontFamily: 'Poppins')),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                setState(() => _isOnline = false);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEF4444),
                foregroundColor: Colors.white,
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Go Offline',
                  style: TextStyle(fontFamily: 'Poppins')),
            ),
          ],
        ),
      );
    } else {
      setState(() => _isOnline = true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────────────────
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.fromLTRB(8, 12, 20, 14),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back,
                        color: Color(0xFF111827)),
                  ),
                  const Expanded(
                    child: Text(
                      'Availability',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                  const SizedBox(width: 48),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16, vertical: 20),
                child: Column(
                  children: [
                    // ── Status toggle ──────────────────────────────────────
                    GestureDetector(
                      onTap: _toggleOnline,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(28),
                        decoration: BoxDecoration(
                          color: _isOnline
                              ? const Color(0xFFEBF8F1)
                              : const Color(0xFFFEF2F2),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: _isOnline
                                ? AppColors.primary
                                : AppColors.error,
                            width: 2,
                          ),
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              decoration: BoxDecoration(
                                color: _isOnline
                                    ? AppColors.primary
                                    : AppColors.error,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: (_isOnline
                                            ? AppColors.primary
                                            : AppColors.error)
                                        .withValues(alpha: 0.35),
                                    blurRadius: 20,
                                    spreadRadius: 4,
                                  ),
                                ],
                              ),
                              child: Icon(
                                _isOnline
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_unchecked,
                                color: Colors.white,
                                size: 44,
                              ),
                            ),
                            const SizedBox(height: 18),
                            Text(
                              _isOnline ? 'You are ONLINE' : 'You are OFFLINE',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 22,
                                fontWeight: FontWeight.w900,
                                color: _isOnline
                                    ? AppColors.primary
                                    : AppColors.error,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              _isOnline
                                  ? 'You are receiving job requests'
                                  : 'Tap to go online and start earning',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: Color(0xFF6B7280),
                              ),
                            ),
                            if (_isOnline) ...[
                              const SizedBox(height: 12),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.access_time,
                                      size: 14,
                                      color: AppColors.primary),
                                  const SizedBox(width: 4),
                                  Text(
                                    'Online since $_onlineSince  ·  $_hoursOnline',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 12,
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    // ── Today's stats ──────────────────────────────────────
                    Container(
                      padding: const EdgeInsets.all(18),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Today\'s Stats',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            children: [
                              _StatBox(
                                value: '$_jobsReceived',
                                label: 'Jobs\nReceived',
                                color: const Color(0xFF3B82F6),
                              ),
                              const SizedBox(width: 10),
                              _StatBox(
                                value: '$_jobsAccepted',
                                label: 'Jobs\nAccepted',
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 10),
                              _StatBox(
                                value:
                                    '${_acceptanceRate.toStringAsFixed(0)}%',
                                label: 'Acceptance\nRate',
                                color: _acceptanceRate >= 80
                                    ? AppColors.primary
                                    : const Color(0xFFF59E0B),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // ── Toggle settings ────────────────────────────────────
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.04),
                            blurRadius: 6,
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _ToggleRow(
                            title: 'Auto-Accept Jobs',
                            subtitle:
                                'Automatically accept new job requests',
                            value: _autoAccept,
                            onChanged: (v) =>
                                setState(() => _autoAccept = v),
                          ),
                          const Divider(
                              height: 1,
                              indent: 16,
                              endIndent: 16,
                              color: Color(0xFFF3F4F6)),
                          _ToggleRow(
                            title: 'Nearby Jobs Only',
                            subtitle:
                                'Only show jobs within your 5 km radius',
                            value: _onlyNearby,
                            onChanged: (v) =>
                                setState(() => _onlyNearby = v),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // ── Acceptance rate notice ─────────────────────────────
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFF7ED),
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                            color: const Color(0xFFFDE68A), width: 1),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.info_outline,
                              size: 18, color: Color(0xFFF59E0B)),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Maintain High Acceptance Rate',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFF92400E),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'Riders with acceptance rate below 70% may be deactivated from the platform.',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    color: Color(0xFF92400E),
                                    height: 1.5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
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

class _StatBox extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  const _StatBox(
      {required this.value, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 22,
                fontWeight: FontWeight.w900,
                color: color,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 10,
                color: Color(0xFF6B7280),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _ToggleRow({
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }
}
