import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import 'rider_finalize_receipt_screen.dart';

// ── Data model ────────────────────────────────────────────────────────────────

enum JobBadge { none, urgent, highValue }

class RiderJob {
  final String customerName;
  final String avatarEmoji;
  final double rating;
  final int deliveries;
  final double distanceKm;
  final int etaMins;
  final double cashUpfront;
  final JobBadge badge;

  const RiderJob({
    required this.customerName,
    required this.avatarEmoji,
    required this.rating,
    required this.deliveries,
    required this.distanceKm,
    required this.etaMins,
    required this.cashUpfront,
    this.badge = JobBadge.none,
  });
}

const List<RiderJob> _allJobs = [
  RiderJob(
    customerName: 'Juan Dela Cruz',
    avatarEmoji: '👨‍💼',
    rating: 4.9,
    deliveries: 124,
    distanceKm: 2.4,
    etaMins: 15,
    cashUpfront: 850,
    badge: JobBadge.urgent,
  ),
  RiderJob(
    customerName: 'Maria Santos',
    avatarEmoji: '👩',
    rating: 4.8,
    deliveries: 56,
    distanceKm: 1.1,
    etaMins: 8,
    cashUpfront: 320,
  ),
  RiderJob(
    customerName: 'Ricardo Gomez',
    avatarEmoji: '👨‍🦱',
    rating: 5.0,
    deliveries: 210,
    distanceKm: 4.1,
    etaMins: 25,
    cashUpfront: 1200,
    badge: JobBadge.highValue,
  ),
];

// ── Screen ────────────────────────────────────────────────────────────────────

class RiderJobsScreen extends StatefulWidget {
  const RiderJobsScreen({super.key});

  @override
  State<RiderJobsScreen> createState() => _RiderJobsScreenState();
}

class _RiderJobsScreenState extends State<RiderJobsScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<RiderJob> get _nearbyJobs =>
      _allJobs.where((j) => j.distanceKm <= 1.5).toList();

  List<RiderJob> get _highValueJobs =>
      _allJobs.where((j) => j.cashUpfront >= 1000).toList();

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
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          color: const Color(0xFFEBF8F1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: const Center(
                          child: Text('🛒', style: TextStyle(fontSize: 22)),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Available Jobs',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 20,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF111827),
                              ),
                            ),
                            Text(
                              'EPALENGKE RIDER',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 10,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 1.0,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 8),
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: const [
                            Text(
                              'WALLET BALANCE',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 9,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5,
                                color: Colors.white70,
                              ),
                            ),
                            Text(
                              '₱1,250.00',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  // Tab bar
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
                    indicatorWeight: 3,
                    tabs: const [
                      Tab(text: 'All Jobs'),
                      Tab(text: 'Nearby'),
                      Tab(text: 'High Value'),
                    ],
                  ),
                ],
              ),
            ),
            // ── Updated timestamp ─────────────────────────────────────────
            Container(
              color: const Color(0xFFF3F4F6),
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.sync, size: 14, color: Color(0xFF9CA3AF)),
                  SizedBox(width: 6),
                  Text(
                    'Updated 1 min ago',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                ],
              ),
            ),
            // ── Tab content ───────────────────────────────────────────────
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _JobList(jobs: _allJobs),
                  _JobList(jobs: _nearbyJobs),
                  _JobList(jobs: _highValueJobs),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Job List ──────────────────────────────────────────────────────────────────

class _JobList extends StatelessWidget {
  final List<RiderJob> jobs;
  const _JobList({required this.jobs});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          children: [
            ...jobs.map((job) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: _JobCard(job: job),
                )),
            // ── Footer: checking for jobs ──────────────────────────────
            const SizedBox(height: 20),
            Column(
              children: [
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE5E7EB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.inventory_2_outlined,
                    size: 28,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                const SizedBox(height: 14),
                const Text(
                  'Checking for more jobs…',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'New orders from nearby markets appear\nhere automatically.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    color: Color(0xFF9CA3AF),
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ],
        ),
        // FAB refresh
        Positioned(
          bottom: 24,
          right: 16,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: AppColors.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withValues(alpha: 0.35),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: const Icon(Icons.refresh, color: Colors.white, size: 22),
            ),
          ),
        ),
      ],
    );
  }
}

// ── Job Card ──────────────────────────────────────────────────────────────────

class _JobCard extends StatelessWidget {
  final RiderJob job;
  const _JobCard({required this.job});

  @override
  Widget build(BuildContext context) {
    final isHighValue = job.badge == JobBadge.highValue;
    final isUrgent = job.badge == JobBadge.urgent;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Customer row
            Row(
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: Color(0xFFE0D6CC),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      job.avatarEmoji,
                      style: const TextStyle(fontSize: 26),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job.customerName,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star_rounded,
                            size: 14,
                            color: Color(0xFFFBBF24),
                          ),
                          const SizedBox(width: 3),
                          Text(
                            '${job.rating} (${job.deliveries} successful deliveries)',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 12,
                              color: Color(0xFF6B7280),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                if (isUrgent) _Badge(label: 'URGENT', color: const Color(0xFF6B7280)),
                if (isHighValue)
                  _Badge(
                    label: 'HIGH\nVALUE',
                    color: const Color(0xFFF59E0B),
                    bg: const Color(0xFFFFFBEB),
                  ),
              ],
            ),
            const SizedBox(height: 14),
            // Info row
            Row(
              children: [
                Expanded(
                  child: _InfoBox(
                    label: 'ROUTE INFO',
                    child: Row(
                      children: [
                        const Icon(Icons.location_on_outlined,
                            size: 15, color: AppColors.primary),
                        const SizedBox(width: 4),
                        Text(
                          '${job.distanceKm}km • ${job.etaMins} mins',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _InfoBox(
                    label: 'CASH UPFRONT NEEDED',
                    labelColor: isHighValue
                        ? const Color(0xFFF59E0B)
                        : AppColors.primary,
                    bg: isHighValue
                        ? const Color(0xFFFFFBEB)
                        : const Color(0xFFF0FAF4),
                    child: Row(
                      children: [
                        Icon(
                          Icons.payments_outlined,
                          size: 15,
                          color: isHighValue
                              ? const Color(0xFFF59E0B)
                              : AppColors.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '₱${job.cashUpfront.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: isHighValue
                                ? const Color(0xFFF59E0B)
                                : AppColors.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            // Accept button
            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (_) => const RiderFinalizeReceiptScreen(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Accept Job',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(width: 6),
                    Icon(Icons.chevron_right, size: 20),
                  ],
                ),
              ),
            ),
            if (isHighValue) ...[
              const SizedBox(height: 8),
              const Center(
                child: Text(
                  'Note: High abono requires sufficient wallet balance',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String label;
  final Color color;
  final Color? bg;

  const _Badge({required this.label, required this.color, this.bg});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bg ?? const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'Poppins',
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: color,
          height: 1.3,
        ),
      ),
    );
  }
}

class _InfoBox extends StatelessWidget {
  final String label;
  final Color labelColor;
  final Color bg;
  final Widget child;

  const _InfoBox({
    required this.label,
    this.labelColor = const Color(0xFF9CA3AF),
    this.bg = const Color(0xFFF9FAFB),
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 9,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
              color: labelColor,
            ),
          ),
          const SizedBox(height: 4),
          child,
        ],
      ),
    );
  }
}
