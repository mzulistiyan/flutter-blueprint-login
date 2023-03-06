// To parse this JSON data, do
//
//     final responseLogin = responseLoginFromJson(jsonString);

import 'dart:convert';

ResponseLogin responseLoginFromJson(String str) =>
    ResponseLogin.fromJson(json.decode(str));

String responseLoginToJson(ResponseLogin data) => json.encode(data.toJson());

class ResponseLogin {
  ResponseLogin({
    required this.success,
    required this.token,
    required this.realName,
    required this.groupName,
    required this.groupId,
    required this.userName,
    required this.userId,
    required this.jabatan,
    required this.pangkat,
    required this.satker,
    required this.subsatker,
  });

  bool success;
  String token;
  String realName;
  String groupName;
  String groupId;
  String userName;
  String userId;
  String jabatan;
  String pangkat;
  String satker;
  String subsatker;

  factory ResponseLogin.fromJson(Map<String, dynamic> json) => ResponseLogin(
        success: json["success"],
        token: json["token"],
        realName: json["real_name"],
        groupName: json["group_name"],
        groupId: json["group_id"],
        userName: json["user_name"],
        userId: json["user_id"],
        jabatan: json["JABATAN"],
        pangkat: json["PANGKAT"],
        satker: json["SATKER"],
        subsatker: json["SUBSATKER"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
        "real_name": realName,
        "group_name": groupName,
        "group_id": groupId,
        "user_name": userName,
        "user_id": userId,
        "JABATAN": jabatan,
        "PANGKAT": pangkat,
        "SATKER": satker,
        "SUBSATKER": subsatker,
      };
}
