class Comment_Model {
  String? Comment;
  String? Full_name_Udser;
  String? Image_user;
  double? Rating;
  Comment_Model(
      {this.Comment, this.Full_name_Udser, this.Image_user, this.Rating});

  factory Comment_Model.fromJson(Map<String, dynamic> json) {
    return Comment_Model(
      Comment: json['comment'],
      Image_user: json['url_user'],
      Rating: json['rating'],
      Full_name_Udser: json['full_name_user'],
    );
  }
}
