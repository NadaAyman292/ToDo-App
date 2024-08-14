// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  String id;
  String email;
  int age;
  String userName;
  String phone;
  UserModel({
    this.id = "",
    required this.email,
    required this.age,
    required this.userName,
    required this.phone,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
            email: json['email'],
            id: json["id"],
            age: json['age'],
            userName: json["userName"],
            phone: json['phone']);

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "age": age,
      "userName": userName,
      "phone": phone,
      "id": id
    };
  }
}
