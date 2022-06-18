class Oblogs {
  int? id;
  int? userId;
  String? createdAt;
  String? eventName;
  String? eventDate;
  String? location;
  String? producer;
  String? director;
  String? visionMixer;
  String? sound;
  String? engineer;
  String? dop;
  String? reporter;
  String? digital;
  String? transmissionTime;
  String? comment;
  String? updatedAt;
  String? title;
  String? start;
  String? end;
  String? color;

  Oblogs(
      {this.id,
      this.userId,
      this.createdAt,
      this.eventName,
      this.eventDate,
      this.location,
      this.producer,
      this.director,
      this.visionMixer,
      this.sound,
      this.engineer,
      this.dop,
      this.reporter,
      this.digital,
      this.transmissionTime,
      this.comment,
      this.updatedAt,
      this.title,
      this.start,
      this.end,
      this.color});

  Oblogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    eventName = json['event_name'];
    eventDate = json['event_date'];
    location = json['location'];
    producer = json['producer'];
    director = json['director'];
    visionMixer = json['vision_mixer'];
    sound = json['sound'];
    engineer = json['engineer'];
    dop = json['dop'];
    reporter = json['reporter'];
    digital = json['digital'];
    transmissionTime = json['transmission_time'];
    comment = json['comment'];
    updatedAt = json['updated_at'];
    title = json['title'];
    start = json['start'];
    end = json['end'];
    color = json['color'];
        //these fields below are addtional fields initialized for the list view title and subtitle.
    //all models must provide these fields (title and comment) to the listview.
    title = eventName;
    comment = comment;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['event_name'] = eventName;
    data['event_date'] = eventDate;
    data['location'] = location;
    data['producer'] = producer;
    data['director'] = director;
    data['vision_mixer'] = visionMixer;
    data['sound'] = sound;
    data['engineer'] = engineer;
    data['dop'] = dop;
    data['reporter'] = reporter;
    data['digital'] = digital;
    data['transmission_time'] = transmissionTime;
    data['comment'] = comment;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['start'] = start;
    data['end'] = end;
    data['color'] = color;
    return data;
  }
}
