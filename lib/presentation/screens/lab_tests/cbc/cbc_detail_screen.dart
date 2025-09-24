import 'package:flutter/material.dart';
import '../../../../domain/entities/cbc_lab_test.dart';

class CbcDetailScreen extends StatelessWidget {
  final CbcLabTest test;

  const CbcDetailScreen({
    Key? key,
    required this.test,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CBC Details'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Card
            _buildHeaderCard(),
            
            const SizedBox(height: 16),
            
            // Red Blood Cell Parameters
            _buildSectionCard(
              'Red Blood Cell Parameters',
              Icons.favorite,
              Colors.red,
              [
                _buildMeasurementRow('Hemoglobin', test.hemoglobin, 'g/dL'),
                _buildMeasurementRow('Hematocrit', test.hematocrit, '%'),
                _buildMeasurementRow('RBC Count', test.rbcCount, 'M/μL'),
                _buildMeasurementRow('MCV', test.mcv, 'fL'),
                _buildMeasurementRow('MCH', test.mch, 'pg'),
                _buildMeasurementRow('MCHC', test.mchc, 'g/dL'),
                _buildMeasurementRow('RDW-CV', test.rdwCv, '%'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // White Blood Cell Parameters
            _buildSectionCard(
              'White Blood Cell Parameters',
              Icons.biotech,
              Colors.blue,
              [
                _buildMeasurementRow('WBC Count', test.wbcCount, 'K/μL'),
                _buildMeasurementRow('Neutrophils', test.neut, '%'),
                _buildMeasurementRow('Lymphocytes', test.lymp, '%'),
                _buildMeasurementRow('Eosinophils', test.eos, '%'),
                _buildMeasurementRow('Monocytes', test.mono, '%'),
                _buildMeasurementRow('Basophils', test.baso, '%'),
                _buildMeasurementRow('Atypical/Immature', test.atypicalImmat, '%'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Platelet Parameters
            _buildSectionCard(
              'Platelet Parameters',
              Icons.healing,
              Colors.purple,
              [
                _buildMeasurementRow('Platelet Count', test.platelet, 'K/μL'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Additional Information
            if ((test.remarks?.isNotEmpty ?? false) || (test.others?.isNotEmpty ?? false)) ...[
              _buildSectionCard(
                'Additional Information',
                Icons.note,
                Colors.green,
                [
                  if (test.remarks?.isNotEmpty ?? false)
                    _buildInfoRow('Remarks', test.remarks!),
                  if (test.others?.isNotEmpty ?? false)
                    _buildInfoRow('Others', test.others!),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCard() {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Complete Blood Count (CBC)',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: _getStatusColor(test.status),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    test.status.toUpperCase(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Test ID: ${test.id}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Date Accepted: ${test.dateAccepted}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Date Reported: ${test.dateReported}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              'Medtech: ${test.medtechName}',
              style: const TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionCard(String title, IconData icon, Color color, List<Widget> children) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: color, size: 24),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildMeasurementRow(String label, String? value, String unit) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Text(
            '${value ?? 'Not specified'} $unit',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value ?? 'Not specified',
            style: const TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'in_progress':
        return Colors.blue;
      default:
        return Colors.grey;
    }
  }
}
