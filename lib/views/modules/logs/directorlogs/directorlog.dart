enum DirectorlogsFields  {
  id,
  userId,
  producer,
  anchor,
  director,
  cameraOperator,
  cameraOperator2,
  visionMixer,
  soundTechnician,
  tx,
  graphics,
  engineer,
  autocue,
  bulletin,
  dtsIn,
  

}

class Directorlogs {
  int? id;
  int? userId;
  String? producer;
  String? anchor;
  String? director;
  String? cameraOperator;
  String? cameraOperator2;
  String? visionMixer;
  String? soundTechnician;
  String? tx;
  String? graphics;
  String? engineer;
  String? autocue;
  String? bulletin;
  String? dtsIn;
  String? actualIn;
  String? variance1;
  String? dtsOut;
  String? actualOut;
  String? variance2;
  String? comment;
  String? b2bulletin;
  String? b2dtsIn;
  String? b2actualIn;
  String? b2variance1;
  String? b2dtsOut;
  String? b2actualOut;
  String? b2variance2;
  String? b2comment;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? logDate;
  String? start;
  String? end;
  String? color;

  Directorlogs(
      {this.id,
      this.userId,
      this.producer,
      this.anchor,
      this.director,
      this.cameraOperator,
      this.cameraOperator2,
      this.visionMixer,
      this.soundTechnician,
      this.tx,
      this.graphics,
      this.engineer,
      this.autocue,
      this.bulletin,
      this.dtsIn,
      this.actualIn,
      this.variance1,
      this.dtsOut,
      this.actualOut,
      this.variance2,
      this.comment,
      this.b2bulletin,
      this.b2dtsIn,
      this.b2actualIn,
      this.b2variance1,
      this.b2dtsOut,
      this.b2actualOut,
      this.b2variance2,
      this.b2comment,
      this.createdAt,
      this.updatedAt,
      this.title,
      this.logDate,
      this.start,
      this.end,
      this.color});

  Directorlogs.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    producer = json['producer'];
    anchor = json['anchor'];
    director = json['director'];
    cameraOperator = json['camera_operator'];
    cameraOperator2 = json['camera_operator2'];
    visionMixer = json['vision_mixer'];
    soundTechnician = json['sound_technician'];
    tx = json['tx'];
    graphics = json['graphics'];
    engineer = json['engineer'];
    autocue = json['autocue'];
    bulletin = json['bulletin'];
    dtsIn = json['dts_in'];
    actualIn = json['actual_in'];
    variance1 = json['variance1'];
    dtsOut = json['dts_out'];
    actualOut = json['actual_out'];
    variance2 = json['variance2'];
    comment = json['comment'];
    b2bulletin = json['b2bulletin'];
    b2dtsIn = json['b2dts_in'];
    b2actualIn = json['b2actual_in'];
    b2variance1 = json['b2variance1'];
    b2dtsOut = json['b2dts_out'];
    b2actualOut = json['b2actual_out'];
    b2variance2 = json['b2variance2'];
    b2comment = json['b2comment'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    logDate = json['log_date'];
    start = json['start'];
    end = json['end'];
    color = json['color'];

    //these fields below are addtional fields initialized for the list view title and subtitle.
    //all models must provide these fields (title and comment) to the listview.
    title = bulletin;
    comment = comment;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['producer'] = producer;
    data['anchor'] = anchor;
    data['director'] = director;
    data['camera_operator'] = cameraOperator;
    data['camera_operator2'] = cameraOperator2;
    data['vision_mixer'] = visionMixer;
    data['sound_technician'] = soundTechnician;
    data['tx'] = tx;
    data['graphics'] = graphics;
    data['engineer'] = engineer;
    data['autocue'] = autocue;
    data['bulletin'] = bulletin;
    data['dts_in'] = dtsIn;
    data['actual_in'] = actualIn;
    data['variance1'] = variance1;
    data['dts_out'] = dtsOut;
    data['actual_out'] = actualOut;
    data['variance2'] = variance2;
    data['comment'] = comment;
    data['b2bulletin'] = b2bulletin;
    data['b2dts_in'] = b2dtsIn;
    data['b2actual_in'] = b2actualIn;
    data['b2variance1'] = b2variance1;
    data['b2dts_out'] = b2dtsOut;
    data['b2actual_out'] = b2actualOut;
    data['b2variance2'] = b2variance2;
    data['b2comment'] = b2comment;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['log_date'] = logDate;
    data['start'] = start;
    data['end'] = end;
    data['color'] = color;
    return data;
  }
}
