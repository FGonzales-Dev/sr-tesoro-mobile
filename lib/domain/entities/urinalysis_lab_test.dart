import 'lab_test.dart';

class UrinalysisLabTest extends LabTest {
  final String? color;
  final String? clarity;
  final String? specificGravity;
  final String? ph;
  final String? leukocytes;
  final String? nitrites;
  final String? protein;
  final String? glucose;
  final String? ketones;
  final String? urobilinogen;
  final String? bilirubin;
  final String? blood;
  final String? redBloodCells;
  final String? whiteBloodCells;
  final String? squamousCells;
  final String? amorphous;
  final String? mucus;
  final String? casts;
  final String? crystals;
  final String? bacteria;
  final String? remarks;
  final String? others;

  UrinalysisLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    this.color,
    this.clarity,
    this.specificGravity,
    this.ph,
    this.leukocytes,
    this.nitrites,
    this.protein,
    this.glucose,
    this.ketones,
    this.urobilinogen,
    this.bilirubin,
    this.blood,
    this.redBloodCells,
    this.whiteBloodCells,
    this.squamousCells,
    this.amorphous,
    this.mucus,
    this.casts,
    this.crystals,
    this.bacteria,
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
