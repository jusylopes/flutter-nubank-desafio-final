class GetUserAccreditation {
  final int? id;
  final String? location;
  final String? salesType;
  final String? status;
  final String? accreditedAt;
  // Event? event;

  GetUserAccreditation({
    required this.id,
    required this.location,
    required this.salesType,
    required this.status,
    required this.accreditedAt,
    // required this.event,
  });
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
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.startDate,
      this.endDate,
      this.status});
}
