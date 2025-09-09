import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> arguments) {}

Future<dynamic> getJson(String endpoint) async {
  var uri = Uri.parse(endpoint); // Create the URI Object from the string
  var response = await http.get(uri); // Make the http request

  return jsonDecode(response.body);
}
