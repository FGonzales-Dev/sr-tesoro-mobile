import 'lab_test.dart';

class FecalysisLabTest extends LabTest {
  final String color;
  final String consistency;
  final String rbc;
  final String wbc;
  final String yeast;
  final String cystTroph;
  final String fecalOccultBlood;
  final String fobtMethod;
  final String remarks;
  final String others;

  FecalysisLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.color,
    required this.consistency,
    required this.rbc,
    required this.wbc,
    required this.yeast,
    required this.cystTroph,
    required this.fecalOccultBlood,
    required this.fobtMethod,
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
