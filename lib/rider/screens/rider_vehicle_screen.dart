import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class RiderVehicleScreen extends StatefulWidget {
  const RiderVehicleScreen({super.key});

  @override
  State<RiderVehicleScreen> createState() => _RiderVehicleScreenState();
}

class _RiderVehicleScreenState extends State<RiderVehicleScreen> {
  int _vehicleType = 0; // 0=Motorcycle, 1=Bicycle, 2=Car
  bool _editMode = false;

  final _makeCtrl = TextEditingController(text: 'Honda');
  final _modelCtrl = TextEditingController(text: 'Wave 125');
  final _yearCtrl = TextEditingController(text: '2021');
  final _plateCtrl = TextEditingController(text: 'ABC 1234');
  final _colorCtrl = TextEditingController(text: 'Red');

  @override
  void dispose() {
    for (final c in [
      _makeCtrl,
      _modelCtrl,
      _yearCtrl,
      _plateCtrl,
      _colorCtrl
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  final List<_VehicleType> _types = const [
    _VehicleType(icon: '🏍️', label: 'Motorcycle'),
    _VehicleType(icon: '🚲', label: 'Bicycle'),
    _VehicleType(icon: '🚗', label: 'Car / SUV'),
  ];

  void _save() {
    setState(() => _editMode = false);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Vehicle information saved.',
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
              padding: const EdgeInsets.fromLTRB(8, 12, 8, 14),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.arrow_back,
                        color: Color(0xFF111827)),
                  ),
                  const Expanded(
                    child: Text(
                      'Vehicle Information',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () => setState(() => _editMode = !_editMode),
                    child: Text(
                      _editMode ? 'Cancel' : 'Edit',
                      style: const TextStyle(
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
            const Divider(height: 1, color: Color(0xFFE5E7EB)),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Vehicle type ─────────────────────────────────────
                    Container(
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
                          const Text(
                            'Vehicle Type',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF374151),
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: List.generate(_types.length, (i) {
                              final selected = _vehicleType == i;
                              return Expanded(
                                child: GestureDetector(
                                  onTap: _editMode
                                      ? () => setState(
                                          () => _vehicleType = i)
                                      : null,
                                  child: Container(
                                    margin: EdgeInsets.only(
                                        right: i < _types.length - 1
                                            ? 8
                                            : 0),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    decoration: BoxDecoration(
                                      color: selected
                                          ? const Color(0xFFEBF8F1)
                                          : const Color(0xFFF9FAFB),
                                      borderRadius:
                                          BorderRadius.circular(10),
                                      border: Border.all(
                                        color: selected
                                            ? AppColors.primary
                                            : const Color(0xFFE5E7EB),
                                        width: selected ? 2 : 1,
                                      ),
                                    ),
                                    child: Column(
                                      children: [
                                        Text(
                                          _types[i].icon,
                                          style: const TextStyle(
                                              fontSize: 26),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          _types[i].label,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            fontSize: 11,
                                            fontWeight: selected
                                                ? FontWeight.w700
                                                : FontWeight.w400,
                                            color: selected
                                                ? AppColors.primary
                                                : const Color(
                                                    0xFF6B7280),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    // ── Info fields ──────────────────────────────────────
                    Container(
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
                          const Text(
                            'Vehicle Details',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: [
                              Expanded(
                                child: _VehicleField(
                                  label: 'Make',
                                  ctrl: _makeCtrl,
                                  readOnly: !_editMode,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _VehicleField(
                                  label: 'Model',
                                  ctrl: _modelCtrl,
                                  readOnly: !_editMode,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: _VehicleField(
                                  label: 'Year',
                                  ctrl: _yearCtrl,
                                  readOnly: !_editMode,
                                  inputType: TextInputType.number,
                                ),
                              ),
                              const SizedBox(width: 12),
                              Expanded(
                                child: _VehicleField(
                                  label: 'Color',
                                  ctrl: _colorCtrl,
                                  readOnly: !_editMode,
                                ),
                              ),
                            ],
                          ),
                          _VehicleField(
                            label: 'Plate Number',
                            ctrl: _plateCtrl,
                            readOnly: !_editMode,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    // ── Photos ───────────────────────────────────────────
                    Container(
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
                          const Text(
                            'Vehicle Photos',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF111827),
                            ),
                          ),
                          const SizedBox(height: 14),
                          Row(
                            children: const [
                              _PhotoSlot(label: 'Front'),
                              SizedBox(width: 10),
                              _PhotoSlot(label: 'Side'),
                              SizedBox(width: 10),
                              _PhotoSlot(label: 'Back'),
                            ],
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            'Upload clear, well-lit photos of your vehicle.',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 11,
                              color: Color(0xFF9CA3AF),
                            ),
                          ),
                        ],
                      ),
                    ),
                    if (_editMode) ...[
                      const SizedBox(height: 20),
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
                                borderRadius:
                                    BorderRadius.circular(12)),
                          ),
                          child: const Text(
                            'Save Changes',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
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

class _VehicleType {
  final String icon;
  final String label;
  const _VehicleType({required this.icon, required this.label});
}

class _VehicleField extends StatelessWidget {
  final String label;
  final TextEditingController ctrl;
  final bool readOnly;
  final TextInputType inputType;
  const _VehicleField({
    required this.label,
    required this.ctrl,
    this.readOnly = false,
    this.inputType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF374151),
            ),
          ),
          const SizedBox(height: 6),
          TextField(
            controller: ctrl,
            readOnly: readOnly,
            keyboardType: inputType,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Color(0xFF111827),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor:
                  readOnly ? const Color(0xFFF9FAFB) : Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: AppColors.primary),
              ),
              contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class _PhotoSlot extends StatelessWidget {
  final String label;
  const _PhotoSlot({required this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {},
        child: AspectRatio(
          aspectRatio: 1,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF3F4F6),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: const Color(0xFFE5E7EB),
                style: BorderStyle.solid,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.add_a_photo_outlined,
                    size: 24, color: Color(0xFFD1D5DB)),
                const SizedBox(height: 6),
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
          ),
        ),
      ),
    );
  }
}
