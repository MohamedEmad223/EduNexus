class AllCourses {
  String? sId;
  String? title;
  String? description;
  String? createdBy;
  List<String>? enrolledStudents;
  List<String>? quizzes;
  List<String>? materials;
  List<String>? lessons;
  int? iV;
  String? category;
  int? price;
  int? rate;

  AllCourses(
      {this.sId,
      this.title,
      this.description,
      this.createdBy,
      this.enrolledStudents,
      this.quizzes,
      this.materials,
      this.lessons,
      this.iV,
      this.category,
      this.price,
      this.rate});

  AllCourses.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    createdBy = json['createdBy'];
    enrolledStudents = json['enrolledStudents'].cast<String>();
    quizzes = json['quizzes'].cast<String>();
    materials = json['materials'].cast<String>();
    lessons = json['lessons'].cast<String>();
    iV = json['__v'];
    category = json['category'];
    price = json['price'];
    rate = json['rate'];
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
    data['__v'] = iV;
    data['category'] = category;
    data['price'] = price;
    data['rate'] = rate;
    return data;
  }
}
