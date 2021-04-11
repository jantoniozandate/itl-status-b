class User {
  final String id;
  final String fullName;
  final String email;
  final String username;
  final String sessionId;
  final String lastLogin;
  final String publicKey;
  final String password;
  final int sessionExpiresAt;

  User(
      {this.email,
      this.username,
      this.id = '',
      this.fullName = '',
      this.sessionId = '',
      this.lastLogin = '',
      this.publicKey = '',
      this.password = '',
      this.sessionExpiresAt = -1});

  User.fromData(Map<String, dynamic> data)
      : id = data['_id'],
        fullName = data['fullName'] ?? '',
        email = data['email'] ?? '',
        username = data['username'] ?? '',
        sessionId = data['sessionId'] ?? '',
        lastLogin = data['lastLogin'] ?? '',
        publicKey = data['publicKey'] ?? '',
        password = '',
        sessionExpiresAt = data['expiresAt'] ?? -1;
    
  User.fromJson(dynamic data) : 
        id = data['_id'],
        fullName = data['fullName'] ?? '',
        email = data['email'] ?? '',
        username = data['username'] ?? '',
        sessionId = data['sessionId'] ?? '',
        lastLogin = data['lastLogin'] ?? '',
        publicKey = data['publicKey'] ?? '',
        password = '',
        sessionExpiresAt = data['expiresAt'] ?? -1;

  Map<String, dynamic> toJson() {
    return {
      "_id": id,
      "fullName": fullName,
      "email": email,
      "username": username,
      "sessionId": sessionId,
      "lastLogin": lastLogin,
      "publicKey": publicKey,
      "expiresAt": sessionExpiresAt
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
