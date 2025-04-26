class AllLessonsModel {
  final String? id;
  final String? title;
  final String? description;
  final String? createdBy;
  final List<Lesson>? lessons;

  AllLessonsModel({
    this.id,
    this.title,
    this.description,
    this.createdBy,
    this.lessons,
  });

  factory AllLessonsModel.fromJson(Map<String, dynamic> json) {
    return AllLessonsModel(
      id: json['_id'],
      title: json['title'],
      description: json['description'],
      createdBy: json['createdBy'],
      lessons:
          (json['lessons'] as List<dynamic>?)
              ?.map((lesson) => Lesson.fromJson(lesson))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'description': description,
      'createdBy': createdBy,
      'lessons': lessons?.map((lesson) => lesson.toJson()).toList(),
    };
  }
}

class Lesson {
  final String? id;
  final String? title;
  final String? content;
  final String? path;
  final String? summary;
  final String? course;
  final int? v;

  Lesson({
    this.id,
    this.title,
    this.content,
    this.path,
    this.summary,
    this.course,
    this.v,
  });

  factory Lesson.fromJson(Map<String, dynamic> json) {
    return Lesson(
      id: json['_id'],
      title: json['title'],
      content: json['content'],
      path: json['path'],
      summary: json['summary'],
      course: json['course'],
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'content': content,
      'path': path,
      'summary': summary,
      'course': course,
      '__v': v,
    };
  }
}
