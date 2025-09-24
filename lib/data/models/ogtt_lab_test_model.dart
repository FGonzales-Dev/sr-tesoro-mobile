import '../../domain/entities/ogtt_lab_test.dart';

class OgttLabTestModel extends OgttLabTest {
  OgttLabTestModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          dateAccepted: json['date_accepted'],
          dateReported: json['date_reported'],
          status: json['status'],
          medtechName: json['medtech_name'],
          testType: json['test_type'],
          fastingGlucose: json['fasting_glucose'],
          oneHour: json['one_hour'],
          twoHours: json['two_hours'],
          fasting: json['fasting'],
          remarks: json['remarks'],
          others: json['others'],
        );
}
