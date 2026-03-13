import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class RiderOrderHistoryScreen extends StatefulWidget {
  const RiderOrderHistoryScreen({super.key});

  @override
  State<RiderOrderHistoryScreen> createState() =>
      _RiderOrderHistoryScreenState();
}

class _RiderOrderHistoryScreenState extends State<RiderOrderHistoryScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 2, vsync: this);
    _tabCtrl.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  final List<_RiderOrder> _all = [
    _RiderOrder(
      orderId: '#EP-89231',
      customer: 'Maria Santos',
      address: '123 Quezon Ave., QC',
      items: '3 items · Pechay, Chicken, Tilapia',
      earnings: 95.0,
      date: 'Today, 2:45 PM',
      status: _RiderOrderStatus.completed,
    ),
    _RiderOrder(
      orderId: '#EP-89209',
      customer: 'Pedro Reyes',
      address: '56 Taft Ave., Manila',
      items: '2 items · Bangus, Onion',
      earnings: 120.0,
      date: 'Today, 11:12 AM',
      status: _RiderOrderStatus.completed,
    ),
    _RiderOrder(
      orderId: '#EP-89100',
      customer: 'Roberto Cruz',
      address: '78 Ortigas, Pasig',
      items: '5 items · Pork, Chicken, Tilapia',
      earnings: 145.0,
      date: 'Yesterday, 6:55 PM',
      status: _RiderOrderStatus.completed,
    ),
    _RiderOrder(
      orderId: '#EP-89045',
      customer: 'Liza Gonzales',
      address: '9 Mabini St., Cavite',
      items: '1 item · Whole Chicken',
      earnings: 0.0,
      date: 'Yesterday, 3:20 PM',
      status: _RiderOrderStatus.cancelled,
    ),
    _RiderOrder(
      orderId: '#EP-88917',
      customer: 'Carlo Mendoza',
      address: '22 Katipunan Ave., QC',
      items: '4 items · Bangus, Pechay, Onion, Tilapia',
      earnings: 65.0,
      date: 'Jun 23, 10:40 AM',
      status: _RiderOrderStatus.completed,
    ),
    _RiderOrder(
      orderId: '#EP-88760',
      customer: 'Nena Santos',
      address: '88 Morayta, Manila',
      items: '2 items · Liempo, Bangus',
      earnings: 0.0,
      date: 'Jun 22, 2:10 PM',
      status: _RiderOrderStatus.cancelled,
    ),
  ];

  List<_RiderOrder> get _completed =>
      _all.where((o) => o.status == _RiderOrderStatus.completed).toList();
  List<_RiderOrder> get _cancelled =>
      _all.where((o) => o.status == _RiderOrderStatus.cancelled).toList();

  List<_RiderOrder> get _current =>
      _tabCtrl.index == 0 ? _completed : _cancelled;

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
              padding: const EdgeInsets.fromLTRB(8, 12, 20, 0),
              child: Column(
                children: [
                  Row(
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
                          'Delivery History',
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
                  const SizedBox(height: 12),
                  TabBar(
                    controller: _tabCtrl,
                    labelColor: AppColors.primary,
                    unselectedLabelColor: const Color(0xFF9CA3AF),
                    indicatorColor: AppColors.primary,
                    indicatorWeight: 2.5,
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                    ),
                    tabs: [
                      Tab(text: 'Completed (${_completed.length})'),
                      Tab(text: 'Cancelled (${_cancelled.length})'),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            // ── Summary ────────────────────────────────────────────────────
            if (_tabCtrl.index == 0)
              Container(
                color: AppColors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                child: Row(
                  children: [
                    _SummaryPill(
                      label: 'Total Deliveries',
                      value: '${_completed.length}',
                      color: AppColors.primary,
                    ),
                    const SizedBox(width: 10),
                    _SummaryPill(
                      label: 'Total Earned',
                      value:
                          '₱${_completed.fold<double>(0, (s, o) => s + o.earnings).toStringAsFixed(0)}',
                      color: const Color(0xFF3B82F6),
                    ),
                  ],
                ),
              ),
            Expanded(
              child: _current.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.history,
                            size: 56,
                            color: Color(0xFFD1D5DB),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            _tabCtrl.index == 0
                                ? 'No completed deliveries yet.'
                                : 'No cancelled deliveries.',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: _current.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 10),
                      itemBuilder: (_, i) => _OrderHistoryCard(_current[i]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryPill extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _SummaryPill({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Text(
              value,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: color,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 11,
                color: Color(0xFF6B7280),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderHistoryCard extends StatelessWidget {
  final _RiderOrder order;
  const _OrderHistoryCard(this.order);

  @override
  Widget build(BuildContext context) {
    final isCancelled = order.status == _RiderOrderStatus.cancelled;
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                order.orderId,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 13,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF111827),
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: isCancelled
                      ? const Color(0xFFFEF2F2)
                      : const Color(0xFFEBF8F1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  isCancelled ? 'Cancelled' : 'Completed',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: isCancelled ? AppColors.error : AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          _InfoRow(Icons.person_outline, order.customer),
          const SizedBox(height: 4),
          _InfoRow(Icons.location_on_outlined, order.address),
          const SizedBox(height: 4),
          _InfoRow(Icons.shopping_bag_outlined, order.items),
          const SizedBox(height: 10),
          const Divider(height: 1, color: Color(0xFFF3F4F6)),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.access_time, size: 13, color: Color(0xFF9CA3AF)),
              const SizedBox(width: 4),
              Text(
                order.date,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 12,
                  color: Color(0xFF9CA3AF),
                ),
              ),
              const Spacer(),
              if (!isCancelled)
                Text(
                  '+₱${order.earnings.toStringAsFixed(0)}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String text;
  const _InfoRow(this.icon, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 14, color: const Color(0xFF9CA3AF)),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              color: Color(0xFF6B7280),
            ),
          ),
        ),
      ],
    );
  }
}

enum _RiderOrderStatus { completed, cancelled }

class _RiderOrder {
  final String orderId;
  final String customer;
  final String address;
  final String items;
  final double earnings;
  final String date;
  final _RiderOrderStatus status;

  const _RiderOrder({
    required this.orderId,
    required this.customer,
    required this.address,
    required this.items,
    required this.earnings,
    required this.date,
    required this.status,
  });
}
