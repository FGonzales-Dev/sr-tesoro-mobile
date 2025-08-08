class EcgRecord {
  final int id;
  final DateTime createdAt;
  final String status;
  final int heartRate;
  final String qrsAxis;
  final double prInterval;
  final double qrsDuration;
  final double qtInterval;
  final String ecgReport;
  final String interpretation;
  final String doctorName;
  final String? ecgStripUrl;

  EcgRecord({
    required this.id,
    required this.createdAt,
    required this.status,
    required this.heartRate,
    required this.qrsAxis,
    required this.prInterval,
    required this.qrsDuration,
    required this.qtInterval,
    required this.ecgReport,
    required this.interpretation,
    required this.doctorName,
    this.ecgStripUrl,
  });
}
