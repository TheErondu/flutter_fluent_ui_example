import 'package:hermes/models/oblog.dart';
import 'package:hermes/utils/debugger.dart';

import 'package:hermes/models/report.dart';

getReportModel(dynamic data, dynamic route) {
  switch (route) {
    case "directorlogs":
      {
        final parsed = Directorlogs.fromJson(data);
        return parsed;
      }

    case "oblogs":
      {
       final parsed = Oblogs.fromJson(data);
        return parsed;
      }

    default:
      {
        toLog("Invalid route");
      }
      break;
  }
}

