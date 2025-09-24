import 'package:flutter/material.dart';
import '../../../../domain/entities/serology_lab_test.dart';

class SerologyDetailScreen extends StatelessWidget {
  final SerologyLabTest test;

  const SerologyDetailScreen({
    Key? key,
    required this.test,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Serology Details'),
        backgroundColor: const Color(0xFF153846),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeaderCard(),
            const SizedBox(height: 16),
            _buildSectionCard(
              'Serology Tests',
              Icons.biotech,
              Colors.blue,
              [
                _buildTestRow('HIV 1&2', test.hiv12),
                _buildTestRow('HBsAg', test.hbsag),
                _buildTestRow('Syphilis', test.syphilis),
                _buildTestRow('Dengue NS1', test.dengueNs1),
                _buildTestRow('Dengue IgM', test.dengueIgm),
                _buildTestRow('Dengue IgG', test.dengueIgg),
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
                    'Serology',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Test ID: ${test.id}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 4),
            Text('Date Accepted: ${test.dateAccepted}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 4),
            Text('Date Reported: ${test.dateReported}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
            const SizedBox(height: 4),
            Text('Medtech: ${test.medtechName}', style: const TextStyle(fontSize: 14, color: Colors.grey)),
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
                Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color)),
              ],
            ),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildTestRow(String label, String result) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(
              color: _getResultColor(result),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              result,
              style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed': return Colors.green;
      case 'pending': return Colors.orange;
      case 'in_progress': return Colors.blue;
      default: return Colors.grey;
    }
  }

  Color _getResultColor(String result) {
    switch (result.toLowerCase()) {
      case 'positive': return Colors.red;
      case 'negative': return Colors.green;
      case 'reactive': return Colors.red;
      case 'non-reactive': return Colors.green;
      default: return Colors.grey;
    }
  }
}
