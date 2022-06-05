class GetAllEvents {
  final int id;
  final String name;
  final String description;
  final String imageUrl;
  final String startDate;
  final String endDate;
  final int status;

  static var events;

  GetAllEvents({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.startDate,
    required this.endDate,
    required this.status,
  });
}
