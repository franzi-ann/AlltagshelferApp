import 'package:sustain/http_utils/http_rest_client.dart';
import 'package:sustain/places/farmshop.dart';
import 'package:sustain/places/marketplace.dart';

class FetchData {
  Future<List<FarmShop>> fetchFarmShop() async {
    List<FarmShop> list = <FarmShop>[];
    HttpRestClient httpRestClient = HttpRestClient(
      url: "https://www.mocken.org/sustain/getFarmShops",
    );

    HttpResponse response = await httpRestClient.call();
    List<dynamic> json = response.body;
    for (var element in json) {
      FarmShop shop = FarmShop(
        name: element["name"],
        lat: element["latitude"],
        lng: element["longitude"],
        address: element["address"],
      );
      shop.goods = element["goods"];
      shop.description = element["description"];
      list.add(
        shop,
      );
    }
    return list;
  }

  Future<List<MarketPlace>> fetchMarkets() async {
    List<MarketPlace> list = <MarketPlace>[];
    HttpRestClient httpRestClient = HttpRestClient(
      url: "https://www.mocken.org/sustain/getMarkets",
    );

    HttpResponse response = await httpRestClient.call();
    List<dynamic> json = response.body;
    for (var element in json) {
      MarketPlace shop = MarketPlace(
        name: element["name"],
        lat: element["latitude"],
        lng: element["longitude"],
        address: element["address"],
      );
      shop.description = element["description"];
      list.add(
        shop,
      );
    }

    return list;
  }
}
