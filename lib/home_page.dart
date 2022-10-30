import 'package:api_photos/model/photo.dart';
import 'package:flutter/material.dart';

import 'services/remote_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Photo>? photos;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    photos = await RemoteService().getphotos();
    if (photos != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Center(
            child: Text(
              'Photo',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: photos?.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(photos![index].thumbnailUrl)),
                  title: Text('${photos![index].id}.${photos![index].title}'),
                )
              ],
            );
          },
        ));
  }
}
