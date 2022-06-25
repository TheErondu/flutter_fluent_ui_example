import 'package:hermes/views/modules/logs/editorlogs/editorlog.dart';
import 'package:hermes/views/modules/logs/oblogs/oblog.dart';
import 'package:hermes/utils/debugger.dart';

import 'package:hermes/views/modules/logs/directorlogs/directorlog.dart';

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
       case "videoeditorlogs":
      {
       final parsed = EditorLogs.fromJson(data);
        return parsed;
      }

    default:
      {
        toLog("Invalid route");
      }
      break;
  }
}

