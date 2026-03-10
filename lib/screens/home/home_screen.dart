import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../cart/cart_screen.dart';
import '../chat/customer_chat_list_screen.dart';
import '../search/search_screen.dart';
import '../profile/customer_profile_screen.dart';
import '../product_details/product_details_screen.dart';

// ── Data model ───────────────────────────────────────────────────────────────

class MarketProduct {
  final String name;
  final String brand;
  final String unit;
  final double price;
  final double? changePercent; // positive = up, negative = down, null = none
  final bool isFresh;
  final Color imageColor;
  final IconData imageIcon;

  const MarketProduct({
    required this.name,
    required this.brand,
    required this.unit,
    required this.price,
    this.changePercent,
    this.isFresh = false,
    required this.imageColor,
    required this.imageIcon,
  });
}

const List<MarketProduct> products = [
  MarketProduct(
    name: 'Whole Chicken',
    brand: 'Magnolia',
    unit: 'Per Kilo',
    price: 190,
    isFresh: true,
    imageColor: Color(0xFF2A2A2A),
    imageIcon: Icons.set_meal,
  ),
  MarketProduct(
    name: 'Red Onions',
    brand: 'Local',
    unit: 'Per Kilo',
    price: 140,
    changePercent: 5,
    imageColor: Color(0xFF1A0A0A),
    imageIcon: Icons.circle,
  ),
  MarketProduct(
    name: 'Fresh Tilapia',
    brand: 'Local',
    unit: 'Per Kilo',
    price: 120,
    imageColor: Color(0xFF1A2A3A),
    imageIcon: Icons.water,
  ),
  MarketProduct(
    name: 'Pechay',
    brand: 'Organic',
    unit: 'Per Bundle',
    price: 90,
    changePercent: -2,
    imageColor: Color(0xFF1A3020),
    imageIcon: Icons.eco,
  ),
  MarketProduct(
    name: 'Pork Liempo',
    brand: 'Local',
    unit: 'Per Kilo',
    price: 280,
    isFresh: true,
    imageColor: Color(0xFF3A1A1A),
    imageIcon: Icons.lunch_dining,
  ),
  MarketProduct(
    name: 'Bangus',
    brand: 'Dagupan',
    unit: 'Per Kilo',
    price: 160,
    changePercent: 3,
    imageColor: Color(0xFF10202A),
    imageIcon: Icons.waves,
  ),
];

const List<_Category> _categories = [
  _Category(label: 'Meat', emoji: '🥩'),
  _Category(label: 'Poultry', emoji: '🍗'),
  _Category(label: 'Seafood', emoji: '🐟'),
  _Category(label: 'Veggies', emoji: '🥬'),
  _Category(label: 'Rice', emoji: '🍚'),
];

class _Category {
  final String label;
  final String emoji;
  const _Category({required this.label, required this.emoji});
}

// ── Screen ───────────────────────────────────────────────────────────────────

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedCategory = 0;
  final Map<int, int> _cartItems = {};

  int get _cartCount => _cartItems.values.fold(0, (a, b) => a + b);
  double get _cartTotal {
    double total = 0;
    _cartItems.forEach((idx, qty) {
      total += products[idx].price * qty;
    });
    return total;
  }

  void _addToCart(int index) {
    setState(() {
      _cartItems[index] = (_cartItems[index] ?? 0) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                // ── Header ──────────────────────────────────────────────────
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'ePalengke',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF0D1B2A),
                                ),
                              ),
                              Text(
                                'Daily Price Watch',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF6B7280),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Bell icon
                        Stack(
                          children: [
                            Container(
                              width: 42,
                              height: 42,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F4F6),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.notifications_outlined,
                                size: 22,
                                color: Color(0xFF374151),
                              ),
                            ),
                            Positioned(
                              right: 8,
                              top: 8,
                              child: Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(width: 10),
                        // Chat icon
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) => const CustomerChatListScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: const Color(0xFFF3F4F6),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Icon(
                              Icons.chat_bubble_outline,
                              size: 22,
                              color: Color(0xFF374151),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        // Avatar
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    const CustomerProfileScreen(),
                              ),
                            );
                          },
                          child: Container(
                            width: 42,
                            height: 42,
                            decoration: BoxDecoration(
                              color: const Color(0xFFE0D6CC),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text(
                                '👨\u200d💼',
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ── Search bar ──────────────────────────────────────────────
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 18, 20, 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const SearchScreen(),
                          ),
                        );
                      },
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: const [
                            SizedBox(width: 14),
                            Icon(
                              Icons.search,
                              color: Color(0xFF9CA3AF),
                              size: 22,
                            ),
                            SizedBox(width: 10),
                            Text(
                              'Search for meat, veggies, rice...',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 14,
                                color: Color(0xFF9CA3AF),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                // ── Categories ──────────────────────────────────────────────
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 22),
                    child: SizedBox(
                      height: 90,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        itemCount: _categories.length,
                        separatorBuilder: (_, __) => const SizedBox(width: 16),
                        itemBuilder: (context, i) {
                          final cat = _categories[i];
                          final isSelected = _selectedCategory == i;
                          return GestureDetector(
                            onTap: () => setState(() => _selectedCategory = i),
                            child: Column(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 200),
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? const Color(0xFFEBF8F1)
                                        : const Color(0xFFF3F4F6),
                                    shape: BoxShape.circle,
                                    border: isSelected
                                        ? Border.all(
                                            color: AppColors.primary,
                                            width: 2.5,
                                          )
                                        : null,
                                  ),
                                  child: Center(
                                    child: Text(
                                      cat.emoji,
                                      style: const TextStyle(fontSize: 26),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  cat.label,
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 12,
                                    fontWeight: isSelected
                                        ? FontWeight.w600
                                        : FontWeight.w400,
                                    color: isSelected
                                        ? AppColors.primary
                                        : const Color(0xFF6B7280),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                // ── Section header ──────────────────────────────────────────
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        Text(
                          'Fresh Market',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF0D1B2A),
                          ),
                        ),
                        Text(
                          'Updated: Today, 7:00 AM',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            fontWeight: FontWeight.w400,
                            fontStyle: FontStyle.italic,
                            color: Color(0xFF9CA3AF),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // ── Product grid ─────────────────────────────────────────────
                SliverPadding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 120),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.65,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                        ),
                    delegate: SliverChildBuilderDelegate(
                      (context, i) => _ProductCard(
                        product: products[i],
                        cartQty: _cartItems[i] ?? 0,
                        onAdd: () => _addToCart(i),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => ProductDetailsScreen(
                                product: products[i],
                                initialIndex: i,
                              ),
                            ),
                          );
                        },
                      ),
                      childCount: products.length,
                    ),
                  ),
                ),
              ],
            ),
            // ── Floating cart bar ────────────────────────────────────────────
            if (_cartCount > 0)
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CartScreen(
                          cartItems: _cartItems.map(
                            (k, v) => MapEntry(products[k], v),
                          ),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    decoration: BoxDecoration(
                      color: const Color(0xFF0D1B2A),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '$_cartCount',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Total',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 11,
                                  color: Colors.white54,
                                ),
                              ),
                              Text(
                                '₱${_cartTotal.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          const Text(
                            'Go to Cart  →',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
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

// ── Product Card ─────────────────────────────────────────────────────────────

class _ProductCard extends StatelessWidget {
  final MarketProduct product;
  final int cartQty;
  final VoidCallback onAdd;
  final VoidCallback? onTap;

  const _ProductCard({
    required this.product,
    required this.cartQty,
    required this.onAdd,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.07),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image section
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(16),
                ),
                child: Container(
                  height: 130,
                  width: double.infinity,
                  color: product.imageColor,
                  child: Center(
                    child: Text(
                      _getProductEmoji(product.name),
                      style: const TextStyle(fontSize: 52),
                    ),
                  ),
                ),
              ),
              if (product.isFresh)
                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Text(
                      'FRESH',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          // Info section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    '${product.unit} • ${product.brand}',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 11,
                      color: Color(0xFF9CA3AF),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '₱${product.price.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primary,
                        ),
                      ),
                      if (product.changePercent != null) ...[
                        const SizedBox(width: 5),
                        _ChangeChip(percent: product.changePercent!),
                      ],
                    ],
                  ),
                  const Text(
                    'Ref: DA Daily Price Watch',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 9.5,
                      color: Color(0xFFB0B7C3),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  const Spacer(),
                  // Add button
                  GestureDetector(
                    onTap: onAdd,
                    child: Container(
                      width: double.infinity,
                      height: 34,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF3F4F6),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          cartQty > 0 ? '+ Add (×$cartQty)' : '+ Add',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: cartQty > 0
                                ? AppColors.primary
                                : const Color(0xFF374151),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),   // Container
  );     // GestureDetector
  } // build

  String _getProductEmoji(String name) {
    final n = name.toLowerCase();
    if (n.contains('chicken')) return '🍗';
    if (n.contains('onion')) return '🧅';
    if (n.contains('tilapia') || n.contains('bangus') || n.contains('fish')) {
      return '🐟';
    }
    if (n.contains('pechay') || n.contains('veggie') || n.contains('vegeta')) {
      return '🥬';
    }
    if (n.contains('pork') || n.contains('liempo')) return '🥩';
    if (n.contains('rice')) return '🍚';
    return '🛒';
  }
}

class _ChangeChip extends StatelessWidget {
  final double percent;
  const _ChangeChip({required this.percent});

  @override
  Widget build(BuildContext context) {
    final isUp = percent > 0;
    return Row(
      children: [
        Icon(
          isUp ? Icons.trending_up : Icons.trending_down,
          size: 13,
          color: isUp ? const Color(0xFFEF4444) : const Color(0xFF6B7280),
        ),
        Text(
          '${isUp ? '+' : ''}${percent.toStringAsFixed(0)}%',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: isUp ? const Color(0xFFEF4444) : const Color(0xFF6B7280),
          ),
        ),
      ],
    );
  }
}
