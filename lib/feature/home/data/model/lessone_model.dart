class LessonModel {
  String? title;
  String? content;
  String? path;
  String? course;
  String? sId;
  int? iV;

  LessonModel(
      {this.title, this.content, this.path, this.course, this.sId, this.iV});

  LessonModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    path = json['path'];
    course = json['course'];
    sId = json['_id'];
    iV = json['__v'];
  }

  
}
