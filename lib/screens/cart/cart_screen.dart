import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';
import '../../screens/home/home_screen.dart';
import '../legal/legal_screen.dart';

class CartScreen extends StatefulWidget {
  final Map<MarketProduct, int> cartItems;

  const CartScreen({super.key, required this.cartItems});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final Map<MarketProduct, int> _items;
  final TextEditingController _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _items = Map.from(widget.cartItems);
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }

  int get _totalItems => _items.values.fold(0, (a, b) => a + b);

  void _increment(MarketProduct product) {
    setState(() => _items[product] = (_items[product] ?? 0) + 1);
  }

  void _decrement(MarketProduct product) {
    setState(() {
      final qty = (_items[product] ?? 0) - 1;
      if (qty <= 0) {
        _items.remove(product);
      } else {
        _items[product] = qty;
      }
    });
  }

  void _remove(MarketProduct product) {
    setState(() => _items.remove(product));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ──────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 20, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF111827),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 4),
                  const Text(
                    'My Cart',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEBF8F1),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$_totalItems Item${_totalItems != 1 ? 's' : ''}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // ── Items list ──────────────────────────────────────────────────
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 20, 16, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Section label
                    const Text(
                      'MARKET ITEMS',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1.2,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Cart items
                    ..._items.entries.map(
                      (e) => _CartItemRow(
                        product: e.key,
                        qty: e.value,
                        onIncrement: () => _increment(e.key),
                        onDecrement: () => _decrement(e.key),
                        onRemove: () => _remove(e.key),
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Pabili Notes section
                    Row(
                      children: const [
                        Icon(Icons.notes, size: 20, color: AppColors.primary),
                        SizedBox(width: 8),
                        Text(
                          'Pabili Notes',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF111827),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(color: const Color(0xFFE5E7EB)),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Custom Instructions',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFFF9FAFB),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: const Color(0xFFE5E7EB),
                              ),
                            ),
                            child: TextField(
                              controller: _notesController,
                              maxLines: 4,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: Color(0xFF374151),
                              ),
                              decoration: const InputDecoration(
                                hintText:
                                    'e.g., Make sure the tilapia is cleaned and scaled. Please pick smaller red onions if possible.',
                                hintStyle: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13,
                                  color: Color(0xFFB0B7C3),
                                  height: 1.5,
                                ),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.all(12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Icon(
                            Icons.info_outline,
                            size: 16,
                            color: Color(0xFF3B82F6),
                          ),
                          SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              "Your shopper will do their best to follow these instructions.",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: Color(0xFF1D4ED8),
                                height: 1.5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            // ── Checkout bar ────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const LegalScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shadowColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Checkout',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 20, color: Colors.white),
                    ],
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

// ── Cart Item Row ─────────────────────────────────────────────────────────────

class _CartItemRow extends StatelessWidget {
  final MarketProduct product;
  final int qty;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;
  final VoidCallback onRemove;

  const _CartItemRow({
    required this.product,
    required this.qty,
    required this.onIncrement,
    required this.onDecrement,
    required this.onRemove,
  });

  String _getProductEmoji(String name) {
    final n = name.toLowerCase();
    if (n.contains('chicken')) return '🍗';
    if (n.contains('onion')) return '🧅';
    if (n.contains('tilapia') || n.contains('bangus') || n.contains('fish')) {
      return '🐟';
    }
    if (n.contains('pechay') || n.contains('veggie')) return '🥬';
    if (n.contains('pork') || n.contains('liempo')) return '🥩';
    if (n.contains('rice')) return '🍚';
    return '🛒';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Product image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: 70,
              height: 70,
              color: product.imageColor,
              child: Center(
                child: Text(
                  _getProductEmoji(product.name),
                  style: const TextStyle(fontSize: 32),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          // Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        product.name,
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF111827),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onRemove,
                      child: const Icon(
                        Icons.delete_outline,
                        size: 20,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
                Text(
                  '${product.brand} • ${product.unit.replaceAll('Per ', '')}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₱${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primary,
                      ),
                    ),
                    // Quantity controls
                    Row(
                      children: [
                        _QtyButton(icon: Icons.remove, onTap: onDecrement),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 14),
                          child: Text(
                            '$qty',
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF111827),
                            ),
                          ),
                        ),
                        _QtyButton(icon: Icons.add, onTap: onIncrement),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _QtyButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _QtyButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 16, color: const Color(0xFF374151)),
      ),
    );
  }
}
