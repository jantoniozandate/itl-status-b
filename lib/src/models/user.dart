class User {
  final String id;
  final String fullName;
  final String email;
  final String username;
  final String sessionId;
  final String lastLogin;
  final String publicKey;
  final String password;

  User(
      {this.email,
      this.username,
      this.id = '',
      this.fullName = '',
      this.sessionId = '',
      this.lastLogin = '',
      this.publicKey = '',
      this.password = ''});

  User.fromData(Map<String, dynamic> data)
      : id = data['_id'],
        fullName = data['fullName'] ?? '',
        email = data['email'] ?? '',
        username = data['username'] ?? '',
        sessionId = data['sessionId'] ?? '',
        lastLogin = data['lastLogin'] ?? '',
        publicKey = data['publicKey'] ?? '',
        password = '';

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
    };
  }

  @override
  String toString() {
    return this.toJson().toString();
  }
}
