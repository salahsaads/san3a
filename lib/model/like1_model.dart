class Like1_model {
  String? fullName;
  String? location;
  String? c;
  String? work;
  String? email_Worker;
  String? workshop_name;
  String? type;
  String? url;
  String? email_now;
  Like1_model(
      {this.email_Worker,
      this.fullName,
      this.location,
      this.work,
      this.workshop_name,
      this.url,
      this.type,
      this.email_now});

  factory Like1_model.fromJson(Map<String, dynamic> json) {
    return Like1_model(
      type: json['type'],
      fullName: json['full_name'],
      work: json['work'],
      workshop_name: json['workshop_name'],
      location: json['location'],
      email_Worker: json['email'],
      url: json['url'],
      email_now: json['email_now']
    );
  }
}
