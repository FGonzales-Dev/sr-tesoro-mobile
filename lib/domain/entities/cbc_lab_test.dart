import 'lab_test.dart';

class CbcLabTest extends LabTest {
  final String hemoglobin;
  final String hematocrit;
  final String rbcCount;
  final String mcv;
  final String mch;
  final String mchc;
  final String rdwCv;
  final String wbcCount;
  final String neut;
  final String lymp;
  final String eos;
  final String mono;
  final String baso;
  final String atypicalImmat;
  final String platelet;
  final String remarks;
  final String others;

  CbcLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.hemoglobin,
    required this.hematocrit,
    required this.rbcCount,
    required this.mcv,
    required this.mch,
    required this.mchc,
    required this.rdwCv,
    required this.wbcCount,
    required this.neut,
    required this.lymp,
    required this.eos,
    required this.mono,
    required this.baso,
    required this.atypicalImmat,
    required this.platelet,
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
