class Like1_model {
  String? fullName;

  String? location;

  String? work;
  String? email;
  String? workshop_name;
  String? type;
  String? url;
  Like1_model({
    this.email,
    this.fullName,
    this.location,
    this.work,
    this.workshop_name,
    this.url,
    this.type,
  });

  factory Like1_model.fromJson(Map<String, dynamic> json) {
    return Like1_model(
      type: json['type'],
      fullName: json['full_name'],
      work: json['work'],
      workshop_name: json['workshop_name'],
      location: json['location'],
      email: json['email'],
      url: json['url'],
    );
  }
}
