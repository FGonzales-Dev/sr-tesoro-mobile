import 'lab_test.dart';

class AboBloodTypingLabTest extends LabTest {
  final String? bloodType;
  final String? rhFactor;
  final String? remarks;
  final String? others;

  AboBloodTypingLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    this.bloodType,
    this.rhFactor,
    this.remarks,
    this.others,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}
