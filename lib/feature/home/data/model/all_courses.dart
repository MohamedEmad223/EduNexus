class AllCoursesModel {
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

  AllCoursesModel({
    this.sId,
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
    this.rate,
  });

  AllCoursesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    createdBy = json['createdBy'];
    enrolledStudents = json['enrolledStudents']?.cast<String>();
    quizzes = json['quizzes']?.cast<String>();
    if (json['materials'] != null) {
      if (json['materials'] is List) {
        materials = json['materials'].cast<String>();
      } else if (json['materials'] is String) {
        materials = json['materials'].split(RegExp(r'[;,]')).map((e) => e.trim()).toList();
      }
    }
    lessons = json['lessons']?.cast<String>();
    iV = json['__v'];
    category = json['category'];
    price = json['price'];
    rate = json['rate'];
  }

  static List<AllCoursesModel> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => AllCoursesModel.fromJson(json)).toList();
  }
}