import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class RiderNotificationsScreen extends StatefulWidget {
  const RiderNotificationsScreen({super.key});

  @override
  State<RiderNotificationsScreen> createState() =>
      _RiderNotificationsScreenState();
}

class _RiderNotificationsScreenState
    extends State<RiderNotificationsScreen> {
  // ── Notification toggles ─────────────────────────────────────────────────
  bool _newJobs = true;
  bool _orderUpdates = true;
  bool _chatMessages = true;
  bool _earnings = true;
  bool _promotions = false;
  bool _appUpdates = false;

  // ── Sound / Vibrate ──────────────────────────────────────────────────────
  bool _sound = true;
  bool _vibrate = true;

  // ── Quiet hours ──────────────────────────────────────────────────────────
  bool _quietHours = false;
  TimeOfDay _quietStart = const TimeOfDay(hour: 22, minute: 0);
  TimeOfDay _quietEnd = const TimeOfDay(hour: 7, minute: 0);

  Future<void> _pickTime({required bool isStart}) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: isStart ? _quietStart : _quietEnd,
      builder: (ctx, child) => Theme(
        data: Theme.of(ctx).copyWith(
          colorScheme: const ColorScheme.light(
            primary: AppColors.primary,
          ),
        ),
        child: child!,
      ),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _quietStart = picked;
        } else {
          _quietEnd = picked;
        }
      });
    }
  }

  void _save() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Notification settings saved.',
            style: TextStyle(fontFamily: 'Poppins')),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.primary,
      ),
    );
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
                      'Notification Settings',
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
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Job & Order alerts ────────────────────────────────
                    _SectionHeader('Job & Order Alerts'),
                    const SizedBox(height: 8),
                    _ToggleSection(
                      children: [
                        _NotiTile(
                          icon: Icons.work_outline,
                          iconColor: AppColors.primary,
                          title: 'New Job Requests',
                          subtitle:
                              'Get notified when new jobs are available',
                          value: _newJobs,
                          onChanged: (v) => setState(() => _newJobs = v),
                          important: true,
                        ),
                        const _SectionDivider(),
                        _NotiTile(
                          icon: Icons.receipt_long_outlined,
                          iconColor: const Color(0xFF3B82F6),
                          title: 'Order Updates',
                          subtitle:
                              'Status changes and delivery confirmations',
                          value: _orderUpdates,
                          onChanged: (v) =>
                              setState(() => _orderUpdates = v),
                        ),
                        const _SectionDivider(),
                        _NotiTile(
                          icon: Icons.chat_bubble_outline,
                          iconColor: const Color(0xFF8B5CF6),
                          title: 'Chat Messages',
                          subtitle: 'Messages from customers and support',
                          value: _chatMessages,
                          onChanged: (v) =>
                              setState(() => _chatMessages = v),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // ── Financial ─────────────────────────────────────────
                    _SectionHeader('Financial'),
                    const SizedBox(height: 8),
                    _ToggleSection(
                      children: [
                        _NotiTile(
                          icon: Icons.account_balance_wallet_outlined,
                          iconColor: const Color(0xFFF59E0B),
                          title: 'Earnings & Withdrawals',
                          subtitle:
                              'Payment confirmations and wallet updates',
                          value: _earnings,
                          onChanged: (v) => setState(() => _earnings = v),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // ── General ───────────────────────────────────────────
                    _SectionHeader('General'),
                    const SizedBox(height: 8),
                    _ToggleSection(
                      children: [
                        _NotiTile(
                          icon: Icons.local_offer_outlined,
                          iconColor: const Color(0xFFEF4444),
                          title: 'Promotions & Bonuses',
                          subtitle: 'Special offers and surge pay alerts',
                          value: _promotions,
                          onChanged: (v) =>
                              setState(() => _promotions = v),
                        ),
                        const _SectionDivider(),
                        _NotiTile(
                          icon: Icons.system_update_outlined,
                          iconColor: const Color(0xFF6B7280),
                          title: 'App Updates',
                          subtitle:
                              'New features and important announcements',
                          value: _appUpdates,
                          onChanged: (v) => setState(() => _appUpdates = v),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // ── Sound & Vibrate ───────────────────────────────────
                    _SectionHeader('Alert Style'),
                    const SizedBox(height: 8),
                    _ToggleSection(
                      children: [
                        _NotiTile(
                          icon: Icons.volume_up_outlined,
                          iconColor: const Color(0xFF374151),
                          title: 'Sound',
                          subtitle: 'Play sound for notifications',
                          value: _sound,
                          onChanged: (v) => setState(() => _sound = v),
                        ),
                        const _SectionDivider(),
                        _NotiTile(
                          icon: Icons.vibration,
                          iconColor: const Color(0xFF374151),
                          title: 'Vibrate',
                          subtitle: 'Vibrate for notifications',
                          value: _vibrate,
                          onChanged: (v) => setState(() => _vibrate = v),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    // ── Quiet hours ───────────────────────────────────────
                    _SectionHeader('Quiet Hours'),
                    const SizedBox(height: 8),
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
                          _NotiTile(
                            icon: Icons.do_not_disturb_on_outlined,
                            iconColor: const Color(0xFF374151),
                            title: 'Enable Quiet Hours',
                            subtitle:
                                'Silence non-critical notifications',
                            value: _quietHours,
                            onChanged: (v) =>
                                setState(() => _quietHours = v),
                          ),
                          if (_quietHours) ...[
                            const Divider(
                                height: 1, color: Color(0xFFF3F4F6)),
                            Padding(
                              padding: const EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: _TimeSelector(
                                          label: 'From',
                                          time: _quietStart,
                                          onTap: () => _pickTime(
                                              isStart: true),
                                        ),
                                      ),
                                      const Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 12),
                                        child: Text(
                                          '→',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 16,
                                            color: Color(0xFF9CA3AF),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: _TimeSelector(
                                          label: 'Until',
                                          time: _quietEnd,
                                          onTap: () => _pickTime(
                                              isStart: false),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Job notifications will still come through during quiet hours.',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 11,
                                      color: Color(0xFF9CA3AF),
                                      height: 1.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // ── Save button ───────────────────────────────────────
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: _save,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                        ),
                        child: const Text(
                          'Save Settings',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
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

// ── Reusable sub-widgets ──────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String text;
  const _SectionHeader(this.text);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Color(0xFF9CA3AF),
        letterSpacing: 0.5,
      ),
    );
  }
}

class _ToggleSection extends StatelessWidget {
  final List<Widget> children;
  const _ToggleSection({required this.children});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(children: children),
    );
  }
}

class _SectionDivider extends StatelessWidget {
  const _SectionDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
        height: 1, indent: 64, endIndent: 16, color: Color(0xFFF3F4F6));
  }
}

class _NotiTile extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;
  final bool important;

  const _NotiTile({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
    this.important = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, size: 20, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF111827),
                      ),
                    ),
                    if (important) ...[
                      const SizedBox(width: 6),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 6, vertical: 2),
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBF8F1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Important',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 9,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
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

class _TimeSelector extends StatelessWidget {
  final String label;
  final TimeOfDay time;
  final VoidCallback onTap;
  const _TimeSelector(
      {required this.label, required this.time, required this.onTap});

  String _fmt(TimeOfDay t) {
    final h = t.hourOfPeriod == 0 ? 12 : t.hourOfPeriod;
    final m = t.minute.toString().padLeft(2, '0');
    final period = t.period == DayPeriod.am ? 'AM' : 'PM';
    return '$h:$m $period';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 11,
                color: Color(0xFF9CA3AF),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              _fmt(time),
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: Color(0xFF111827),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
