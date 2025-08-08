class VitalSigns {
  final String bloodPressure;
  final int heartRate;
  final int respiratoryRate;
  final String temperature;
  final int oxygenSaturation;
  final DateTime recordedAt;

  VitalSigns({
    required this.bloodPressure,
    required this.heartRate,
    required this.respiratoryRate,
    required this.temperature,
    required this.oxygenSaturation,
    required this.recordedAt,
  });
}

class Consultation {
  final int id;
  final DateTime consultationDate;
  final String chiefComplaint;
  final String history;
  final String physicalExamination;
  final String diagnosis;
  final String treatment;
  final String doctorName;
  final VitalSigns vitalSigns;
  final DateTime createdAt;

  Consultation({
    required this.id,
    required this.consultationDate,
    required this.chiefComplaint,
    required this.history,
    required this.physicalExamination,
    required this.diagnosis,
    required this.treatment,
    required this.doctorName,
    required this.vitalSigns,
    required this.createdAt,
  });
}
