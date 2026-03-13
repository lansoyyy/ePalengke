import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class AddressManagementScreen extends StatefulWidget {
  const AddressManagementScreen({super.key});

  @override
  State<AddressManagementScreen> createState() =>
      _AddressManagementScreenState();
}

class _AddressManagementScreenState extends State<AddressManagementScreen> {
  final List<_AddressData> _addresses = [
    _AddressData(
      id: 'addr_1',
      label: 'Home',
      recipientName: 'Juan Dela Cruz',
      phone: '+63 917 123 4567',
      line1: '123 Mapagmahal St.',
      city: 'Quezon City',
      province: 'Metro Manila',
      postal: '1100',
      isDefault: true,
      notes: 'Blue gate near sari-sari store',
    ),
    _AddressData(
      id: 'addr_2',
      label: 'Work',
      recipientName: 'Juan Dela Cruz',
      phone: '+63 917 123 4567',
      line1: '456 Ayala Ave.',
      city: 'Makati',
      province: 'Metro Manila',
      postal: '1226',
      isDefault: false,
      notes: '',
    ),
  ];

  void _setDefault(String id) {
    setState(() {
      for (final a in _addresses) {
        a.isDefault = a.id == id;
      }
    });
  }

  void _deleteAddress(String id) {
    setState(() => _addresses.removeWhere((a) => a.id == id));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text(
          'Address deleted.',
          style: TextStyle(fontFamily: 'Poppins'),
        ),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Color(0xFF374151),
      ),
    );
  }

  void _showAddressForm({_AddressData? existing}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) => _AddressFormSheet(
        existing: existing,
        onSave: (addr) {
          setState(() {
            if (existing != null) {
              final idx = _addresses.indexWhere((a) => a.id == existing.id);
              if (idx >= 0) _addresses[idx] = addr;
            } else {
              _addresses.add(addr);
            }
          });
        },
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
            // ── Header ────────────────────────────────────────────────────
            Container(
              color: AppColors.white,
              padding: const EdgeInsets.fromLTRB(8, 12, 20, 14),
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
                      'My Addresses',
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
            // Add address button
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 14, 16, 0),
              child: SizedBox(
                width: double.infinity,
                height: 48,
                child: OutlinedButton.icon(
                  onPressed: () => _showAddressForm(),
                  icon: const Icon(Icons.add, color: AppColors.primary),
                  label: const Text(
                    'Add New Address',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: AppColors.primary),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: _addresses.isEmpty
                  ? const Center(
                      child: Text(
                        'No addresses saved.',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 15,
                          color: Color(0xFF9CA3AF),
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                      itemCount: _addresses.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, i) {
                        final addr = _addresses[i];
                        return _AddressCard(
                          address: addr,
                          onSetDefault: () => _setDefault(addr.id),
                          onEdit: () => _showAddressForm(existing: addr),
                          onDelete: () => _deleteAddress(addr.id),
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

// ── Data models ───────────────────────────────────────────────────────────────

class _AddressData {
  final String id;
  final String label;
  final String recipientName;
  final String phone;
  final String line1;
  final String city;
  final String province;
  final String postal;
  bool isDefault;
  final String notes;

  _AddressData({
    required this.id,
    required this.label,
    required this.recipientName,
    required this.phone,
    required this.line1,
    required this.city,
    required this.province,
    required this.postal,
    required this.isDefault,
    required this.notes,
  });
}

// ── Address card ──────────────────────────────────────────────────────────────

class _AddressCard extends StatelessWidget {
  final _AddressData address;
  final VoidCallback onSetDefault;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  const _AddressCard({
    required this.address,
    required this.onSetDefault,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: address.isDefault
            ? Border.all(color: AppColors.primary, width: 2)
            : null,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: address.isDefault
                      ? AppColors.primary
                      : const Color(0xFFF3F4F6),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  address.label,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: address.isDefault
                        ? Colors.white
                        : const Color(0xFF374151),
                  ),
                ),
              ),
              if (address.isDefault) ...[
                const SizedBox(width: 8),
                const Icon(
                  Icons.check_circle,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 4),
                const Text(
                  'Default',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
              const Spacer(),
              PopupMenuButton<String>(
                onSelected: (v) {
                  switch (v) {
                    case 'default':
                      onSetDefault();
                      break;
                    case 'edit':
                      onEdit();
                      break;
                    case 'delete':
                      onDelete();
                      break;
                  }
                },
                itemBuilder: (_) => [
                  if (!address.isDefault)
                    const PopupMenuItem(
                      value: 'default',
                      child: Text(
                        'Set as Default',
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                    ),
                  const PopupMenuItem(
                    value: 'edit',
                    child: Text(
                      'Edit',
                      style: TextStyle(fontFamily: 'Poppins'),
                    ),
                  ),
                  const PopupMenuItem(
                    value: 'delete',
                    child: Text(
                      'Delete',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ],
                icon: const Icon(
                  Icons.more_vert,
                  color: Color(0xFF9CA3AF),
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            address.recipientName,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF111827),
            ),
          ),
          const SizedBox(height: 2),
          Text(
            '${address.line1}, ${address.city}, ${address.province} ${address.postal}',
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              color: Color(0xFF6B7280),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            address.phone,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 12,
              color: Color(0xFF9CA3AF),
            ),
          ),
          if (address.notes.isNotEmpty) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  size: 13,
                  color: Color(0xFF9CA3AF),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    address.notes,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12,
                      color: Color(0xFF9CA3AF),
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ],
      ),
    );
  }
}

// ── Address form sheet ────────────────────────────────────────────────────────

class _AddressFormSheet extends StatefulWidget {
  final _AddressData? existing;
  final ValueChanged<_AddressData> onSave;
  const _AddressFormSheet({this.existing, required this.onSave});

  @override
  State<_AddressFormSheet> createState() => _AddressFormSheetState();
}

class _AddressFormSheetState extends State<_AddressFormSheet> {
  final _labelCtrl = TextEditingController();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _line1Ctrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _provinceCtrl = TextEditingController();
  final _postalCtrl = TextEditingController();
  final _notesCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    final e = widget.existing;
    if (e != null) {
      _labelCtrl.text = e.label;
      _nameCtrl.text = e.recipientName;
      _phoneCtrl.text = e.phone;
      _line1Ctrl.text = e.line1;
      _cityCtrl.text = e.city;
      _provinceCtrl.text = e.province;
      _postalCtrl.text = e.postal;
      _notesCtrl.text = e.notes;
    }
  }

  @override
  void dispose() {
    for (final c in [
      _labelCtrl,
      _nameCtrl,
      _phoneCtrl,
      _line1Ctrl,
      _cityCtrl,
      _provinceCtrl,
      _postalCtrl,
      _notesCtrl,
    ]) {
      c.dispose();
    }
    super.dispose();
  }

  void _save() {
    final addr = _AddressData(
      id:
          widget.existing?.id ??
          'addr_${DateTime.now().millisecondsSinceEpoch}',
      label: _labelCtrl.text.isEmpty ? 'Home' : _labelCtrl.text,
      recipientName: _nameCtrl.text,
      phone: _phoneCtrl.text,
      line1: _line1Ctrl.text,
      city: _cityCtrl.text,
      province: _provinceCtrl.text,
      postal: _postalCtrl.text,
      isDefault: widget.existing?.isDefault ?? false,
      notes: _notesCtrl.text,
    );
    widget.onSave(addr);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.existing == null ? 'Add New Address' : 'Edit Address',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF111827),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Color(0xFF9CA3AF)),
                ),
              ],
            ),
            const SizedBox(height: 16),
            _FormField(label: 'Label (e.g. Home, Work)', ctrl: _labelCtrl),
            _FormField(label: 'Recipient Name', ctrl: _nameCtrl),
            _FormField(
              label: 'Phone Number',
              ctrl: _phoneCtrl,
              inputType: TextInputType.phone,
            ),
            _FormField(label: 'Street Address', ctrl: _line1Ctrl),
            Row(
              children: [
                Expanded(
                  child: _FormField(label: 'City', ctrl: _cityCtrl),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _FormField(label: 'Province', ctrl: _provinceCtrl),
                ),
              ],
            ),
            _FormField(
              label: 'Postal Code',
              ctrl: _postalCtrl,
              inputType: TextInputType.number,
            ),
            _FormField(
              label: 'Delivery Notes (optional)',
              ctrl: _notesCtrl,
              maxLines: 2,
            ),
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
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Save Address',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
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

class _FormField extends StatelessWidget {
  final String label;
  final TextEditingController ctrl;
  final TextInputType inputType;
  final int maxLines;
  const _FormField({
    required this.label,
    required this.ctrl,
    this.inputType = TextInputType.text,
    this.maxLines = 1,
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
            keyboardType: inputType,
            maxLines: maxLines,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: Color(0xFF111827),
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFF9FAFB),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Color(0xFFE5E7EB)),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
