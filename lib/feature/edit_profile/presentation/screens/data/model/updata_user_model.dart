class UpdateUserModel {
  String? name;
  String? email;

  UpdateUserModel({this.name, this.email});
  UpdateUserModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    return data;
  }
}
