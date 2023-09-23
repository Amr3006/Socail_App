
// ignore_for_file: file_names

class CommentUserModel {
  late String name;
  late String profilePicture;
  late String text;

  CommentUserModel({required this.name,required this.profilePicture,required this.text});

  CommentUserModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    profilePicture = json?['profilePic'];
    text = json?['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['profilePic'] = profilePicture;
    data['text'] = text;
    return data;
  }
}