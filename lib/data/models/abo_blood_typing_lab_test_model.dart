import '../../domain/entities/abo_blood_typing_lab_test.dart';

class AboBloodTypingLabTestModel extends AboBloodTypingLabTest {
  AboBloodTypingLabTestModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          dateAccepted: json['date_accepted'],
          dateReported: json['date_reported'],
          status: json['status'],
          medtechName: json['medtech_name'],
          testType: json['test_type'],
          bloodType: json['blood_type'] ?? '',
          rhFactor: json['rh_factor'] ?? '',
          remarks: json['remarks'] ?? '',
          others: json['others'] ?? '',
        );
}
