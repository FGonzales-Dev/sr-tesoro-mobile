import 'package:flutter/material.dart';
import '../../../domain/entities/ecg_record.dart';
import 'ecg_detail_screen.dart';

class EcgCard extends StatelessWidget {
  final EcgRecord record;

  const EcgCard({
    Key? key,
    required this.record,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EcgDetailScreen(record: record),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            // Left side - ECG information
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date
                  _buildInfoRow(
                    icon: Icons.calendar_today,
                    label: 'Date',
                    value: '${record.createdAt.day}/${record.createdAt.month}/${record.createdAt.year}',
                  ),
                  const SizedBox(height: 8),
                  
                  // Doctor
                  _buildInfoRow(
                    icon: Icons.person,
                    label: 'Doctor',
                    value: record.doctorName,
                  ),
                  const SizedBox(height: 8),
                  
                  // Status
                  _buildInfoRow(
                    icon: Icons.info,
                    label: 'Status',
                    value: record.status,
                    valueColor: _getStatusColor(record.status),
                  ),
                ],
              ),
            ),
            
            // Right side - Arrow icon
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    Color? valueColor,
  }) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 14,
              color: valueColor ?? Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'completed':
        return Colors.green;
      case 'pending':
        return Colors.orange;
      case 'for_reading':
        return Colors.blue;
      default:
        return Colors.black87;
    }
  }
}
