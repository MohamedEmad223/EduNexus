class SignUp {
  User? user;
  String? token;

  SignUp({this.user, this.token});

  SignUp.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['token'] = token;
    return data;
  }
}

class User {
  String? name;
  String? email;
  String? role;

  String? sId;
  int? iV;

  User({this.name, this.email, this.role, this.sId, this.iV});

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    email = json['email'];
    role = json['role'];

    sId = json['_id'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['role'] = role;

    data['_id'] = sId;
    data['__v'] = iV;
    return data;
  }
}
