class EnrollCourseModel {
  String? message;
  Course? course;

  EnrollCourseModel({this.message, this.course});

  EnrollCourseModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    course =
        json['course'] != null ? Course.fromJson(json['course']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (course != null) {
      data['course'] = course!.toJson();
    }
    return data;
  }
}

class Course {
  String? sId;
  String? title;
  String? description;
  String? createdBy;
  List<String>? enrolledStudents;
  List<String>? quizzes;
  List<Null>? materials;
  List<String>? lessons;
  int? price;
  int? rate;
  String? category;
  String? thumbnail;
  int? iV;

  Course(
      {this.sId,
      this.title,
      this.description,
      this.createdBy,
      this.enrolledStudents,
      this.quizzes,
      this.materials,
      this.lessons,
      this.price,
      this.rate,
      this.category,
      this.thumbnail,
      this.iV});

  Course.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    createdBy = json['createdBy'];
    enrolledStudents = json['enrolledStudents'].cast<String>();
    quizzes = json['quizzes'].cast<String>();
    materials = json['materials'].cast<Null>();
    lessons = json['lessons'].cast<String>();
    price = json['price'];
    rate = json['rate'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['description'] = description;
    data['createdBy'] = createdBy;
    data['enrolledStudents'] = enrolledStudents;
    data['quizzes'] = quizzes;
    data['materials'] = materials;
    data['lessons'] = lessons;
    data['price'] = price;
    data['rate'] = rate;
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    data['__v'] = iV;
    return data;
  }
}
