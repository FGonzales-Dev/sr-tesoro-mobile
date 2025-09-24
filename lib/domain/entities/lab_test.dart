abstract class LabTest {
  final int id;
  final String dateAccepted;
  final String dateReported;
  final String status;
  final String medtechName;
  final String testType;

  LabTest({
    required this.id,
    required this.dateAccepted,
    required this.dateReported,
    required this.status,
    required this.medtechName,
    required this.testType,
  });
}