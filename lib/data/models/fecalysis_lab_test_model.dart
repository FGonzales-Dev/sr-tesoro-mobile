import '../../domain/entities/fecalysis_lab_test.dart';

class FecalysisLabTestModel extends FecalysisLabTest {
  FecalysisLabTestModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          dateAccepted: json['date_accepted'],
          dateReported: json['date_reported'],
          status: json['status'],
          medtechName: json['medtech_name'],
          testType: json['test_type'],
          color: json['color'],
          consistency: json['consistency'],
          rbc: json['rbc'],
          wbc: json['wbc'],
          yeast: json['yeast'],
          cystTroph: json['cyst_troph'],
          fecalOccultBlood: json['fecal_occult_blood'],
          fobtMethod: json['fobt_method'],
          remarks: json['remarks'],
          others: json['others'],
        );
}
