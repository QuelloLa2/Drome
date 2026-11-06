import 'dart:convert';
import 'package:http/http.dart' as http;


Future<(dynamic, bool)> pingServer(
  String server,
  String username,
  String hashPassword,
  String salt,
) async {
  final response = await http.get(await _getUri(server, hashPassword, salt, username));

  if (response.statusCode == 200 || response.statusCode == 201) {
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    String status = 'Error';
    if (data['subsonic-response'] != null) {
      status = data['subsonic-response']['status'];

      if (status == 'ok') {
        return (null, true);
      }
    }

    return (status, false);
  }

  return (response, false);
}

Future<Uri> _getUri(String server, String? hashPassword, String? salt, String username) async {
  final url = server;

  final uri = Uri.parse(url);

  return Uri(
    scheme: uri.scheme,
    host: uri.host,
    path: 'rest/ping',
    queryParameters: {
      'f': 'json',
      'v': '1.16.1',
      'c': 'Drome',
      'u': username,
      't': hashPassword,
      's': salt,
    },
  );
}
