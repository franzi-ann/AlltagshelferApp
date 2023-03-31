import 'package:sustain/places/place.dart';

class MarketPlace extends Place {
  String? _description;
  String? _openingHours;
  String? _openingDays;

  MarketPlace({
    required super.name,
    required super.lat,
    required super.lng,
    required super.address,
  });

  get description => _description;

  set description(value) => _description = value;

  get openingHours => _openingHours;

  set openingHours(value) => _openingHours = value;

  get openingDays => _openingDays;

  set openingDays(value) => _openingDays = value;
}
