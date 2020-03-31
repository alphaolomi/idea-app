//class User {
//  String email;
//  String password;
//
//  User({this.email, this.password});
//}
//

import 'package:flutter/material.dart';

class User {
  final String name;
  final String email;
  final String token;

//  final String tokenType;
//  final int expiresIn;

  User({
    @required this.email,
    @required this.token,
     this.name,
//    @required this.tokenType,
//    @required this.expiresIn,
  });

  User.fromMap(Map<String, dynamic> map)
//      : assert(map['name'] != null),
       : assert(map['email'] != null),
        assert(map['token'] != null),
//        assert(map['token_type'] != null),
//        assert(map['expires_in'] != null),
        name = map['name'],
        email = map['email'],
        token = map['token'];

//        tokenType = map['token_type'],
//        expiresIn = map['expires_in'];

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'name': name,
      'email': email,
      'token': token,
//      'token_type': tokenType,
//      'expires_in': expiresIn
    };

    return map;
  }
}
