import 'package:http/http.dart' as http;

class brandServices {
  static const String url =
      'https://asia-northeast1-wc2022-bot.cloudfunctions.net/brands';
  static Future<String> fetchBrands() async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception('Failed to load brands');
    }
  }
}
