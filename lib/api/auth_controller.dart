import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthController {
  static const BASE_URL = 'http://food-engine.herokuapp.com/api';
  static const HEADER = {
    'Content-Type': 'application/json',
    'Accept': 'application/json'
  };

  static signInWithEmailAndPassword({String email, String password}) async {
    Map<String, dynamic> authData = {'email': email, 'password': password};
    final body = json.encode(authData);

    http.Response response = await http.post(
      '$BASE_URL/login',
      body: body,
      headers: HEADER,
    );
    Map<String, dynamic> data = json.decode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return data['data'];
    }
  }

  static createUserWithEmailAndPassword({String name, String email, String password}) async {
    Map<String, dynamic> authData = {'name': name ,'email': email, 'password': password};
    final body = json.encode(authData);

    http.Response response = await http.post(
      '$BASE_URL/register',
      body: body,
      headers: HEADER,
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      Map<String, dynamic> data = json.decode(response.body);
      print(data['data']);
      return data['data'];
    }else {
      throw Exception('Failed to fetch loans');
    }
  }

  static signOut() async {
    await http.post(
      '$BASE_URL/logout',
      body: null,
      headers: HEADER,
    );
  }
}
