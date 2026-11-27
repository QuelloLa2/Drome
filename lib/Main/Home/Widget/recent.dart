import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:drome/Api/RecentSongs/getcoverid.dart';
import 'package:drome/Api/RecentSongs/getimage.dart';
import 'package:drome/Utils/storage.dart' as storage;

class RecentGrid extends StatefulWidget {
  const RecentGrid({super.key, required this.title});

  final String title;

  @override
  State<RecentGrid> createState() => _RecentGridState();
}

class _RecentGridState extends State<RecentGrid> {
  late List<String> listImages;
  final double size = 135;

  @override
  void initState() {
    listImages = [];
    getImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: TextStyle(fontSize: 24)),
        SizedBox(
          height: size,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 10,
            ),
            itemCount: listImages.length,
            itemBuilder: (context, index) {
              return SizedBox(
                child: CachedNetworkImage(
                  imageUrl: listImages[index],
                  progressIndicatorBuilder: (context, url, downloadProgress) => Padding(
                    padding: EdgeInsetsGeometry.all(32),
                    child: CircularProgressIndicator(value: downloadProgress.progress),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void getImages() async {
    final result = await Future.wait([
      storage.getServer(),
      storage.getUsername(),
      storage.getPassword(),
      storage.getSalt(),
    ]);

    Map<String, String?> listUser = {
      "Server": result[0],
      "Username": result[1],
      "Password": result[2],
      "Salt": result[3],
    };

    List<String> idCover = await getCoverId();
    for (var item in idCover) {
      listImages.add(getImage(item, size.toInt(), listUser));
    }
    if (!mounted) return;
    setState(() {});
  }
}
