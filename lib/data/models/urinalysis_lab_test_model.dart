import '../../domain/entities/urinalysis_lab_test.dart';

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
