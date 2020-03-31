import 'package:flutter/material.dart';
import 'dart:io';

import 'package:ideaapp/models/user.dart';

class Authentication {
  Future<User> singupUser({email, password}) async {
    return await AuthController.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  Future<User> loginUser({email, password}) async {
    return await AuthController.signInWithEmailAndPassword(
        email: email, password: password);
  }

  Future<void> logoutUser() async {
    return await AuthController.signOut();
  }

  showToast(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(new SnackBar(content: Text(message)));
  }

  handleError(e) {
    String errorType;

    if (Platform.isAndroid) {
      switch (e.message) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          errorType = "User not found";
          break;
        case 'The password is invalid or the user does not have a password.':
          errorType = "Invalid username passowrd";
          break;
        case 'The email address is already in use by another account.':
          errorType = "User already register";
          break;
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          errorType = "Time our";
          break;
        // ...
        default:
          errorType = e.message;
      }
    } else if (Platform.isIOS) {
      switch (e.code) {
        case 'Error 17011':
          errorType = "User not found";
          break;
        case 'Error 17009':
          errorType = "Invalid username password";
          break;
        case 'Error 17020':
          errorType = "Network error";
          break;
        // ...
        default:
          errorType = e.message;
          print('Case ${e.message} is not jet implemented');
      }
    }
    print("$errorType");
    return errorType;
  }
}

class AuthController {
  static signInWithEmailAndPassword({email, password}) {}

  static createUserWithEmailAndPassword({email, password}) {}

  static signOut() {}
}
