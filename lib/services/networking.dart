import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  final String _url;

  NetworkHelper(this._url);

  Future getData() async {
    var url = Uri.parse(_url);
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print(response.statusCode);
    }

    return null;
  }
}
