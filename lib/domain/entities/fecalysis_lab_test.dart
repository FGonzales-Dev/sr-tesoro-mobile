import 'lab_test.dart';

class FecalysisLabTest extends LabTest {
  final String? color;
  final String? consistency;
  final String? rbc;
  final String? wbc;
  final String? yeast;
  final String? cystTroph;
  final String? fecalOccultBlood;
  final String? fobtMethod;
  final String? remarks;
  final String? others;

  FecalysisLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    this.color,
    this.consistency,
    this.rbc,
    this.wbc,
    this.yeast,
    this.cystTroph,
    this.fecalOccultBlood,
    this.fobtMethod,
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
