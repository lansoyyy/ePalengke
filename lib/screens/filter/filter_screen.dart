import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  RangeValues _priceRange = const RangeValues(0, 500);
  final Set<String> _selectedCategories = {};
  final Set<String> _selectedBrands = {};
  int _minRating = 0;
  bool _freshOnly = false;
  bool _inStockOnly = false;

  static const _categories = [
    'Meat',
    'Poultry',
    'Seafood',
    'Vegetables',
    'Rice & Grains',
  ];

  static const _brands = ['Local', 'Magnolia', 'Organic', 'Dagupan'];

  int get _activeCount {
    int count = 0;
    if (_priceRange != const RangeValues(0, 500)) count++;
    if (_selectedCategories.isNotEmpty) count++;
    if (_selectedBrands.isNotEmpty) count++;
    if (_minRating > 0) count++;
    if (_freshOnly) count++;
    if (_inStockOnly) count++;
    return count;
  }

  void _reset() {
    setState(() {
      _priceRange = const RangeValues(0, 500);
      _selectedCategories.clear();
      _selectedBrands.clear();
      _minRating = 0;
      _freshOnly = false;
      _inStockOnly = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // ── Header ────────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 12, 20, 0),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close, color: Color(0xFF111827)),
                  ),
                  const Expanded(
                    child: Text(
                      'Filter & Sort',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: _reset,
                    child: const Text(
                      'Reset',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 16, color: Color(0xFFE5E7EB)),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Price range ───────────────────────────────────────
                    _SectionHeader(label: 'Price Range'),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _PriceChip(label: '₱${_priceRange.start.toInt()}'),
                        const Text(
                          '–',
                          style: TextStyle(
                            color: Color(0xFF9CA3AF),
                            fontSize: 16,
                          ),
                        ),
                        _PriceChip(label: '₱${_priceRange.end.toInt()}'),
                      ],
                    ),
                    RangeSlider(
                      values: _priceRange,
                      min: 0,
                      max: 500,
                      divisions: 50,
                      activeColor: AppColors.primary,
                      inactiveColor: const Color(0xFFE5E7EB),
                      onChanged: (v) => setState(() => _priceRange = v),
                    ),
                    const SizedBox(height: 20),
                    // ── Categories ────────────────────────────────────────
                    _SectionHeader(label: 'Category'),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _categories
                          .map(
                            (cat) => _FilterChip(
                              label: cat,
                              isSelected: _selectedCategories.contains(cat),
                              onTap: () {
                                setState(() {
                                  if (_selectedCategories.contains(cat)) {
                                    _selectedCategories.remove(cat);
                                  } else {
                                    _selectedCategories.add(cat);
                                  }
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    // ── Brands ────────────────────────────────────────────
                    _SectionHeader(label: 'Brand'),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _brands
                          .map(
                            (brand) => _FilterChip(
                              label: brand,
                              isSelected: _selectedBrands.contains(brand),
                              onTap: () {
                                setState(() {
                                  if (_selectedBrands.contains(brand)) {
                                    _selectedBrands.remove(brand);
                                  } else {
                                    _selectedBrands.add(brand);
                                  }
                                });
                              },
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    // ── Rating ────────────────────────────────────────────
                    _SectionHeader(label: 'Minimum Rating'),
                    const SizedBox(height: 12),
                    Row(
                      children: [0, 3, 4, 5]
                          .map(
                            (r) => GestureDetector(
                              onTap: () => setState(() => _minRating = r),
                              child: Container(
                                margin: const EdgeInsets.only(right: 10),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 14,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  color: _minRating == r
                                      ? AppColors.primary
                                      : const Color(0xFFF3F4F6),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    if (r > 0) ...[
                                      Icon(
                                        Icons.star_rounded,
                                        size: 14,
                                        color: _minRating == r
                                            ? Colors.white
                                            : const Color(0xFFFBBF24),
                                      ),
                                      const SizedBox(width: 3),
                                    ],
                                    Text(
                                      r == 0 ? 'All' : '$r+',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: _minRating == r
                                            ? Colors.white
                                            : const Color(0xFF374151),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: 20),
                    // ── Toggles ───────────────────────────────────────────
                    _SectionHeader(label: 'Options'),
                    const SizedBox(height: 8),
                    _ToggleRow(
                      label: 'Fresh / Organic only',
                      value: _freshOnly,
                      onChanged: (v) => setState(() => _freshOnly = v),
                    ),
                    _ToggleRow(
                      label: 'In stock only',
                      value: _inStockOnly,
                      onChanged: (v) => setState(() => _inStockOnly = v),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            // ── Apply button ──────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
              color: Colors.white,
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    _activeCount > 0
                        ? 'Apply Filters ($_activeCount active)'
                        : 'Apply Filters',
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
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

// ── Widgets ───────────────────────────────────────────────────────────────────

class _SectionHeader extends StatelessWidget {
  final String label;
  const _SectionHeader({required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontFamily: 'Poppins',
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: Color(0xFF111827),
      ),
    );
  }
}

class _PriceChip extends StatelessWidget {
  final String label;
  const _PriceChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          fontFamily: 'Poppins',
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Color(0xFF111827),
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEBF8F1) : const Color(0xFFF3F4F6),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primary : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 13,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? AppColors.primary : const Color(0xFF374151),
          ),
        ),
      ),
    );
  }
}

class _ToggleRow extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;
  const _ToggleRow({
    required this.label,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Color(0xFF374151),
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
