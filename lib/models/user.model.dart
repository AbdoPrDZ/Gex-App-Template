class UserModel {
  final String firstName, lastName, email, gander, password;

  const UserModel(
    this.firstName,
    this.lastName,
    this.email,
    this.gander,
    this.password,
  );

  String get fullName => '$firstName $lastName';

  static UserModel fromMap(Map data) => UserModel(
        data['firstname'],
        data['lastname'],
        data['email'],
        data['gander'],
        data['password'],
      );

  Map<String, dynamic> get map => {
        'firstname': firstName,
        'lastname': lastName,
        'email': email,
        'gander': gander,
        'password': password,
      };
}
