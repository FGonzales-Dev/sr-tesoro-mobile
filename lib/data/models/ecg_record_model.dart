import '../../domain/entities/ecg_record.dart';

class EcgRecordModel extends EcgRecord {
  EcgRecordModel({
    required int id,
    required DateTime createdAt,
    required String status,
    required int heartRate,
    required String qrsAxis,
    required double prInterval,
    required double qrsDuration,
    required double qtInterval,
    required String ecgReport,
    required String interpretation,
    required String doctorName,
    String? ecgStripUrl,
  }) : super(
          id: id,
          createdAt: createdAt,
          status: status,
          heartRate: heartRate,
          qrsAxis: qrsAxis,
          prInterval: prInterval,
          qrsDuration: qrsDuration,
          qtInterval: qtInterval,
          ecgReport: ecgReport,
          interpretation: interpretation,
          doctorName: doctorName,
          ecgStripUrl: ecgStripUrl,
        );

  factory EcgRecordModel.fromJson(Map<String, dynamic> json) {
    return EcgRecordModel(
      id: json['id'],
      createdAt: DateTime.parse(json['created_at']),
      status: json['status'],
      heartRate: json['heart_rate'],
      qrsAxis: json['qrs_axis'],
      prInterval: (json['pr_interval'] as num).toDouble(),
      qrsDuration: (json['qrs_duration'] as num).toDouble(),
      qtInterval: (json['qt_interval'] as num).toDouble(),
      ecgReport: json['ecg_report'],
      interpretation: json['interpretation'],
      doctorName: json['doctor_name'],
      ecgStripUrl: json['ecg_strip_url'],
    );
  }
}
