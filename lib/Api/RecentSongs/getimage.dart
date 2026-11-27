String getImage(String idCover, int size, Map<String, String?> listUser) {
  final url = listUser["Server"];

  final uri = Uri.parse(url!);

  Uri request = Uri(
    scheme: uri.scheme,
    host: uri.host,
    path: "rest/getCoverArt",
    port: uri.port,
    queryParameters: {
      'f': 'json',
      'v': '1.16.1',
      'c': 'Drome',
      'u': '${listUser["Username"]}',
      't': '${listUser["Password"]}',
      's': '${listUser["Salt"]}',
      'id': idCover,
      "size": "${size * 2.5}",
    },
  );

  return request.toString();
}
