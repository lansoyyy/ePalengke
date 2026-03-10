import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'rider_withdraw_screen.dart';

class RiderEarningsScreen extends StatefulWidget {
  const RiderEarningsScreen({super.key});

  @override
  State<RiderEarningsScreen> createState() => _RiderEarningsScreenState();
}

class _RiderEarningsScreenState extends State<RiderEarningsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabCtrl;

  @override
  void initState() {
    super.initState();
    _tabCtrl = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabCtrl.dispose();
    super.dispose();
  }

  // ── Mock data ───────────────────────────────────────────────────────────────

  final List<_EarningEntry> _transactions = [
    _EarningEntry(
      orderId: '#EP-89231',
      customer: 'Maria Santos',
      amount: 95.0,
      time: '2:45 PM',
      date: 'Today',
    ),
    _EarningEntry(
      orderId: '#EP-89209',
      customer: 'Pedro Reyes',
      amount: 120.0,
      time: '11:12 AM',
      date: 'Today',
    ),
    _EarningEntry(
      orderId: '#EP-89185',
      customer: 'Ana Bautista',
      amount: 80.0,
      time: '9:03 AM',
      date: 'Today',
    ),
    _EarningEntry(
      orderId: '#EP-89100',
      customer: 'Roberto Cruz',
      amount: 145.0,
      time: '6:55 PM',
      date: 'Yesterday',
    ),
    _EarningEntry(
      orderId: '#EP-89045',
      customer: 'Liza Gonzales',
      amount: 110.0,
      time: '3:20 PM',
      date: 'Yesterday',
    ),
    _EarningEntry(
      orderId: '#EP-88917',
      customer: 'Carlo Mendoza',
      amount: 65.0,
      time: '10:40 AM',
      date: 'Jun 23',
    ),
    _EarningEntry(
      orderId: '#EP-88903',
      customer: 'Jessica Reyes',
      amount: 135.0,
      time: '8:15 AM',
      date: 'Jun 23',
    ),
  ];

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
                      'My Earnings',
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
                    icon: const Icon(Icons.calendar_month_outlined,
                        color: Color(0xFF374151), size: 22),
                  ),
                ],
              ),
            ),
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // ── Summary hero ─────────────────────────────────────
                    Container(
                      width: double.infinity,
                      color: AppColors.white,
                      padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                      child: Column(
                        children: [
                          const Text(
                            'Available Balance',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            '₱4,820.00',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 38,
                              fontWeight: FontWeight.w900,
                              color: AppColors.primary,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton.icon(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      const RiderWithdrawScreen(),
                                ));
                              },
                              icon: const Icon(Icons.account_balance_wallet,
                                  size: 18),
                              label: const Text(
                                'Withdraw Earnings',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primary,
                                foregroundColor: Colors.white,
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(12)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    // ── Stats grid ────────────────────────────────────────
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),
                      child: GridView.count(
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        childAspectRatio: 1.9,
                        children: const [
                          _EarnCard(
                            title: 'Today',
                            value: '₱295',
                            subtitle: '3 deliveries',
                            icon: Icons.today,
                            color: AppColors.primary,
                          ),
                          _EarnCard(
                            title: 'This Week',
                            value: '₱1,840',
                            subtitle: '18 deliveries',
                            icon: Icons.date_range,
                            color: Color(0xFF3B82F6),
                          ),
                          _EarnCard(
                            title: 'This Month',
                            value: '₱7,320',
                            subtitle: '72 deliveries',
                            icon: Icons.calendar_month,
                            color: Color(0xFFF59E0B),
                          ),
                          _EarnCard(
                            title: 'All Time',
                            value: '₱32,650',
                            subtitle: '318 deliveries',
                            icon: Icons.insights,
                            color: Color(0xFF8B5CF6),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // ── Breakdown chart (placeholder) ─────────────────────
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
                      padding: const EdgeInsets.all(16),
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
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Earnings Trend',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0xFF111827),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFF3F4F6),
                                  borderRadius: BorderRadius.circular(6),
                                ),
                                child: const Text(
                                  'Last 7 days',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF6B7280),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          _BarChart(),
                          const SizedBox(height: 12),
                          const Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              _BarLabel('Mon'),
                              _BarLabel('Tue'),
                              _BarLabel('Wed'),
                              _BarLabel('Thu'),
                              _BarLabel('Fri'),
                              _BarLabel('Sat'),
                              _BarLabel('Sun'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // ── Transaction list ──────────────────────────────────
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 14),
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
                          const Padding(
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 12),
                            child: Text(
                              'Recent Transactions',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF111827),
                              ),
                            ),
                          ),
                          const Divider(
                              height: 1, color: Color(0xFFF3F4F6)),
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: _transactions.length,
                            separatorBuilder: (_, __) => const Divider(
                                height: 1, color: Color(0xFFF3F4F6)),
                            itemBuilder: (_, i) =>
                                _TransactionRow(_transactions[i]),
                          ),
                        ],
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

// ── Widgets ───────────────────────────────────────────────────────────────────

class _EarnCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final IconData icon;
  final Color color;
  const _EarnCard({
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 4,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: color, size: 20),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF111827),
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BarChart extends StatelessWidget {
  final List<double> _heights = const [
    0.4, 0.65, 0.5, 0.85, 0.7, 1.0, 0.45
  ];
  final List<bool> _isToday = const [
    false, false, false, false, false, false, true
  ];

  const _BarChart();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: List.generate(7, (i) {
          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: _heights[i] * 70,
                    decoration: BoxDecoration(
                      color: _isToday[i]
                          ? AppColors.primary
                          : AppColors.primary.withValues(alpha: 0.25),
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class _BarLabel extends StatelessWidget {
  final String text;
  const _BarLabel(this.text);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          color: Color(0xFF9CA3AF),
        ),
      ),
    );
  }
}

class _TransactionRow extends StatelessWidget {
  final _EarningEntry entry;
  const _TransactionRow(this.entry);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: const Color(0xFFEBF8F1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: const Icon(Icons.local_shipping_outlined,
                size: 20, color: AppColors.primary),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.customer,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF111827),
                  ),
                ),
                Text(
                  '${entry.orderId}  ·  ${entry.date} ${entry.time}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ),
          Text(
            '+₱${entry.amount.toStringAsFixed(0)}',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _EarningEntry {
  final String orderId;
  final String customer;
  final double amount;
  final String time;
  final String date;

  const _EarningEntry({
    required this.orderId,
    required this.customer,
    required this.amount,
    required this.time,
    required this.date,
  });
}
