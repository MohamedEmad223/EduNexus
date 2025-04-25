class UpdataUserModel {
  String? name;
  String? email;

  UpdataUserModel({this.name, this.email});
  UpdataUserModel.fromJson(Map<String, dynamic> json) {
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
