import 'package:flutter/material.dart';
import '../../../../domain/entities/urinalysis_lab_test.dart';

class UrinalysisDetailScreen extends StatelessWidget {
  final UrinalysisLabTest test;

  const UrinalysisDetailScreen({Key? key, required this.test}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Urinalysis Details'),
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
            _buildSectionCard('Physical Examination', Icons.visibility, Colors.yellow, [
              _buildInfoRow('Color', test.color),
              _buildInfoRow('Clarity', test.clarity),
              _buildInfoRow('Specific Gravity', test.specificGravity),
              _buildInfoRow('pH', test.ph),
            ]),
            const SizedBox(height: 16),
            _buildSectionCard('Chemical Tests', Icons.science, Colors.blue, [
              _buildInfoRow('Leukocytes', test.leukocytes),
              _buildInfoRow('Nitrites', test.nitrites),
              _buildInfoRow('Protein', test.protein),
              _buildInfoRow('Glucose', test.glucose),
              _buildInfoRow('Ketones', test.ketones),
              _buildInfoRow('Urobilinogen', test.urobilinogen),
              _buildInfoRow('Bilirubin', test.bilirubin),
              _buildInfoRow('Blood', test.blood),
            ]),
            const SizedBox(height: 16),
            _buildSectionCard('Microscopic Examination', Icons.visibility, Colors.green, [
              _buildInfoRow('Red Blood Cells', test.redBloodCells),
              _buildInfoRow('White Blood Cells', test.whiteBloodCells),
              _buildInfoRow('Squamous Cells', test.squamousCells),
              _buildInfoRow('Amorphous', test.amorphous),
              _buildInfoRow('Mucus', test.mucus),
              _buildInfoRow('Casts', test.casts),
              _buildInfoRow('Crystals', test.crystals),
              _buildInfoRow('Bacteria', test.bacteria),
            ]),
            if ((test.remarks?.isNotEmpty ?? false) || (test.others?.isNotEmpty ?? false)) ...[
              const SizedBox(height: 16),
              _buildSectionCard('Additional Information', Icons.note, Colors.purple, [
                if (test.remarks?.isNotEmpty ?? false) _buildInfoRow('Remarks', test.remarks!),
                if (test.others?.isNotEmpty ?? false) _buildInfoRow('Others', test.others!),
              ]),
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
                Expanded(child: Text('Urinalysis', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(color: _getStatusColor(test.status), borderRadius: BorderRadius.circular(16)),
                  child: Text(test.status.toUpperCase(), style: const TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
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
            Row(children: [Icon(icon, color: color, size: 24), const SizedBox(width: 8), Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: color))]),
            const SizedBox(height: 16),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500))),
          Text(value ?? 'Not specified', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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
}
