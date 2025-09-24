import '../../domain/entities/xray.dart';

class XrayModel extends Xray {
  const XrayModel({
    required super.id,
    required super.xrayNumber,
    required super.patient,
    required super.doctor,
    required super.doctorName,
    required super.requestingPhysician,
    required super.radiologicTechnologist,
    required super.radiologicTechnologistName,
    super.image,
    super.imageUrl,
    required super.xrayType,
    required super.xrayTypeName,
    required super.interpretation,
    required super.status,
    required super.createdAt,
    required super.updatedAt,
    required super.createdBy,
  });

  factory XrayModel.fromJson(Map<String, dynamic> json) {
    return XrayModel(
      id: json['id'],
      xrayNumber: json['xray_number'],
      patient: json['patient'],
      doctor: json['doctor'],
      doctorName: json['doctor_name'],
      requestingPhysician: json['requesting_physician'],
      radiologicTechnologist: json['radiologic_technologist'],
      radiologicTechnologistName: json['radiologic_technologist_name'],
      image: json['image'],
      imageUrl: json['image_url'],
      xrayType: json['xray_type'],
      xrayTypeName: json['xray_type_name'],
      interpretation: json['interpretation'] ?? '',
      status: json['status'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      createdBy: json['created_by'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'xray_number': xrayNumber,
      'patient': patient,
      'doctor': doctor,
      'doctor_name': doctorName,
      'requesting_physician': requestingPhysician,
      'radiologic_technologist': radiologicTechnologist,
      'radiologic_technologist_name': radiologicTechnologistName,
      'image': image,
      'image_url': imageUrl,
      'xray_type': xrayType,
      'xray_type_name': xrayTypeName,
      'interpretation': interpretation,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'created_by': createdBy,
    };
  }
}
