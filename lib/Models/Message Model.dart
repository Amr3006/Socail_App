// ignore_for_file: file_names

class MessageModel {
  late String text;
  late String recieverUId;
  late String senderUId;
  late String dateTime;

  MessageModel({
    required this.text, 
    required this.recieverUId, 
    required this.senderUId, 
    required this.dateTime});

  MessageModel.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    recieverUId = json['reciever_uId'];
    senderUId = json['sender_uId'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    data['reciever_uId'] = recieverUId;
    data['sender_uId'] = senderUId;
    data['dateTime'] = dateTime;
    return data;
  }
}
