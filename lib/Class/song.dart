class Song {
  final String nameSong;
  final String idSong;
  final String genre;

  final String artist;
  final String idArtist;

  final String nameAlbum;
  final String idAlbum;

  final int duration;
  final int trackCount;

  final String contentType;
  final int bitRate;
  final int size;

  final String path;
  final int playCount;

  Song({
    required this.artist,
    required this.idArtist,
    required this.genre,

    required this.nameAlbum,
    required this.idAlbum,

    required this.nameSong,
    required this.idSong,

    required this.trackCount,
    required this.duration,

    required this.contentType,
    required this.bitRate,
    required this.size,

    required this.path,
    required this.playCount
  });
}
