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

class FecalysisLabTest extends LabTest {
  final String color;
  final String consistency;
  final String rbc;
  final String wbc;
  final String yeast;
  final String cystTroph;
  final String fecalOccultBlood;
  final String fobtMethod;
  final String remarks;
  final String others;

  FecalysisLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.color,
    required this.consistency,
    required this.rbc,
    required this.wbc,
    required this.yeast,
    required this.cystTroph,
    required this.fecalOccultBlood,
    required this.fobtMethod,
    required this.remarks,
    required this.others,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}

class PregnancyLabTest extends LabTest {
  final String ptResult;
  final String remarks;
  final String others;

  PregnancyLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.ptResult,
    required this.remarks,
    required this.others,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}

class ChemistryLabTest extends LabTest {
  final String glucose;
  final String cholesterol;
  final String hdl;
  final String ldl;
  final String vldl;
  final String triglyceride;
  final String creatinine;
  final String bun;
  final String bloodUricAcid;

  ChemistryLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.glucose,
    required this.cholesterol,
    required this.hdl,
    required this.ldl,
    required this.vldl,
    required this.triglyceride,
    required this.creatinine,
    required this.bun,
    required this.bloodUricAcid,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}

class SerologyLabTest extends LabTest {
  final String hiv12;
  final String hbsag;
  final String syphilis;
  final String dengueNs1;
  final String dengueIgm;
  final String dengueIgg;

  SerologyLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.hiv12,
    required this.hbsag,
    required this.syphilis,
    required this.dengueNs1,
    required this.dengueIgm,
    required this.dengueIgg,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}

class UrinalysisLabTest extends LabTest {
  final String color;
  final String clarity;
  final String specificGravity;
  final String ph;
  final String leukocytes;
  final String nitrites;
  final String protein;
  final String glucose;
  final String ketones;
  final String urobilinogen;
  final String bilirubin;
  final String blood;
  final String redBloodCells;
  final String whiteBloodCells;
  final String squamousCells;
  final String amorphous;
  final String mucus;
  final String casts;
  final String crystals;
  final String bacteria;
  final String remarks;
  final String others;

  UrinalysisLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.color,
    required this.clarity,
    required this.specificGravity,
    required this.ph,
    required this.leukocytes,
    required this.nitrites,
    required this.protein,
    required this.glucose,
    required this.ketones,
    required this.urobilinogen,
    required this.bilirubin,
    required this.blood,
    required this.redBloodCells,
    required this.whiteBloodCells,
    required this.squamousCells,
    required this.amorphous,
    required this.mucus,
    required this.casts,
    required this.crystals,
    required this.bacteria,
    required this.remarks,
    required this.others,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}

class OgttLabTest extends LabTest {
  final String fastingGlucose;
  final String oneHour;
  final String twoHours;
  final String fasting;
  final String remarks;
  final String others;

  OgttLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.fastingGlucose,
    required this.oneHour,
    required this.twoHours,
    required this.fasting,
    required this.remarks,
    required this.others,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}

class CbcLabTest extends LabTest {
  final String hemoglobin;
  final String hematocrit;
  final String rbcCount;
  final String mcv;
  final String mch;
  final String mchc;
  final String rdwCv;
  final String wbcCount;
  final String neut;
  final String lymp;
  final String eos;
  final String mono;
  final String baso;
  final String atypicalImmat;
  final String platelet;
  final String remarks;
  final String others;

  CbcLabTest({
    required int id,
    required String dateAccepted,
    required String dateReported,
    required String status,
    required String medtechName,
    required String testType,
    required this.hemoglobin,
    required this.hematocrit,
    required this.rbcCount,
    required this.mcv,
    required this.mch,
    required this.mchc,
    required this.rdwCv,
    required this.wbcCount,
    required this.neut,
    required this.lymp,
    required this.eos,
    required this.mono,
    required this.baso,
    required this.atypicalImmat,
    required this.platelet,
    required this.remarks,
    required this.others,
  }) : super(
          id: id,
          dateAccepted: dateAccepted,
          dateReported: dateReported,
          status: status,
          medtechName: medtechName,
          testType: testType,
        );
}
