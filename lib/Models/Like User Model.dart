// ignore_for_file: camel_case_types, file_names

class LikeUserModel {
  late String name;
  late String profilePicture;

  LikeUserModel({required this.name,required this.profilePicture});

  LikeUserModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    profilePicture = json?['profilePic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['profilePic'] = profilePicture;
    return data;
  }
}