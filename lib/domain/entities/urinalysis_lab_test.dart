import 'lab_test.dart';

class UrinalysisLabTest extends LabTest {
  final String color;
  final String clarity;
  final String specificGravity;
  final String ph;
  final String leukocytes;
  final String nitrites;
  final String protein;
  final String glucose;
  final String ketones;
  final String urobilinogen;
  final String bilirubin;
  final String blood;
  final String redBloodCells;
  final String whiteBloodCells;
  final String squamousCells;
  final String amorphous;
  final String mucus;
  final String casts;
  final String crystals;
  final String bacteria;
  final String remarks;
  final String others;

  UrinalysisLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.color,
    required this.clarity,
    required this.specificGravity,
    required this.ph,
    required this.leukocytes,
    required this.nitrites,
    required this.protein,
    required this.glucose,
    required this.ketones,
    required this.urobilinogen,
    required this.bilirubin,
    required this.blood,
    required this.redBloodCells,
    required this.whiteBloodCells,
    required this.squamousCells,
    required this.amorphous,
    required this.mucus,
    required this.casts,
    required this.crystals,
    required this.bacteria,
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
