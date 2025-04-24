class AllCoursesModel {
  String? sId;
  String? title;
  String? description;
  String? createdBy;
  List<String>? enrolledStudents;
  List<String>? quizzes;
  List<String>? materials;
  List<String>? lessons;
  int? price;
  int? rate;
  String? category;
  String? thumbnail;
  int? iV;

  AllCoursesModel({
    this.sId,
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
    this.iV,
  });

  AllCoursesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    createdBy = json['createdBy'];
    enrolledStudents = json['enrolledStudents']?.cast<String>();
    quizzes = json['quizzes']?.cast<String>();
    materials = json['materials']?.cast<String>();
    lessons = json['lessons']?.cast<String>();
    price = json['price'];
    rate = json['rate'];
    category = json['category'];
    thumbnail = json['thumbnail'];
    iV = json['__v'];
  }

 

  static List<AllCoursesModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => AllCoursesModel.fromJson(json)).toList();
  }
}