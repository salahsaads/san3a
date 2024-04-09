class Info_Model {
  String? fullName;
  String? dateOfBirth;
  String? location;
  String? phonenumber;
  String? work;
  String? email;
  String? workshop_name;
  String? id;
  String? url;
  String? url_work;
  Info_Model(
      {this.dateOfBirth,
      this.email,
      this.fullName,
      this.location,
      this.phonenumber,
      this.work,
      this.workshop_name,
      this.url,
      
      this.url_work
      });

  factory Info_Model.fromJson(Map<String, dynamic> json) {
    return Info_Model(
      fullName: json['full_name'],
      work: json['work'],
      workshop_name: json['workshop_name'],
      location: json['location'],
      dateOfBirth: json['dateofbirth'],
      email: json['email'],
      phonenumber: json['phonenumber'],
      url: json['url'],
      url_work: json['url_work']
    );
  }
}
