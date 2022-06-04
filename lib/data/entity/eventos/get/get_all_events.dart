class GetAllEvents {
  final int? id;
  final String? name;
  final String? description;
  final String? imageUrl;
  final String? startDate;
  final String? endDate;
  final int? status;

  GetAllEvents({
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.startDate,
    this.endDate,
    this.status,
  });

  // GetAllEvents.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   description = json['description'];
  //   imageUrl = json['imageUrl'];
  //   startDate = json['startDate'];
  //   endDate = json['endDate'];
  //   status = json['status'];
  // }

  // Map<dynamic, dynamic> toJson() {
  //   final Map<dynamic, dynamic> data = <String, dynamic>{};
  //   data['id'] = id;
  //   data['name'] = name;
  //   data['description'] = description;
  //   data['imageUrl'] = imageUrl;
  //   data['startDate'] = startDate;
  //   data['endDate'] = endDate;
  //   data['status'] = status;
  //   return data;
  // }
}
