import 'lab_test.dart';

class SerologyLabTest extends LabTest {
  final String? hiv12;
  final String? hbsag;
  final String? syphilis;
  final String? dengueNs1;
  final String? dengueIgm;
  final String? dengueIgg;

  SerologyLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    this.hiv12,
    this.hbsag,
    this.syphilis,
    this.dengueNs1,
    this.dengueIgm,
    this.dengueIgg,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}
