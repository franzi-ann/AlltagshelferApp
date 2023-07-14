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
        name: "Avocado Store",
        description: "Made in Germany, vegan, biologische Rohstoffe",
        logo: "https://www.mocken.org/icons/Icon-192.png",
        homepage: Uri.parse(
          "https://www.avocadostore.de",
        ),
      ),
    );

    _list.add(
      Label(
        name: "Rock on and Namaste",
        description: "Bio, fair und vegan",
        logo: "https://www.mocken.org/icons/Icon-192.png",
        homepage: Uri.parse(
          "https://rockonandnamaste.com",
        ),
      ),
    );
    _list.add(
      Label(
        name: "Armed Angels",
        description: "Bio Baumwolle, Second Hand",
        logo: "https://www.mocken.org/icons/Icon-192.png",
        homepage: Uri.parse(
          "https://www.armedangels.com/de-de",
        ),
      ),
    );
    _list.add(
      Label(
        name: "Ragwear",
        description: "Streetwear, vegan, nachhaltige Materialien",
        logo: "https://www.mocken.org/icons/Icon-192.png",
        homepage: Uri.parse(
          "https://www.ragwear.com/de/",
        ),
      ),
    );
    _list.add(
      Label(
        name: "Veganliebe",
        description: "fair, vegan, Lifestyle und Ernährung",
        logo: "https://www.mocken.org/icons/Icon-192.png",
        homepage: Uri.parse("https://veganliebe.de"),
      ),
    );
    _list.add(
      Label(
        name: "Vinted",
        description: "2nd Hand - Geld sparen inklusive ",
        logo: "https://www.mocken.org/icons/Icon-192.png",
        homepage: Uri.parse("https://www.vinted.de"),
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
                    launchUrl(
                      mode: LaunchMode.platformDefault,
                      _list[index].homepage,
                    );
                  }),
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
