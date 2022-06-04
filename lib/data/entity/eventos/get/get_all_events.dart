class GetAllEvents {
  final int? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? startDate;
  final String? endDate;
  final int? status;

  GetAllEvents({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.status,
  });

  factory GetAllEvents.fromJson(Map<String, dynamic> json) {
    return GetAllEvents(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['imageUrl'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      status: json['status'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['status'] = status;
    return data;
  }
}
