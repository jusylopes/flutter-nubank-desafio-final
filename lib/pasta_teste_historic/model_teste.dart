class AcredHistory {
  String? accreditedAt;
  Event? event;

  AcredHistory({this.accreditedAt, this.event});

  AcredHistory.fromJson(Map<String, dynamic> json) {
    accreditedAt = json['accreditedAt'];
    event = json['event'] != null ? new Event.fromJson(json['event']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['accreditedAt'] = this.accreditedAt;
    if (this.event != null) {
      data['event'] = this.event?.toJson();
    }
    return data;
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
      {this.id,
      this.name,
      this.description,
      this.imageUrl,
      this.startDate,
      this.endDate,
      this.status});

  Event.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['imageUrl'] = this.imageUrl;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['status'] = this.status;
    return data;
  }
}