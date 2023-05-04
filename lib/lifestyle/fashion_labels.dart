import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FashionLabels extends StatefulWidget {
  const FashionLabels({super.key});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _FashionLabels();
  }
}

class _FashionLabels extends State<FashionLabels> {
  final List<Label> _list = <Label>[];

  @override
  void initState() {
    super.initState();
    _list.add(
      Label(
        name: "Armed Angels",
        description: "tolle & faire Produkte ",
        logo:
            "https://media1.congstar-media.de/fileadmin/files_congstar/cmp/congstar-logo.png",
        homepage: Uri.dataFromString("https://www.congstar.de"),
      ),
    );
    _list.add(
      Label(
        name: "Test",
        description: "Test",
        logo: "https://www.mocken.org/icons/Icon-192.png",
        homepage: Uri.dataFromString("https://www.mocken.org"),
      ),
    );
    _list.add(
      Label(
        name: "Tui",
        description: "toll",
        logo: "https://www.design.tui/_assets/tuismile-tile-blue.svg",
        homepage: Uri.dataFromString("https://www.congstar.de"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "Fashion Labels",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: _list.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              elevation: 10.0,
              child: ListTile(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(
                      10,
                    ),
                  ),
                ),
                leading: ClipOval(
                  child: CachedNetworkImage(
                    imageUrl: _list[index].logo,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(
                  _list[index].name,
                ),
                subtitle: Text(
                  _list[index].description,
                ),
                onTap: () {
                  canLaunchUrl(_list[index].homepage).then((bool result) {
                    if (result) {
                      launchUrl(
                        _list[index].homepage,
                      );
                    }
                  });
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class Label {
  final String name;
  final String logo;
  final String description;
  final Uri homepage;

  Label({
    required this.name,
    required this.description,
    required this.logo,
    required this.homepage,
  });
}
