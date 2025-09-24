import 'lab_test.dart';

class PregnancyLabTest extends LabTest {
  final String ptResult;
  final String remarks;
  final String others;

  PregnancyLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.ptResult,
    required this.remarks,
    required this.others,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}
