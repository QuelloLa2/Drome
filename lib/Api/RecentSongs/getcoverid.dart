import 'dart:convert';

import 'package:http/http.dart' as http;

import "package:drome/Utils/storage.dart" as storage;

Future<List<String>> getCoverId() async {
  final response = await http.get(await _getUri());

  List<String> listIdCover = [];

  if (response.statusCode == 200 || response.statusCode == 201) {
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    var album = data['subsonic-response']?['albumList2']?['album'] as List<dynamic>?;

    if (album != null) {
      for (var item in album) {
        listIdCover.add(item['coverArt']);
      }
    }
  }
  return listIdCover;
}

Future<Uri> _getUri() async {
  final url = await storage.getServer();

  final uri = Uri.parse(url!);

  return Uri(
    scheme: uri.scheme,
    host: uri.host,
    path: "rest/getAlbumList2",
    port: uri.port,
    queryParameters: {
      'f': 'json',
      'v': '1.16.1',
      'c': 'Drome',
      'u': '${await storage.getUsername()}',
      't': '${await storage.getPassword()}',
      's': '${await storage.getSalt()}',
      'size': '12',
      'type': 'newest',
    },
  );
}
