class Info_Model {
  String? fullName;
  String? dateOfBirth;
  String? location;
  String? phonenumber;
  String? work;
  String? email;
  String? workshop_name;
  Info_Model(
      {this.dateOfBirth,
      this.email,
      this.fullName,
      this.location,
      this.phonenumber,
      this.work,
      this.workshop_name});



       factory Info_Model.fromJson(Map<String, dynamic> json) {
    return Info_Model(
      fullName: json['full_name'],
      work: json['work'],
      workshop_name: json['workshop_name'],
      location: json['location'],
      dateOfBirth: json['dateofbirth'],
      email: json['email'],
      phonenumber: json['phonenumber'],
      
    );
  }
}
