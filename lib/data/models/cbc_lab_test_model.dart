import '../../domain/entities/cbc_lab_test.dart';

class CbcLabTestModel extends CbcLabTest {
  CbcLabTestModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          dateAccepted: json['date_accepted'],
          dateReported: json['date_reported'],
          status: json['status'],
          medtechName: json['medtech_name'],
          testType: json['test_type'],
          hemoglobin: json['hemoglobin'],
          hematocrit: json['hematocrit'],
          rbcCount: json['rbc_count'],
          mcv: json['mcv'],
          mch: json['mch'],
          mchc: json['mchc'],
          rdwCv: json['rdw_cv'],
          wbcCount: json['wbc_count'],
          neut: json['neut'],
          lymp: json['lymp'],
          eos: json['eos'],
          mono: json['mono'],
          baso: json['baso'],
          atypicalImmat: json['atypical_immat'],
          platelet: json['platelet'],
          remarks: json['remarks'],
          others: json['others'],
        );
}
