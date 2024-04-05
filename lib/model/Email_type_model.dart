class Email_Type_model {
  String? email;
  String? email_type;

  Email_Type_model({this.email, this.email_type});

  factory Email_Type_model.fromJson(Map<String, dynamic> json) {
    return Email_Type_model(
      email_type: json['email_type'],
      email: json['email'],
    );
  }
}
