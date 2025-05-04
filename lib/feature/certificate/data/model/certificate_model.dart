class UserCertificateModel {
  String? message;
  List<Certificates>? certificates;

  UserCertificateModel({this.message, this.certificates});

  UserCertificateModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['certificates'] != null) {
      certificates = <Certificates>[];
      json['certificates'].forEach((v) {
        certificates!.add(Certificates.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    if (certificates != null) {
      data['certificates'] = certificates!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Certificates {
  String? sId;
  String? userId;
  CourseId? courseId;
  String? certificateUrl;
  String? issueDate;
  int? iV;

  Certificates(
      {this.sId,
      this.userId,
      this.courseId,
      this.certificateUrl,
      this.issueDate,
      this.iV});

  Certificates.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    userId = json['userId'];
    courseId = json['courseId'] != null
        ? CourseId.fromJson(json['courseId'])
        : null;
    certificateUrl = json['certificateUrl'];
    issueDate = json['issueDate'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['userId'] = userId;
    if (courseId != null) {
      data['courseId'] = courseId!.toJson();
    }
    data['certificateUrl'] = certificateUrl;
    data['issueDate'] = issueDate;
    data['__v'] = iV;
    return data;
  }
}

class CourseId {
  String? sId;
  String? title;
  String? description;
  String? createdBy;
  String? category;
  String? thumbnail;
  int? iV;

  CourseId(
      {this.sId,
      this.title,
      this.description,
      this.createdBy,
      this.category,
      this.thumbnail,
      this.iV});

  CourseId.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    description = json['description'];
    createdBy = json['createdBy'];
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
    data['category'] = category;
    data['thumbnail'] = thumbnail;
    data['__v'] = iV;
    return data;
  }
}
