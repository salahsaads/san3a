
class Image_Model_work_all {
  String? url;
  String? email;
  String? id;
  Image_Model_work_all({this.url, this.email, e});

  factory Image_Model_work_all.fromJson(Map<String, dynamic> json) {
    return Image_Model_work_all(
      email: json['email'],
      url: json['image_url'],
      
    );
  }
}
