// ignore_for_file: non_constant_identifier_names

class Service_model {
  // ignore: 
  String? fullName_user;
  String? fullName_worker;
  String? location_user;
  String? location_worker;
  String? work;
  String? email_user;
  String? email_worker;

  String? to_be_sure_user;
  String? to_be_sure_worker;
  String? url_user;
  String? url_worker;
  Service_model({
    this.email_user,
    this.email_worker,
    this.fullName_user,
    this.fullName_worker,
    
    this.location_worker,
    this.work,
    this.url_user,
    this.url_worker,
    this.to_be_sure_user,
    this.to_be_sure_worker,
  });

  factory Service_model.fromJson(Map<String, dynamic> json) {
    return Service_model(
        fullName_user: json['fullName_user'],
        fullName_worker: json['fullName_worker'],
        
        location_worker: json['location_worker'],
        url_user: json['url_user'],
        url_worker: json['url_worker'],
        to_be_sure_user: json['to_be_sure_user'],
        to_be_sure_worker: json['to_be_sure_worker'],
        email_user: json['email_user'],
        email_worker: json['email_worker'],
        work: json['work']);
  }
}
