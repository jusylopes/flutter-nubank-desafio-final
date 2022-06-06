class GetUserAccreditation {
  late final int? id;
  late final String? location;
  late final String? salesType;
  late final String? status;
  late final String? accreditedAt;
  Event? event;

  GetUserAccreditation({
    required this.id,
    required this.location,
    required this.salesType,
    required this.status,
    required this.accreditedAt,
    required this.event,
  });

  GetUserAccreditation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    location = json['location'];
    salesType = json['salesType'];
    status = json['status'];
    accreditedAt = json['accreditedAt'];
    event = json['event'] != null ? Event.fromJson(json['event']) : null;
  }
}

class Event {
  int? id;
  String? name;
  String? description;
  String? imageUrl;
  String? startDate;
  String? endDate;
  int? status;

  Event(
      {required this.id,
      required this.name,
      required this.description,
      required this.imageUrl,
      required this.startDate,
      required this.endDate,
      required this.status});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
  }
}
