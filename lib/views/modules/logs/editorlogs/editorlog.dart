enum EditorLogsFields {
userId,
nameOfSuite,
date,
firstInterval,
secondInterval,
thirdInterval,
closedAt,
createdAt,
updatedAt,
title,
start,
end,
color,
comment,
}
class EditorLogs {
  int? id;
  int? userId;
  String? nameOfSuite;
  String? date;
  String? firstInterval;
  String? secondInterval;
  String? thirdInterval;
  String? closedAt;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? start;
  String? end;
  String? color;
  String? comment;

  EditorLogs(
      {this.id,
      this.userId,
      this.nameOfSuite,
      this.date,
      this.firstInterval,
      this.secondInterval,
      this.thirdInterval,
      this.closedAt,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.start,
      this.end,
      this.color});

  EditorLogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    nameOfSuite = json['name_of_suite'];
    date = json['date'];
    firstInterval = json['first_interval'];
    secondInterval = json['second_interval'];
    thirdInterval = json['third_interval'];
    closedAt = json['closed_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    start = json['start'];
    end = json['end'];
    color = json['color'];
        //these fields below are addtional fields initialized for the list view title and subtitle.
    //all models must provide these fields (title and comment) to the listview.
    title = title;
    comment = firstInterval;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name_of_suite'] = nameOfSuite;
    data['date'] = date;
    data['first_interval'] = firstInterval;
    data['second_interval'] = secondInterval;
    data['third_interval'] = thirdInterval;
    data['closed_at'] = closedAt;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['start'] = start;
    data['end'] = end;
    data['color'] = color;
    return data;
  }
}
