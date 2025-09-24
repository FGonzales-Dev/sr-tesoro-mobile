import '../../domain/entities/pregnancy_lab_test.dart';

class PregnancyLabTestModel extends PregnancyLabTest {
  PregnancyLabTestModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          dateAccepted: json['date_accepted'],
          dateReported: json['date_reported'],
          status: json['status'],
          medtechName: json['medtech_name'],
          testType: json['test_type'],
          ptResult: json['pt_result'],
          remarks: json['remarks'],
          others: json['others'],
        );
}
