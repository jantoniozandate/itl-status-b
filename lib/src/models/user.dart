class User {
  String id;
  String email;
  String username;
  String sessionId;
  String lastLogin;
  String publicKey;
  int sessionExpiresAt;
  String password;

  User(
      {this.email,
      this.username,
      this.id = '',
      this.sessionId = '',
      this.lastLogin = '',
      this.publicKey = '',
      this.password = '',
      this.sessionExpiresAt = -1});

  User.fromData(Map<String, dynamic> data)
      : id = data['_id'],
        email = data['email'] ?? '',
        username = data['username'] ?? '',
        sessionId = data['sessionId'] ?? '',
        lastLogin = data['lastLogin'] ?? '',
        publicKey = data['publicKey'] ?? '',
        password = '',
        sessionExpiresAt = data['expiresAt'] ?? -1;

  User.fromJson(dynamic data)
      : id = data['_id'],
        email = data['email'] ?? '',
        username = data['username'] ?? '',
        sessionId = data['sessionId'] ?? '',
        lastLogin = data['lastLogin'] ?? '',
        publicKey = data['publicKey'] ?? '',
        password = '',
        sessionExpiresAt = data['expiresAt'] ?? -1;

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "email": email,
      "username": username,
      "sessionId": sessionId,
      "sessionExpiresAt": sessionExpiresAt,
      "publicKey": publicKey
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
