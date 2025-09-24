import 'package:flutter/material.dart';
import '../../../../domain/entities/chemistry_lab_test.dart';

class ChemistryDetailScreen extends StatelessWidget {
  final ChemistryLabTest test;

  const ChemistryDetailScreen({
    Key? key,
    required this.test,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chemistry Panel Details'),
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
            
            // Glucose
            _buildSectionCard(
              'Glucose',
              Icons.local_drink,
              Colors.blue,
              [
                _buildMeasurementRow('Glucose', test.glucose, 'mg/dL'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Lipid Profile
            _buildSectionCard(
              'Lipid Profile',
              Icons.opacity,
              Colors.orange,
              [
                _buildMeasurementRow('Cholesterol', test.cholesterol, 'mg/dL'),
                _buildMeasurementRow('HDL', test.hdl, 'mg/dL'),
                _buildMeasurementRow('LDL', test.ldl, 'mg/dL'),
                _buildMeasurementRow('VLDL', test.vldl, 'mg/dL'),
                _buildMeasurementRow('Triglyceride', test.triglyceride, 'mg/dL'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Kidney Function
            _buildSectionCard(
              'Kidney Function',
              Icons.healing,
              Colors.green,
              [
                _buildMeasurementRow('Creatinine', test.creatinine, 'mg/dL'),
                _buildMeasurementRow('BUN', test.bun, 'mg/dL'),
              ],
            ),
            
            const SizedBox(height: 16),
            
            // Other Parameters
            _buildSectionCard(
              'Other Parameters',
              Icons.science,
              Colors.purple,
              [
                _buildMeasurementRow('Blood Uric Acid', test.bloodUricAcid, 'mg/dL'),
              ],
            ),
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
                    'Chemistry Panel',
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
