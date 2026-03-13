import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../orders/order_history_screen.dart';
import '../favorites/favorites_screen.dart';
import 'address_management_screen.dart';

class CustomerProfileScreen extends StatefulWidget {
  const CustomerProfileScreen({super.key});

  @override
  State<CustomerProfileScreen> createState() => _CustomerProfileScreenState();
}

class _CustomerProfileScreenState extends State<CustomerProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────────
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.fromLTRB(8, 12, 20, 16),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'My Profile',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.edit_outlined,
                      color: AppColors.primary,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ── Profile card ──────────────────────────────────────
                    Container(
                      color: AppColors.white,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 28,
                        horizontal: 20,
                      ),
                      child: Row(
                        children: [
                          Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: const Color(0xFFE0D6CC),
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: const Color(0xFFBBF7D0),
                                    width: 3,
                                  ),
                                ),
                                child: const Center(
                                  child: Text(
                                    '👨‍💼',
                                    style: TextStyle(fontSize: 40),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 24,
                                  height: 24,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),
                                  child: const Icon(
                                    Icons.camera_alt,
                                    size: 12,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(width: 18),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Juan Dela Cruz',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 19,
                                    fontWeight: FontWeight.w800,
                                    color: Color(0xFF111827),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                const Text(
                                  '+63 917 123 4567',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    color: Color(0xFF6B7280),
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'juan.dc@email.com',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    color: Color(0xFF6B7280),
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEBF8F1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: const Text(
                                    'Verified Customer',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 11,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // ── Stats ─────────────────────────────────────────────
                    Container(
                      color: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        children: const [
                          _StatTile(value: '12', label: 'Orders'),
                          _StatDivider(),
                          _StatTile(value: '₱3,240', label: 'Total Spent'),
                          _StatDivider(),
                          _StatTile(value: '3', label: 'Favorites'),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // ── Menu ──────────────────────────────────────────────
                    Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          _MenuTile(
                            icon: Icons.shopping_bag_outlined,
                            label: 'Order History',
                            subtitle: '12 total orders',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const OrderHistoryScreen(),
                                ),
                              );
                            },
                          ),
                          const _TileDivider(),
                          _MenuTile(
                            icon: Icons.favorite_border,
                            label: 'My Favorites',
                            subtitle: '3 saved items',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const FavoritesScreen(),
                                ),
                              );
                            },
                          ),
                          const _TileDivider(),
                          _MenuTile(
                            icon: Icons.location_on_outlined,
                            label: 'Manage Addresses',
                            subtitle: '2 saved addresses',
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const AddressManagementScreen(),
                                ),
                              );
                            },
                          ),
                          const _TileDivider(),
                          _MenuTile(
                            icon: Icons.payment_outlined,
                            label: 'Payment Methods',
                            subtitle: 'GCash, COD saved',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          _MenuTile(
                            icon: Icons.notifications_outlined,
                            label: 'Notifications',
                            onTap: () {},
                          ),
                          const _TileDivider(),
                          _MenuTile(
                            icon: Icons.help_outline,
                            label: 'Help & Support',
                            onTap: () {},
                          ),
                          const _TileDivider(),
                          _MenuTile(
                            icon: Icons.gavel_rounded,
                            label: 'Legal & Terms',
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // ── Logout ────────────────────────────────────────────
                    Container(
                      color: AppColors.white,
                      child: Column(
                        children: [
                          _MenuTile(
                            icon: Icons.logout,
                            label: 'Logout',
                            iconColor: AppColors.error,
                            labelColor: AppColors.error,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  title: const Text(
                                    'Logout',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  content: const Text(
                                    'Are you sure you want to logout?',
                                    style: TextStyle(fontFamily: 'Poppins'),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text(
                                        'Cancel',
                                        style: TextStyle(fontFamily: 'Poppins'),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () => Navigator.of(
                                        context,
                                      ).popUntil((r) => r.isFirst),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppColors.error,
                                        foregroundColor: Colors.white,
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            8,
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        'Logout',
                                        style: TextStyle(fontFamily: 'Poppins'),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const _TileDivider(),
                          _MenuTile(
                            icon: Icons.delete_outline,
                            label: 'Delete Account',
                            iconColor: AppColors.error,
                            labelColor: AppColors.error,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'ePalengke Customer App v2.4.12',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        color: Color(0xFFB0B7C3),
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

class _StatTile extends StatelessWidget {
  final String value;
  final String label;
  const _StatTile({required this.value, required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 11,
              color: Color(0xFF9CA3AF),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatDivider extends StatelessWidget {
  const _StatDivider();

  @override
  Widget build(BuildContext context) {
    return Container(width: 1, height: 32, color: const Color(0xFFE5E7EB));
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? subtitle;
  final Color iconColor;
  final Color labelColor;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.label,
    this.subtitle,
    this.iconColor = const Color(0xFF374151),
    this.labelColor = const Color(0xFF111827),
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        width: 38,
        height: 38,
        decoration: BoxDecoration(
          color: iconColor == AppColors.error
              ? AppColors.errorLight
              : const Color(0xFFEBF8F1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, size: 20, color: iconColor),
      ),
      title: Text(
        label,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: labelColor,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 12,
                color: Color(0xFF9CA3AF),
              ),
            )
          : null,
      trailing: Icon(
        Icons.chevron_right,
        size: 20,
        color: iconColor == AppColors.error
            ? AppColors.error
            : const Color(0xFF9CA3AF),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
    );
  }
}

class _TileDivider extends StatelessWidget {
  const _TileDivider();

  @override
  Widget build(BuildContext context) {
    return const Divider(
      height: 1,
      indent: 70,
      endIndent: 20,
      color: Color(0xFFF3F4F6),
    );
  }
}
