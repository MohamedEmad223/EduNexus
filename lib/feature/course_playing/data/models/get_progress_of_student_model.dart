class GetProgressOfStudentModel {
  String? message;
  String? progress;

  GetProgressOfStudentModel({this.message, this.progress});

  GetProgressOfStudentModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    progress = json['progress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['progress'] = progress;
    return data;
  }
}
