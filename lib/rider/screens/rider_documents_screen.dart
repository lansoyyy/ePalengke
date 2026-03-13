import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class RiderDocumentsScreen extends StatefulWidget {
  const RiderDocumentsScreen({super.key});

  @override
  State<RiderDocumentsScreen> createState() => _RiderDocumentsScreenState();
}

class _RiderDocumentsScreenState extends State<RiderDocumentsScreen> {
  final List<_DocumentItem> _documents = [
    _DocumentItem(
      title: "Driver's License",
      subtitle: 'Both front and back',
      status: _DocStatus.verified,
      uploadedAt: 'Jun 10, 2024',
    ),
    _DocumentItem(
      title: 'OR/CR (Official Receipt / Certificate of Registration)',
      subtitle: 'Latest registration',
      status: _DocStatus.verified,
      uploadedAt: 'Jun 10, 2024',
    ),
    _DocumentItem(
      title: 'NBI Clearance',
      subtitle: 'Issued within 6 months',
      status: _DocStatus.pending,
      uploadedAt: 'Jun 14, 2024',
    ),
    _DocumentItem(
      title: 'Barangay Clearance',
      subtitle: 'From your home barangay',
      status: _DocStatus.rejected,
      uploadedAt: 'Jun 11, 2024',
      rejectionReason: 'Document is expired. Please resubmit a current copy.',
    ),
    _DocumentItem(
      title: 'Proof of Address',
      subtitle: 'Utility bill or bank statement',
      status: _DocStatus.notUploaded,
      uploadedAt: null,
    ),
    _DocumentItem(
      title: 'Selfie with ID',
      subtitle: 'Face visible with valid ID',
      status: _DocStatus.notUploaded,
      uploadedAt: null,
    ),
  ];

  int get _verifiedCount =>
      _documents.where((d) => d.status == _DocStatus.verified).length;
  int get _pendingCount =>
      _documents.where((d) => d.status == _DocStatus.pending).length;

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
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Color(0xFF111827),
                    ),
                  ),
                  const Expanded(
                    child: Text(
                      'My Documents',
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
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    // ── Progress summary ─────────────────────────────────
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
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Verification Progress',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF111827),
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Text(
                                      '$_verifiedCount of ${_documents.length} documents verified',
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 12,
                                        color: Color(0xFF9CA3AF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text(
                                '${(_verifiedCount / _documents.length * 100).toStringAsFixed(0)}%',
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: LinearProgressIndicator(
                              value: _verifiedCount / _documents.length,
                              backgroundColor: const Color(0xFFE5E7EB),
                              color: AppColors.primary,
                              minHeight: 6,
                            ),
                          ),
                          if (_pendingCount > 0) ...[
                            const SizedBox(height: 10),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFF7ED),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.hourglass_top,
                                    size: 14,
                                    color: Color(0xFFF59E0B),
                                  ),
                                  const SizedBox(width: 6),
                                  Text(
                                    '$_pendingCount document(s) under review',
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 11,
                                      color: Color(0xFF92400E),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ],
                      ),
                    ),
                    const SizedBox(height: 14),
                    // ── Document list ────────────────────────────────────
                    ...List.generate(_documents.length, (i) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: _DocumentCard(
                          doc: _documents[i],
                          onUpload: () {
                            setState(() {
                              _documents[i] = _DocumentItem(
                                title: _documents[i].title,
                                subtitle: _documents[i].subtitle,
                                status: _DocStatus.pending,
                                uploadedAt: 'Today',
                              );
                            });
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  '${_documents[i].title} uploaded.',
                                  style: const TextStyle(fontFamily: 'Poppins'),
                                ),
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: AppColors.primary,
                              ),
                            );
                          },
                        ),
                      );
                    }),
                    const SizedBox(height: 12),
                    // ── Note ─────────────────────────────────────────────
                    Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEFF6FF),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFBFDBFE),
                          width: 1,
                        ),
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
                              'All documents are reviewed within 1–2 business days. Make sure photos are clear and legible.',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 11,
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
          ],
        ),
      ),
    );
  }
}

// ── Document card ─────────────────────────────────────────────────────────────

class _DocumentCard extends StatelessWidget {
  final _DocumentItem doc;
  final VoidCallback onUpload;
  const _DocumentCard({required this.doc, required this.onUpload});

  @override
  Widget build(BuildContext context) {
    final badge = _statusBadge(doc.status);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.04), blurRadius: 6),
        ],
        border: doc.status == _DocStatus.rejected
            ? Border.all(color: AppColors.error.withValues(alpha: 0.4))
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: badge.bgColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(badge.icon, size: 22, color: badge.color),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doc.title,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF111827),
                      ),
                    ),
                    Text(
                      doc.subtitle,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        color: Color(0xFF9CA3AF),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badge.bgColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(
                  badge.label,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: badge.color,
                  ),
                ),
              ),
            ],
          ),
          if (doc.uploadedAt != null) ...[
            const SizedBox(height: 8),
            Row(
              children: [
                const Icon(
                  Icons.access_time,
                  size: 12,
                  color: Color(0xFF9CA3AF),
                ),
                const SizedBox(width: 4),
                Text(
                  'Uploaded: ${doc.uploadedAt}',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 11,
                    color: Color(0xFF9CA3AF),
                  ),
                ),
              ],
            ),
          ],
          if (doc.status == _DocStatus.rejected &&
              doc.rejectionReason != null) ...[
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFFFEF2F2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    size: 14,
                    color: AppColors.error,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      doc.rejectionReason!,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 11,
                        color: AppColors.error,
                        height: 1.4,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          if (doc.status == _DocStatus.notUploaded ||
              doc.status == _DocStatus.rejected) ...[
            const SizedBox(height: 12),
            SizedBox(
              width: double.infinity,
              height: 42,
              child: ElevatedButton.icon(
                onPressed: onUpload,
                icon: const Icon(Icons.upload_file, size: 16),
                label: Text(
                  doc.status == _DocStatus.rejected
                      ? 'Resubmit Document'
                      : 'Upload Document',
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: doc.status == _DocStatus.rejected
                      ? AppColors.error
                      : AppColors.primary,
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  _Badge _statusBadge(_DocStatus status) {
    switch (status) {
      case _DocStatus.verified:
        return _Badge(
          label: 'VERIFIED',
          color: AppColors.primary,
          bgColor: const Color(0xFFEBF8F1),
          icon: Icons.verified,
        );
      case _DocStatus.pending:
        return _Badge(
          label: 'PENDING',
          color: const Color(0xFFF59E0B),
          bgColor: const Color(0xFFFFF7ED),
          icon: Icons.hourglass_top,
        );
      case _DocStatus.rejected:
        return _Badge(
          label: 'REJECTED',
          color: AppColors.error,
          bgColor: const Color(0xFFFEF2F2),
          icon: Icons.cancel,
        );
      case _DocStatus.notUploaded:
        return _Badge(
          label: 'REQUIRED',
          color: const Color(0xFF6B7280),
          bgColor: const Color(0xFFF3F4F6),
          icon: Icons.upload_file,
        );
    }
  }
}

// ── Data models ───────────────────────────────────────────────────────────────

enum _DocStatus { verified, pending, rejected, notUploaded }

class _DocumentItem {
  final String title;
  final String subtitle;
  final _DocStatus status;
  final String? uploadedAt;
  final String? rejectionReason;

  const _DocumentItem({
    required this.title,
    required this.subtitle,
    required this.status,
    required this.uploadedAt,
    this.rejectionReason,
  });
}

class _Badge {
  final String label;
  final Color color;
  final Color bgColor;
  final IconData icon;
  const _Badge({
    required this.label,
    required this.color,
    required this.bgColor,
    required this.icon,
  });
}
