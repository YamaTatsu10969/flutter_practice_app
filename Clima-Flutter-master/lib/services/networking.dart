import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkHelper {
  NetworkHelper(this.url);

  final String url;

  Future getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      // jsonDecode は何回も呼ぶものじゃない。
      // 処理に時間がかかるみたい。
      // 一回読んで、そのまま使う。
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }
  }
}
