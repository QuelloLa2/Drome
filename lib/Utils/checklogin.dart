import "package:drome/Utils/storage.dart" as auth;
import "package:drome/main.dart";

Future<AuthState> checkLogin() async{
  final bool checkServer = await auth.getServer() != null;
  final bool checkUsername = await auth.getUsername() != null;
  final bool checkPassword = await auth.getPassword() != null;
  final bool checkSalt = await auth.getSalt() != null;

  final bool check = checkSalt && checkPassword && checkUsername && checkServer;

  if (!check) {
    return AuthState.unauth;
  }

  return AuthState.auth;
}
