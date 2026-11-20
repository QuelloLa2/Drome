import "package:flutter_secure_storage/flutter_secure_storage.dart";

final storage = const FlutterSecureStorage();

Future<String?> getServer() async => await storage.read(key: "Server");
Future<String?> getUsername() async => await storage.read(key: "Username");
Future<String?> getPassword() async => await storage.read(key: "Password");
Future<String?> getSalt() async => await storage.read(key: "Salt");

void setServer(String server) {
  storage.write(key: "Server", value: server);
}

void setUsername(String username) {
  storage.write(key: "Username", value: username);
}

void setPassword(String password) {
  storage.write(key: "Password", value: password);
}

void setSalt(String salt) {
  storage.write(key: "Salt", value: salt);
}
