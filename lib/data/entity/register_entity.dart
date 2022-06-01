class RegisterEntity {
  final String fullName;
  final String email;
  final String cpf;
  final String password;

  RegisterEntity({
    required this.fullName,
    required this.email,
    required this.cpf,
    required this.password,
  });

  // factory RegisterEntity.fromJson(Map json) {
  //   return RegisterEntity(
  //     fullName: json['fullName'],
  //     cpf: json['cpf'],
  //     email: json['email'],
  //     password: json['password'],
  //   );
  // }
}
