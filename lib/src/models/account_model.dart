import 'dart:convert';

import 'package:itlstatusb/src/models/user.dart';
// import 'package:itlstatusb/src/utils/RSA_utils.dart';
import 'package:encrypt/encrypt.dart';
import 'package:pointycastle/asymmetric/pkcs1.dart';
import 'package:pointycastle/pointycastle.dart';


class Account {
  final String userId;
  String controlNum;
  String controlPwd;
  String encControlNum;
  String encControlPwd;
  final User user;

  Account(
      {this.userId,
      this.controlNum,
      this.controlPwd,
      this.encControlNum,
      this.encControlPwd,
      this.user});

  Account.fromData(Map<String, dynamic> data)
      : userId = data['_id'] ?? '',
        controlNum = data['controlNum'] ?? '',
        controlPwd = data['controlPwd'] ?? '',
        encControlNum = '',
        encControlPwd = '',
        user = User.fromData(data['user']);

  Account.fromJson(dynamic data)
      : userId = data['_id'] ?? '',
        controlNum = data['controlNum'] ?? '',
        controlPwd = data['controlPwd'] ?? '',
        encControlNum = '',
        encControlPwd = '',
        user = User.fromData(data['user']);

  Map<String, dynamic> encryptControlData() {
    final publicKey = RSAKeyParser().parse(user.publicKey) as RSAPublicKey;
    final encrypter = Encrypter(RSA(publicKey: publicKey, encoding: RSAEncoding.OAEP));

    Codec<String, String> stringToBase64 = utf8.fuse(base64);

    final encControlNum = encrypter.encrypt(controlNum).base64;
    final encControlPwd = encrypter.encrypt(controlPwd).base64;

    return {
      "controlNum": encControlNum,
      "controlPwd": encControlPwd,
      "id": user.id,
      "sessionId": user.sessionId,
      "email": user.email,
      "username": user.username
    };
  }

  Map<String, dynamic> toJson() {
    var result = encryptControlData();

    result.addAll(user.toJson());

    return result;
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
