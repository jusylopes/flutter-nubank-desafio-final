class GetUserDetails {
  final int id;
  final String fullName;
  final String? rg;
  final String cpf;
  final String? profilePictureUrl;
  final String? birthDate;
  final String? createdAt;

  GetUserDetails({
    required this.id,
    required this.fullName,
    required this.rg,
    required this.cpf,
    required this.profilePictureUrl,
    required this.birthDate,
    required this.createdAt,
  });
}
