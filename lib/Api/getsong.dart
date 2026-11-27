import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:drome/Utils/storage.dart' as storage;
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
  final url = await storage.getServer();

  final uri = Uri.parse(url!);

  return Uri(
    scheme: uri.scheme,
    host: uri.host,
    path: "rest/search3",
    port: uri.port,
    queryParameters: {
      'f': 'json',
      'v': '1.16.1',
      'c': 'Drome',
      'u': '${await storage.getUsername()}',
      't': '${await storage.getPassword()}',
      's': '${await storage.getSalt()}',
      'artistCount': '0',
      'albumCount': '0',
      'songCount': '30',
    },
  );
}
