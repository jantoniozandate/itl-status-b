import 'dart:convert';

import 'package:itlstatusb/src/models/user.dart';
import 'package:itlstatusb/src/utils/RSA_utils.dart';

class Account {
  final String userId;
  final String controlNum;
  final String controlPwd;
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
    final rsaUtils = RSAUtils(user.publicKey, null);

    encControlNum =
        utf8.decode(rsaUtils.encryptByPublicKey(utf8.encode(controlNum)));

    encControlPwd =
        utf8.decode(rsaUtils.encryptByPublicKey(utf8.encode(controlPwd)));

    return {
      "controlNum": encControlNum,
      "controlPwd": encControlPwd
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
