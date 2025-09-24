import 'lab_test.dart';

class CbcLabTest extends LabTest {
  final String? hemoglobin;
  final String? hematocrit;
  final String? rbcCount;
  final String? mcv;
  final String? mch;
  final String? mchc;
  final String? rdwCv;
  final String? wbcCount;
  final String? neut;
  final String? lymp;
  final String? eos;
  final String? mono;
  final String? baso;
  final String? atypicalImmat;
  final String? platelet;
  final String? remarks;
  final String? others;

  CbcLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    this.hemoglobin,
    this.hematocrit,
    this.rbcCount,
    this.mcv,
    this.mch,
    this.mchc,
    this.rdwCv,
    this.wbcCount,
    this.neut,
    this.lymp,
    this.eos,
    this.mono,
    this.baso,
    this.atypicalImmat,
    this.platelet,
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
