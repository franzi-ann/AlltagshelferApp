import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

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
      ),
    );
    _list.add(
      Label(
        name: "Test",
        description: "Test",
        logo: "https://www.mocken.org/icons/Icon-192.png",
      ),
    );
    _list.add(
      Label(
        name: "Tui",
        description: "toll",
        logo: "https://www.design.tui/_assets/tuismile-tile-blue.svg",
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

  Label({
    required this.name,
    required this.description,
    required this.logo,
  });
}
