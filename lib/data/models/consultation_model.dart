import '../../domain/entities/consultation.dart';

class VitalSignsModel extends VitalSigns {
  VitalSignsModel({
    required String bloodPressure,
    required int heartRate,
    required int respiratoryRate,
    required String temperature,
    required int oxygenSaturation,
    required DateTime recordedAt,
  }) : super(
          bloodPressure: bloodPressure,
          heartRate: heartRate,
          respiratoryRate: respiratoryRate,
          temperature: temperature,
          oxygenSaturation: oxygenSaturation,
          recordedAt: recordedAt,
        );

  factory VitalSignsModel.fromJson(Map<String, dynamic> json) {
    return VitalSignsModel(
      bloodPressure: json['blood_pressure'] ?? '',
      heartRate: json['heart_rate'] ?? 0,
      respiratoryRate: json['respiratory_rate'] ?? 0,
      temperature: json['temperature'] ?? '',
      oxygenSaturation: json['oxygen_saturation'] ?? 0,
      recordedAt: DateTime.parse(json['recorded_at']),
    );
  }
}

class ConsultationModel extends Consultation {
  ConsultationModel({
    required int id,
    required DateTime consultationDate,
    required String chiefComplaint,
    required String history,
    required String physicalExamination,
    required String diagnosis,
    required String treatment,
    required String doctorName,
    required VitalSigns vitalSigns,
    required DateTime createdAt,
  }) : super(
          id: id,
          consultationDate: consultationDate,
          chiefComplaint: chiefComplaint,
          history: history,
          physicalExamination: physicalExamination,
          diagnosis: diagnosis,
          treatment: treatment,
          doctorName: doctorName,
          vitalSigns: vitalSigns,
          createdAt: createdAt,
        );

  factory ConsultationModel.fromJson(Map<String, dynamic> json) {
    return ConsultationModel(
      id: json['id'],
      consultationDate: DateTime.parse(json['consultation_date']),
      chiefComplaint: json['chief_complaint'] ?? '',
      history: json['history'] ?? '',
      physicalExamination: json['physical_examination'] ?? '',
      diagnosis: json['diagnosis'] ?? '',
      treatment: json['treatment'] ?? '',
      doctorName: json['doctor_name'] ?? '',
      vitalSigns: VitalSignsModel.fromJson(json['vital_signs']),
      createdAt: DateTime.parse(json['created_at']),
    );
  }
}
