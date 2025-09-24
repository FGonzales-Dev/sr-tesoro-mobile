import 'lab_test.dart';

class OgttLabTest extends LabTest {
  final String? fastingGlucose;
  final String? oneHour;
  final String? twoHours;
  final String? fasting;
  final String? remarks;
  final String? others;

  OgttLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    this.fastingGlucose,
    this.oneHour,
    this.twoHours,
    this.fasting,
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
