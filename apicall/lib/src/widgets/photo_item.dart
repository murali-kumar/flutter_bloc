import 'package:apicall/src/model/photo_info.dart';
import 'package:flutter/material.dart';

class PhotoItem extends StatelessWidget {
  final PhotoInfo photoInfo;

  const PhotoItem({Key? key, required this.photoInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(photoInfo.title),
        trailing:
            CircleAvatar(backgroundImage: NetworkImage(photoInfo.thumbnailUrl)),
      ),
    );
  }
}
