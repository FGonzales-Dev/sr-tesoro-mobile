import '../../domain/entities/lab_test.dart';

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

class UrinalysisLabTestModel extends UrinalysisLabTest {
  UrinalysisLabTestModel.fromJson(Map<String, dynamic> json)
      : super(
          id: json['id'],
          dateAccepted: json['date_accepted'],
          dateReported: json['date_reported'],
          status: json['status'],
          medtechName: json['medtech_name'],
          testType: json['test_type'],
          color: json['color'],
          clarity: json['clarity'],
          specificGravity: json['specific_gravity'],
          ph: json['ph'],
          leukocytes: json['leukocytes'],
          nitrites: json['nitrites'],
          protein: json['protein'],
          glucose: json['glucose'],
          ketones: json['ketones'],
          urobilinogen: json['urobilinogen'],
          bilirubin: json['bilirubin'],
          blood: json['blood'],
          redBloodCells: json['red_blood_cells'],
          whiteBloodCells: json['white_blood_cells'],
          squamousCells: json['squamous_cells'],
          amorphous: json['amorphous'],
          mucus: json['mucus'],
          casts: json['casts'],
          crystals: json['crystals'],
          bacteria: json['bacteria'],
          remarks: json['remarks'],
          others: json['others'],
        );
}

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
