// ignore_for_file: camel_case_types, file_names

class postModel {
  late String profilePic;
  late String name;
  late String postPic;
  late String text;
  late String dateTime;

  postModel(
      {required this.profilePic, required this.name, required this.postPic,required this.text,required this.dateTime});

  postModel.fromJson(Map<String, dynamic> json) {
    profilePic = json['profilePic'];
    name = json['name'];
    postPic = json['postPic'];
    text = json['text'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['profilePic'] = profilePic;
    data['name'] = name;
    data['postPic'] = postPic;
    data['text'] = text;
    data['dateTime'] = dateTime;
    return data;
  }
}
