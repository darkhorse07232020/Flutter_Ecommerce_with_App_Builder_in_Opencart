import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

String apiTokenKey;
bool isLoaded = false;

Future<bool> getAPItoken() async {
  var map = new Map<String, dynamic>();
  map['username'] = 'easycart';
  map['key'] =
      'GEQnIpE2KLQvYZMO58medmB2jn5gpFsgTohzgolWJJzcQuuR6gVezHpssIukp5AKCFMbCutcjtgOvORbiscycMGaMZmykTG7lnCCXi7LjDcIq0Mq1wriF3IpuKItzoxSIG34A3MLIJ5WqBa0vYsxosd3H63LWd5tOfmvQuiWzorGboxdfL3NGnVPCjqqwet1dbONc8f2VD0GQ2bdTLQ8pfroncmqIfzoNglWwV4b2XzUZZ6xkup7JXQ7HxtmNEAE';
  final response = await http.post(
    'https://easycartapp.com/index.php?route=api/login',
    body: map,
  );
  Map<String, dynamic> responseJson = json.decode(response.body);

  if (response.statusCode == 200) {
    apiTokenKey = responseJson['api_token'];
  } else {
    throw Exception('Failed to load LangClass');
  }
  return true;
}
