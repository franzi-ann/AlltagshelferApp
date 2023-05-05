import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_osm_plugin/flutter_osm_plugin.dart';
import 'package:sustain/http_utils/fetch_data.dart';
import 'package:sustain/places/place.dart';
import 'package:sustain/utils/app_dialog.dart';
import 'dart:io' show Platform;

class LocationMap extends StatefulWidget {
  final int _type;
  const LocationMap(
    this._type, {
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _LocationMap();
}

class _LocationMap extends State<LocationMap> {
  late MapController _mapController;
  final Map<String, Place> _map = <String, Place>{};

  _addPlaces(Place place) {
    _map[place.uuid()] = place;
    _mapController.addMarker(
      GeoPoint(
        latitude: place.lat,
        longitude: place.lng,
      ),
      markerIcon: Platform.isIOS
          ? const MarkerIcon(
              iconWidget: Icon(
                Icons.location_pin,
              ),
            )
          : const MarkerIcon(
              iconWidget: Icon(
                Icons.location_pin,
                size: 100,
              ),
            ),
    );
  }

  _getPlaces() {
    FetchData fetchData = FetchData();
    if (widget._type == 1) {
      fetchData.fetchMarkets().then(
            (values) => {
              for (var value in values)
                _addPlaces(
                  value,
                ),
            },
          );
    } else {
      fetchData.fetchFarmShop().then(
            (values) => {
              for (var value in values)
                _addPlaces(
                  value,
                ),
            },
          );
    }
  }

  @override
  void initState() {
    super.initState();
    _mapController = MapController(
      initMapWithUserPosition: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          OSMFlutter(
            controller: _mapController,
            initZoom: 12,
            maxZoomLevel: 19,
            minZoomLevel: 2,
            showZoomController: true,
            stepZoom: 1,
            showDefaultInfoWindow: false,
            mapIsLoading: const CupertinoActivityIndicator(),
            onMapIsReady: (p0) {
              _getPlaces();
            },
            markerOption: MarkerOption(
              defaultMarker: const MarkerIcon(
                icon: Icon(
                  Icons.person_pin_circle,
                  color: Colors.blue,
                  size: 56,
                ),
              ),
            ),
            onGeoPointClicked: (p0) {
              String key = "${p0.longitude}-${p0.latitude}";
              Place? current = _map[key];
              if (current != null) {
                AppDialog(
                  content: ListTile(
                    isThreeLine: true,
                    title: Text(
                      current.name,
                    ),
                    subtitle: Text(
                      current.address,
                    ),
                  ),
                  buildContext: context,
                ).showAppDialog();
              }
            },
            trackMyPosition: true,
          ),
          Positioned(
            top: 40,
            left: 10,
            child: IconButton(
              icon: const Icon(
                CupertinoIcons.back,
              ),
              onPressed: () {
                Navigator.pop(
                  context,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
