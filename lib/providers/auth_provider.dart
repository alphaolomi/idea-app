import 'dart:io';

import 'package:flutter/material.dart';

import 'package:ideaapp/api/auth_controller.dart';
import 'package:ideaapp/models/user.dart';
import 'package:ideaapp/service/authenticate.dart';
import 'package:ideaapp/shared/shared_pref.dart';

class AuthDataProvider extends ChangeNotifier implements Auth {
  User _user;
  SharedPref _sharedPref = SharedPref();

  User get authenticatedUser => _user;

  SharedPref get sharedPref => _sharedPref;

  @override
  Future<User> signupUser({String name, String email, String password}) async {
    var data = await AuthController.createUserWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
    _user = User.fromMap(data);
    _sharedPref.save('user', _user.toString());
    notifyListeners();
    return _user;
  }

  @override
  Future<User> loginUser({String email, String password}) async {
    var data = await AuthController.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    print(data);
    _user = User.fromMap(data);
    print('ap:' + _user.toString());
    _sharedPref.save('user', _user.toMap());
    notifyListeners();
    return _user;
  }

  @override
  Future<void> logoutUser() async {
    await AuthController.signOut();
    await _sharedPref.remove("user");
    return;
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

  Future<bool> autoAuthenticate() async {
    bool _isAuth = false;
    try {
      User _userAuth = await _sharedPref.read("user");
      print('fire waist asdasdasd' + _userAuth.toString());
//      User _userAuth = User.fromMap(saved);

      _user = _userAuth;
      _isAuth = true;
      notifyListeners();
    } catch (e) {
      _isAuth = false;
    }
    return _isAuth;
  }
}
