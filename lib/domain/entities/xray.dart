class Xray {
  final int id;
  final String xrayNumber;
  final int patient;
  final int doctor;
  final String doctorName;
  final String requestingPhysician;
  final int radiologicTechnologist;
  final String radiologicTechnologistName;
  final String? image;
  final String? imageUrl;
  final int xrayType;
  final String xrayTypeName;
  final String interpretation;
  final String status;
  final String createdAt;
  final String updatedAt;
  final int createdBy;

  const Xray({
    required this.id,
    required this.xrayNumber,
    required this.patient,
    required this.doctor,
    required this.doctorName,
    required this.requestingPhysician,
    required this.radiologicTechnologist,
    required this.radiologicTechnologistName,
    this.image,
    this.imageUrl,
    required this.xrayType,
    required this.xrayTypeName,
    required this.interpretation,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
  });
}
