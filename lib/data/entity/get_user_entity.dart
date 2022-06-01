class GetUserEntity {
  final int id;
  final String fullName;
  final String? rg;
  final String cpf;
  final String? profilePictureUrl;
  final String? birthDate;
  final String? createdAt;
  final String? email;
  // final String address;
  // final String contacts;

  GetUserEntity({
    required this.id,
    required this.fullName,
    required this.rg,
    required this.cpf,
    required this.profilePictureUrl,
    required this.birthDate,
    required this.createdAt,
    // required this.address,
    // required this.contacts,
    required this.email,
  });
}

