class Image_Model_work {
  String? url;
  String? email;

  Image_Model_work(
      {this.url,
      this.email,
    e});

  factory Image_Model_work.fromJson(Map<String, dynamic> json) {
    return Image_Model_work(
      
      email: json['email'],
      url: json['image_url'],
    );
  }
}
