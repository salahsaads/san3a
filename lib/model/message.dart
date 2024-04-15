// ignore_for_file: empty_constructor_bodies

class Message {
  final String text;
  final String email_user;
  final String email_worker;
  final String user_send;
  Message(this.text, this.email_user, this.email_worker, this.user_send);

  factory Message.fromjson(jsonData) {
    return Message(jsonData['message'], jsonData['email_user'],
        jsonData['email_worker'], jsonData['user_send']);
  }
}
