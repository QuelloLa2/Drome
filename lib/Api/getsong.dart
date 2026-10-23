import 'dart:convert';

import 'package:navidrome/Api/storage.dart';
import 'package:http/http.dart' as http;
import 'package:navidrome/Class/song.dart';

Future<List<Song>> getSong() async {
  final response = await http.get(await getUri());

  List<Song> listSongs = [];

  if (response.statusCode == 200 || response.statusCode == 201) {
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    var songs = data['subsonic-response']['searchResult3']['song'] as List<dynamic>;

    for (var song in songs) {
      listSongs.add(
        Song(
          artist: song['artist'],
          idArtist: song['artistId'],
          genre: song['genre'] ?? "Alternative",
          nameAlbum: song['album'],
          idAlbum: song['albumId'],
          nameSong: song['title'],
          idSong: song['id'],
          trackCount: song['track'],
          duration: song['duration'],
          contentType: song['contentType'],
          bitRate: song['bitRate'],
          size: song['size'],
          playCount: song['playCount'],
          path: song['path'],
        ),
      );
    }
  }
  return listSongs;
}

Future<Uri> getUri() async {
  final url = await storage.read(key: 'server');

  final uri = Uri.parse(url!);

  return Uri(
    scheme: uri.scheme,
    host: uri.host,
    path: "rest/search3",
    queryParameters: {
      'f': 'json',
      'v': '1.16.1',
      'c': 'Drome',
      'u': '${await storage.read(key: 'username')}',
      't': '${await storage.read(key: 'hashPassword')}',
      's': '${await storage.read(key: 'hashSalt')}',
      'artistCount': '0',
      'albumCount': '0',
      'songCount': '30',
    },
  );
}
