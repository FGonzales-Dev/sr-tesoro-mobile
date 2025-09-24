import 'lab_test.dart';

class ChemistryLabTest extends LabTest {
  final String? glucose;
  final String? cholesterol;
  final String? hdl;
  final String? ldl;
  final String? vldl;
  final String? triglyceride;
  final String? creatinine;
  final String? bun;
  final String? bloodUricAcid;

  ChemistryLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    this.glucose,
    this.cholesterol,
    this.hdl,
    this.ldl,
    this.vldl,
    this.triglyceride,
    this.creatinine,
    this.bun,
    this.bloodUricAcid,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}
