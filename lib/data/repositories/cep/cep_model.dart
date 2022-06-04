class CepModel {
  String cep;
  String state;
  String city;
  String neighborhood;
  String street;
  String service;

  CepModel(
      {required this.cep,
      required this.state,
      required this.city,
      required this.neighborhood,
      required this.street,
      required this.service});

  factory CepModel.fromJson(Map<String, dynamic> json) => CepModel(
        cep: json['cep'],
        state: json['state'],
        city: json['city'],
        neighborhood: json['neighborhood'],
        street: json['street'],
        service: json['service'],
      );

  @override
  String toString() {
    return 'CurrencyModel{cep: $cep, state: $state, city: $city, neighborhood: $neighborhood, street: $street, service: $service}';
  }
}
