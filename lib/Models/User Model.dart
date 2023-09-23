// ignore_for_file: camel_case_types, file_names

class UserModel {
  late String name;
  late String email;
  late String phone;
  late String uId;
  late String bio;
  late String profilePicture;
  late String coverPicture;

  UserModel({required this.name, required this.email,required this.phone,required this.uId,required this.bio,required this.coverPicture,required this.profilePicture});

  UserModel.fromJson(Map<String, dynamic>? json) {
    name = json?['name'];
    email = json?['email'];
    phone = json?['phone'];
    uId = json?['uId'];
    bio = json?['bio'];
    profilePicture = json?['profilePicture'];
    coverPicture = json?['coverPicture'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['uId'] = uId;
    data['bio'] = bio;
    data['profilePicture'] = profilePicture;
    data['coverPicture'] = coverPicture;
    return data;
  }
}