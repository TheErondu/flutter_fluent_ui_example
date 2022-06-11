
import '../models/report.dart';

getReportModel(dynamic data) {
  final report = Report.fromJson(data);
  return report;
}