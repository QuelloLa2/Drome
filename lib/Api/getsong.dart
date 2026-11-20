import 'dart:convert';

import 'package:drome/Utils/storage.dart';
import 'package:http/http.dart' as http;
import 'package:drome/Class/song.dart';

Future<List<Song>> getSong() async {
  final response = await http.get(await getUri());

  List<Song> listSongs = [];

  if (response.statusCode == 200 || response.statusCode == 201) {
    var data = jsonDecode(response.body) as Map<String, dynamic>;
    var songs = data['subsonic-response']?['searchResult3']?['song'] as List<dynamic>?;

    if (songs != null) {
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
  }
  return listSongs;
}

Future<Uri> getUri() async {
  final url = await storage.read(key: 'Server');

  final uri = Uri.parse(url!);

  return Uri(
    scheme: uri.scheme,
    host: uri.host,
    path: "rest/search3",
    queryParameters: {
      'f': 'json',
      'v': '1.16.1',
      'c': 'Drome',
      'u': '${await storage.read(key: 'Username')}',
      't': '${await storage.read(key: 'Password')}',
      's': '${await storage.read(key: 'Salt')}',
      'artistCount': '0',
      'albumCount': '0',
      'songCount': '30',
    },
  );
}
