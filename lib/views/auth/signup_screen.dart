import 'package:flutter/material.dart';

import 'package:ideaapp/models/authentication.dart';
import 'package:ideaapp/models/user.dart';
import 'package:ideaapp/models/validation.dart';
import 'package:ideaapp/views/welcome.dart';
import 'package:ideaapp/widgets/custom_button.dart';
import 'package:ideaapp/widgets/form_input_decoration.dart';
import 'package:ideaapp/widgets/loader.dart';
import 'package:ideaapp/widgets/page_header.dart';

class Signup extends StatefulWidget {
  createState() => SignupState();
}

class SignupState extends State<Signup> {
  Authentication _authentication;
  FocusNode username, email, password, confirmPassword;
  TextEditingController emailCtrl, passwordCtrl, usernameCtrl, cpasswordCtrl;

  final _formKey = GlobalKey<FormState>();
  bool _autoValid = false, loader = false;

  @override
  void initState() {
    super.initState();

    _authentication = Authentication();

    _autoValid = false;
    loader = false;

    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    usernameCtrl = TextEditingController();
    cpasswordCtrl = TextEditingController();

    username = FocusNode();
    email = FocusNode();
    password = FocusNode();
    confirmPassword = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();

    username?.unfocus();
    email?.unfocus();
    password?.unfocus();
    confirmPassword?.unfocus();
    emailCtrl?.dispose();
    passwordCtrl?.dispose();
    usernameCtrl?.dispose();
    cpasswordCtrl?.dispose();
  }

  signup(BuildContext context) async {
    email.unfocus();
    password.unfocus();
    username.unfocus();
    confirmPassword.unfocus();

    setState(() => _autoValid = true);
    if (_formKey.currentState.validate()) {
      try {
        setState(() {
          loader = true;
        });
        print("SUCCESS"); // okay
        User _user = await _authentication.singupUser(
            email: emailCtrl.value.text, password: passwordCtrl.value.text);
        print(_user); // debug
        if (_user != null) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => WelcomeScreen(
//                      user:_user.user,
                    ),
              ),
              ModalRoute.withName('/root'));
        }
        setState(() {
          loader = false;
        });
      } catch (e) {
        _authentication.showToast(context, _authentication.handleError(e));
        setState(() {
          loader = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Builder(
          builder: (context) {
            return Stack(
              children: <Widget>[
                signupForm(context),
                loader ? loaderWidget() : Container()
              ],
            );
          },
        ),
      ),
    );
  }

  Widget signupForm(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        autovalidate: _autoValid,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              PageHeader(title: "Register Now"),
              SizedBox(
                height: 30.0,
              ),
              TextFormField(
                controller: usernameCtrl,
                textInputAction: TextInputAction.next,
                focusNode: username,
                style: FormInputDecoration.customTextStyle(),
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.none,
                decoration:
                    FormInputDecoration.formInputDesign(name: "Username"),
                onFieldSubmitted: (node) {
                  username.unfocus();
                  FocusScope.of(context).requestFocus(email);
                },
                validator: (value) => CheckFieldValidation(
                    val: value,
                    password: null,
                    fieldName: "Username",
                    fieldType: VALIDATION_TYPE.TEXT),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                focusNode: email,
                textInputAction: TextInputAction.next,
                style: FormInputDecoration.customTextStyle(),
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.none,
                decoration:
                    FormInputDecoration.formInputDesign(name: "Email Address"),
                onFieldSubmitted: (node) {
                  email.unfocus();
                  FocusScope.of(context).requestFocus(password);
                },
                validator: (value) => CheckFieldValidation(
                    val: value,
                    password: null,
                    fieldName: "Email",
                    fieldType: VALIDATION_TYPE.EMAIL),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: passwordCtrl,
                textInputAction: TextInputAction.next,
                focusNode: password,
                obscureText: true,
                style: FormInputDecoration.customTextStyle(),
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.none,
                decoration:
                    FormInputDecoration.formInputDesign(name: "Password"),
                onFieldSubmitted: (node) {
                  password.unfocus();
                  FocusScope.of(context).requestFocus(confirmPassword);
                },
                validator: (value) => CheckFieldValidation(
                    val: value,
                    password: null,
                    fieldName: "Password",
                    fieldType: VALIDATION_TYPE.PASSWORD),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: cpasswordCtrl,
                textInputAction: TextInputAction.done,
                focusNode: confirmPassword,
                obscureText: true,
                style: FormInputDecoration.customTextStyle(),
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.none,
                decoration: FormInputDecoration.formInputDesign(
                    name: "Confirm password"),
                onFieldSubmitted: (node) {
                  confirmPassword.unfocus();
                  signup(context);
                },
                validator: (value) => CheckFieldValidation(
                    val: value,
                    password: passwordCtrl.value.text,
                    fieldName: "Confirm password",
                    fieldType: VALIDATION_TYPE.CONFIRM_PASSWORD),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButton(
                text: "Sign up",
                color: Colors.green,
                onPressed: () => signup(context),
              ),
              Container(
                height: 50.0,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  "OR",
                  style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w600),
                ),
              ),
              CustomButton(
                text: "Connect with facebook",
                color: Colors.indigo,
                onPressed: () {},
              ),
              SizedBox(
                height: 5.0,
              ),
              CustomButton(
                text: "Connect with twitter",
                color: Colors.blue,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
