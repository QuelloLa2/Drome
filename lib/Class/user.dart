class Username {
  final String username;
  final String hashPassword;
  final String hashSalt;

  final String server;

  Username({
    required this.username,
    required this.hashPassword,
    required this.hashSalt,
    required this.server,
  });
}
