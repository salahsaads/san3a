class Info_Model_Client {
  String? fullName;

  String? phonenumber;
  String? url;
  String? email;
  String? email_type;
  String? id;
  Info_Model_Client(
      {this.email, this.fullName, this.phonenumber, this.email_type,this.url});

  factory Info_Model_Client.fromJson(Map<String, dynamic> json) {
    return Info_Model_Client(
      fullName: json['full_name'],
      email_type: json['email_type'],
      email: json['email'],
      phonenumber: json['phonenumber'],
      url: json['url_client']
    );
  }
}
