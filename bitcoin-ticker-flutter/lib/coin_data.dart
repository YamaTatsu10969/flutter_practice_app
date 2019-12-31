import 'networking.dart';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const baseURL = 'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

enum Symbol {
  BTC,
  ETH,
  LTC,
}

class CoinData {
  CoinData({this.country, this.crypto});
  final String country;
  final String crypto;
  double price;

  Future getPrice() async {
    String query = crypto + country;
    NetworkHelper networking = NetworkHelper(baseURL + query);
    var data = await networking.getData();
    print(data);
    price = await data['last'];
    return price;
  }
}
