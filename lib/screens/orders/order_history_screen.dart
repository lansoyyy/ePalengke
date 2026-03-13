import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'order_cancel_screen.dart';
import '../track/track_screen.dart';
import '../rating/rate_rider_screen.dart';

enum OrderStatus {
  pending,
  confirmed,
  shopping,
  delivering,
  delivered,
  cancelled,
}

class CustomerOrder {
  final String id;
  final String date;
  final double total;
  final OrderStatus status;
  final List<String> items;
  const CustomerOrder({
    required this.id,
    required this.date,
    required this.total,
    required this.status,
    required this.items,
  });
}

const List<CustomerOrder> _mockOrders = [
  CustomerOrder(
    id: '#EP-88219',
    date: 'Mar 10, 2026 · 2:15 PM',
    total: 300,
    status: OrderStatus.delivering,
    items: ['Whole Chicken x1', 'Pechay x2', 'Red Onions x1'],
  ),
  CustomerOrder(
    id: '#EP-88105',
    date: 'Mar 8, 2026 · 10:30 AM',
    total: 480,
    status: OrderStatus.delivered,
    items: ['Pork Liempo x2', 'Bangus x1'],
  ),
  CustomerOrder(
    id: '#EP-88001',
    date: 'Mar 5, 2026 · 8:00 AM',
    total: 150,
    status: OrderStatus.cancelled,
    items: ['Fresh Tilapia x2'],
  ),
  CustomerOrder(
    id: '#EP-87902',
    date: 'Mar 2, 2026 · 3:45 PM',
    total: 190,
    status: OrderStatus.delivered,
    items: ['Whole Chicken x1'],
  ),
];

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<CustomerOrder> _filtered(int tabIndex) {
    switch (tabIndex) {
      case 1:
        return _mockOrders
            .where(
              (o) => [
                OrderStatus.pending,
                OrderStatus.confirmed,
                OrderStatus.shopping,
                OrderStatus.delivering,
              ].contains(o.status),
            )
            .toList();
      case 2:
        return _mockOrders
            .where((o) => o.status == OrderStatus.delivered)
            .toList();
      case 3:
        return _mockOrders
            .where((o) => o.status == OrderStatus.cancelled)
            .toList();
      default:
        return _mockOrders;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F4F6),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: AppColors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8, 12, 20, 0),
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
                            'Order History',
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
                  TabBar(
                    controller: _tabController,
                    labelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                    ),
                    unselectedLabelStyle: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                    ),
                    labelColor: AppColors.primary,
                    unselectedLabelColor: const Color(0xFF6B7280),
                    indicatorColor: AppColors.primary,
                    isScrollable: true,
                    tabs: const [
                      Tab(text: 'All'),
                      Tab(text: 'Active'),
                      Tab(text: 'Completed'),
                      Tab(text: 'Cancelled'),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: AnimatedBuilder(
                animation: _tabController,
                builder: (context, _) {
                  final orders = _filtered(_tabController.index);
                  if (orders.isEmpty) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long_outlined,
                            size: 60,
                            color: Color(0xFFD1D5DB),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'No orders here',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF111827),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: orders.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 12),
                    itemBuilder: (context, i) => _OrderCard(order: orders[i]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Order card ────────────────────────────────────────────────────────────────

class _OrderCard extends StatelessWidget {
  final CustomerOrder order;
  const _OrderCard({required this.order});

  Color get _statusColor {
    switch (order.status) {
      case OrderStatus.pending:
        return AppColors.warning;
      case OrderStatus.confirmed:
      case OrderStatus.shopping:
        return AppColors.info;
      case OrderStatus.delivering:
        return AppColors.primary;
      case OrderStatus.delivered:
        return AppColors.success;
      case OrderStatus.cancelled:
        return AppColors.error;
    }
  }

  String get _statusLabel {
    switch (order.status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.confirmed:
        return 'Confirmed';
      case OrderStatus.shopping:
        return 'Shopping';
      case OrderStatus.delivering:
        return 'Delivering';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }

  bool get _isActive => [
    OrderStatus.pending,
    OrderStatus.confirmed,
    OrderStatus.shopping,
    OrderStatus.delivering,
  ].contains(order.status);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 8),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                order.id,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF111827),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: _statusColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  _statusLabel,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: _statusColor,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            order.date,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              color: Color(0xFF9CA3AF),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            order.items.join(', '),
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              color: Color(0xFF6B7280),
              height: 1.5,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10),
          const Divider(color: Color(0xFFE5E7EB), height: 1),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '₱${order.total.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
              Row(
                children: [
                  if (_isActive)
                    _ActionButton(
                      label: 'Track',
                      isSecondary: true,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const TrackScreen(),
                          ),
                        );
                      },
                    ),
                  if (order.status == OrderStatus.pending) ...[
                    const SizedBox(width: 8),
                    _ActionButton(
                      label: 'Cancel',
                      isDanger: true,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                OrderCancelScreen(orderId: order.id),
                          ),
                        );
                      },
                    ),
                  ],
                  if (order.status == OrderStatus.delivered) ...[
                    const SizedBox(width: 8),
                    _ActionButton(
                      label: 'Rate Rider',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const RateRiderScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                    _ActionButton(
                      label: 'Reorder',
                      isSecondary: true,
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Items added to cart!',
                              style: TextStyle(fontFamily: 'Poppins'),
                            ),
                            backgroundColor: AppColors.primary,
                            behavior: SnackBarBehavior.floating,
                          ),
                        );
                      },
                    ),
                  ],
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final bool isSecondary;
  final bool isDanger;
  const _ActionButton({
    required this.label,
    required this.onTap,
    this.isSecondary = false,
    this.isDanger = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    if (isDanger) {
      bg = AppColors.errorLight;
      fg = AppColors.error;
    } else if (isSecondary) {
      bg = const Color(0xFFF3F4F6);
      fg = const Color(0xFF374151);
    } else {
      bg = AppColors.primary;
      fg = Colors.white;
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: fg,
          ),
        ),
      ),
    );
  }
}
