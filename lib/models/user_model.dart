class UserModel {
  String name;
  int age;
  String company;
  String uid;

  UserModel({this.age, this.company, this.name, this.uid});

  Map<String, dynamic> toJson() {
    return {
      "name": this.name,
      "company": this.company,
      "age": this.age,
      "uid": this.uid
    };
  }
}
