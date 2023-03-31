import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';

class SimpleMap extends StatefulWidget {
  const SimpleMap({Key? key}) : super(key: key);

  @override
  State<SimpleMap> createState() => _SimpleMap();
}

class _SimpleMap extends State<SimpleMap> {
  late PageController controller;
  late int indexPage;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 1);
    indexPage = controller.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("osm"),
      ),
      body: PageView(
        controller: controller,
        onPageChanged: (p) {
          setState(() {
            indexPage = p;
          });
        },
        children: const <Widget>[
          Center(
            child: Text("page n1"),
          ),
          SimpleOSM(),
        ],
      ),
    );
  }
}

class SimpleOSM extends StatefulWidget {
  const SimpleOSM({super.key});

  @override
  State<StatefulWidget> createState() => SimpleOSMState();
}

class SimpleOSMState extends State<SimpleOSM> {
  late MapController controller;

  @override
  void initState() {
    super.initState();
    controller = MapController(
      initMapWithUserPosition: true,
      areaLimit: BoundingBox(
        north: 10,
        east: 10,
        south: 10,
        west: 10,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OSMFlutter(
      controller: controller,
      markerOption: MarkerOption(
        defaultMarker: const MarkerIcon(
          icon: Icon(
            Icons.person_pin_circle,
            color: Colors.blue,
            size: 56,
          ),
        ),
      ),
      trackMyPosition: true,
    );
  }
}
