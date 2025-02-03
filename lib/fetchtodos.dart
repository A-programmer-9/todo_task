import 'package:http/http.dart' as http;
import 'dart:convert';

class Fetchtodos {
  static Future<List<dynamic>> fetchData() async {
    final fetchData =
        await http.get(Uri.parse("http://dummy-json.mock.beeceptor.com/todos"));

    if (fetchData.statusCode == 200) {
      var todos = jsonDecode(fetchData.body) as List<dynamic>;

      return todos;
    }
    return List.empty();
  }
}
