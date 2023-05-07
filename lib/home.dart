import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:location/location.dart';
import 'package:sustain/utils/app_dialog.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Home();
  }
}

class _Home extends State<Home> {
  Location location = Location();

  late bool _serviceEnabled;
  late PermissionStatus _permissionGranted;

  @override
  initState() {
    super.initState();
    _initialize();
  }

  _initialize() async {
    _serviceEnabled = await location.serviceEnabled();

    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(
          10,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              FlutterCarousel(
                options: CarouselOptions(
                  height: 120.0,
                  showIndicator: true,
                  slideIndicator: const CircularSlideIndicator(),
                ),
                items: [
                  "Wenn an vielen kleinen Orten",
                  "viele kleine Menschen",
                  "viele kleine Dinge tun",
                  "wird sich das Angesicht unserer Erde verändern.",
                  "Wenn an vielen kleinen Orten viele kleine Menschen viele kleine Dinge tun wird sich das Angesicht unserer Erde verändern.",
                ].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return SizedBox(
                        child: Center(
                          child: Text(
                            ' $i',
                            softWrap: true,
                            style: const TextStyle(
                              fontSize: 15,
                              fontStyle: FontStyle.italic,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: GridView.count(
                  primary: false,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  crossAxisSpacing: 2.0,
                  mainAxisSpacing: 2.0,
                  children: [
                    GestureDetector(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.warehouse,
                              size: 50,
                            ),
                            Text(
                              "Regionales",
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/regionals",
                        );
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.people,
                              size: 50,
                            ),
                            Text(
                              "Community",
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/community",
                        );
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.food_bank,
                              size: 50,
                            ),
                            Text(
                              "Ernährung & Lifestyle",
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/lifestyle",
                        );
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.light,
                              size: 50,
                            ),
                            Text(
                              "Energie sparen",
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                    GestureDetector(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.tips_and_updates,
                              size: 50,
                            ),
                            Text(
                              "Tipp der Woche",
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        AppDialog(content: _getTipp(), buildContext: context)
                            .showAppDialog();
                      },
                    ),
                    GestureDetector(
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(
                              Icons.train,
                              size: 50,
                            ),
                            Text(
                              "Mobilität",
                            ),
                          ],
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getTipp() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          "Diese Woche stellen wir euch ein paar schöne Apps vor:",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Toogoodtogo: Lebensmittel retten in deiner Umgebung.  Vielleicht ist auch in deiner Umgebung was dabei: ",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        IconButton(
          onPressed: () {
            launchUrl(
              mode: LaunchMode.platformDefault,
              Uri.parse("https://toogoodtogo.org/en"),
            );
          },
          icon: const Icon(
            Icons.get_app,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Mit der App GrünZeit einfach und überall herausfinden, wann klimafreundliches, heimisches Gemüse Saison hat",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        IconButton(
          icon: const Icon(
            Icons.get_app,
          ),
          onPressed: () {
            launchUrl(
              mode: LaunchMode.platformDefault,
              Uri.parse(
                  "https://apps.apple.com/de/app/gr%C3%BCnzeit/id1188737687"),
            );
          },
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          "Lebensmittel direkt beim Erzeuger kaufen.",
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        IconButton(
          icon: const Icon(
            Icons.get_app,
          ),
          onPressed: () {
            launchUrl(
              mode: LaunchMode.platformDefault,
              Uri.parse("https://www.crowdfarming.com/de"),
            );
          },
        ),
      ],
    );
  }
}
