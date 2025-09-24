import '../../domain/entities/serology_lab_test.dart';

class SerologyLabTestModel extends SerologyLabTest {
  SerologyLabTestModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          dateAccepted: json['date_accepted'],
          dateReported: json['date_reported'],
          status: json['status'],
          medtechName: json['medtech_name'],
          testType: json['test_type'],
          hiv12: json['hiv_1_2'],
          hbsag: json['hbsag'],
          syphilis: json['syphilis'],
          dengueNs1: json['dengue_ns1'],
          dengueIgm: json['dengue_igm'],
          dengueIgg: json['dengue_igg'],
        );
}
