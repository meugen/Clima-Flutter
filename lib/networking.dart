import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {

  final String _url;

  NetworkHelper(this._url);

  Future getData() async {
    http.Response response = await http.get(_url);
    if (response.statusCode == 200) {
      String data = response.body;
      print(data);

      var decodedData = jsonDecode(data);
      return decodedData;
    } else {
      print(response.statusCode);
    }
  }
}