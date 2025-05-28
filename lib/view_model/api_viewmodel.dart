import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiViewmodel {
  final url = Uri.parse("https://fakestoreapi.com/users");

  Future<dynamic> getUsers() async {
    try {
      final responseGet = await http.get(url,
          headers: {"Content-Type": "application/json"});
      if (responseGet.statusCode == 200 ||
          responseGet.statusCode == 201) {
        return jsonDecode(responseGet.body);
      } else {
        throw Exception(
            'GET failed: ${responseGet.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> postUser(
      Map<String, dynamic> body) async {
    try {
      final responsePost =
          await http.post(url, body: jsonEncode(body));
      if (responsePost.statusCode == 201 ||
          responsePost.statusCode == 200) {
        return jsonDecode(responsePost.body);
      } else {
        throw Exception(
            'GET failed: ${responsePost.statusCode}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
