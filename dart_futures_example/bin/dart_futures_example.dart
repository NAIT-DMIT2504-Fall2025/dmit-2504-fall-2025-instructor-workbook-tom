import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dart_futures_example/models/dog.dart';

void main(List<String> arguments) async {
  try {
    // Get the dog and parse it
    var json = await getJson('https://dog.ceo/api/breeds/image/random');
    var dog = Dog.fromJson(json);
    print(dog);
  } catch (e) {
    // Throw an exception
    throw Exception('There was an error with the request: ${e.toString()}');
  }
}

Future<dynamic> getJson(String endpoint) async {
  var uri = Uri.parse(endpoint); // Create the URI Object from the string
  var response = await http.get(uri); // Make the http request

  return jsonDecode(response.body);
}
