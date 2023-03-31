import 'package:sustain/places/place.dart';

class FarmShop extends Place {
  String? _description;
  String? _url;
  String? _openingHours;
  String? _openingDays;
  List<String>? _goods;

  get description => _description;

  set description(value) => _description = value;

  get url => _url;

  set url(value) => _url = value;

  get openingHours => _openingHours;

  set openingHours(value) => _openingHours = value;

  get openingDays => _openingDays;

  set openingDays(value) => _openingDays = value;

  get goods => _goods;

  set goods(value) => _goods = value;

  FarmShop({
    required super.name,
    required super.lat,
    required super.lng,
    required super.address,
  });
}
