import '../../domain/entities/chemistry_lab_test.dart';

class ChemistryLabTestModel extends ChemistryLabTest {
  ChemistryLabTestModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          dateAccepted: json['date_accepted'],
          dateReported: json['date_reported'],
          status: json['status'],
          medtechName: json['medtech_name'],
          testType: json['test_type'],
          glucose: json['glucose'],
          cholesterol: json['cholesterol'],
          hdl: json['hdl'],
          ldl: json['ldl'],
          vldl: json['vldl'],
          triglyceride: json['triglyceride'],
          creatinine: json['creatinine'],
          bun: json['bun'],
          bloodUricAcid: json['blood_uric_acid'],
        );
}
