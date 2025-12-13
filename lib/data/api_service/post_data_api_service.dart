import 'package:http/http.dart' as http;

class PostDataApiService {
  static Future<dynamic> postDataApiRequest(String url) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {"Content-type": "application.json"},
      );
      return response;
    } catch (e) {
      throw "error throw is $e";
    }
  }
}
