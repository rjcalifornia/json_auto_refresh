class UsersModel {
  int id;
  String name;
  String userName;

  UsersModel(
    this.id,
    this.name,
    this.userName,
  );

  UsersModel.fromJson(Map json)
      : id = json['id'],
        name = json['name'],
        userName = json['username'];

  Map toJson() {
    return {
      'id': id,
      'name': name,
      'username': userName,
    };
  }
}
