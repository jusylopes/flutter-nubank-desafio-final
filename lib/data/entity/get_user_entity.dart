class GetUserEntity {
  final String id;
  final String fullName;
  final String rg;
  final String cpf;
  final String profilePictureUrl;
  final String birthDate;
  final String createdAt;
  final String address;
  final String contacts;

  GetUserEntity({
    required this.id,
    required this.fullName,
    required this.rg,
    required this.cpf,
    required this.profilePictureUrl,
    required this.birthDate,
    required this.createdAt,
    required this.address,
    required this.contacts,
  });

  factory GetUserEntity.fromJson(Map<String, dynamic> json) {
    return GetUserEntity(
      id: json['id'],
      fullName: json['id'],
      rg: json['id'],
      cpf: json['id'],
      profilePictureUrl: json['id'],
      birthDate: json['id'],
      createdAt: json['id'],
      address: json['id'],
      contacts: json['id'],
    );
  }
}

// class GetUserEntity {
//   String? id;
//   String? fullName;
//   String? rg;
//   String? cpf;
//   String? profilePictureUrl;
//   String? birthDate;
//   String? createdAt;
//   Address? address;
//   Contacts? contacts;

//   GetUserEntity(
//     this.id,
//     this.fullName,
//     this.rg,
//     this.cpf,
//     this.profilePictureUrl,
//     this.birthDate,
//     this.createdAt,
//     this.address,
//     this.contacts,
//   );

//   GetUserEntity.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     fullName = json['fullName'];
//     rg = json['rg'];
//     cpf = json['cpf'];
//     profilePictureUrl = json['profilePictureUrl'];
//     birthDate = json['birthDate'];
//     createdAt = json['createdAt'];
//     address =
//         json['address'] != null ? Address.fromJson(json['address']) : null;
//     contacts =
//         json['contacts'] != null ? Contacts.fromJson(json['contacts']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['fullName'] = fullName;
//     data['rg'] = rg;
//     data['cpf'] = cpf;
//     data['profilePictureUrl'] = profilePictureUrl;
//     data['birthDate'] = birthDate;
//     data['createdAt'] = createdAt;
//     if (address != null) {
//       data['address'] = address!.toJson();
//     }
//     if (contacts != null) {
//       data['contacts'] = contacts!.toJson();
//     }
//     return data;
//   }
// }

// class Address {
//   String? cep;
//   String? street;
//   int? number;
//   String? complement;
//   String? district;
//   String? city;
//   String? state;

//   Address(
//       {this.cep,
//       this.street,
//       this.number,
//       this.complement,
//       this.district,
//       this.city,
//       this.state});

//   Address.fromJson(Map<String, dynamic> json) {
//     cep = json['cep'];
//     street = json['street'];
//     number = json['number'];
//     complement = json['complement'];
//     district = json['district'];
//     city = json['city'];
//     state = json['state'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['cep'] = cep;
//     data['street'] = street;
//     data['number'] = number;
//     data['complement'] = complement;
//     data['district'] = district;
//     data['city'] = city;
//     data['state'] = state;
//     return data;
//   }
// }

// class Contacts {
//   String? email;
//   String? phone;
//   String? mobilePhone;

//   Contacts({this.email, this.phone, this.mobilePhone});

//   Contacts.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     phone = json['phone'];
//     mobilePhone = json['mobilePhone'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['email'] = email;
//     data['phone'] = phone;
//     data['mobilePhone'] = mobilePhone;
//     return data;
//   }
// }
