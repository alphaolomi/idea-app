import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ideaapp/models/validation.dart';
import 'package:ideaapp/providers/auth_provider.dart';
import 'package:ideaapp/theme/color.dart';
import 'package:ideaapp/views/welcome.dart';
import 'package:ideaapp/widgets/custom_button.dart';
import 'package:ideaapp/widgets/form_input_decoration.dart';
import 'package:ideaapp/widgets/loader.dart';
import 'package:ideaapp/widgets/page_header.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  createState() => LoginState();
}

class LoginState extends State<Login> {
  FocusNode email, password;
  TextEditingController emailCtrl, passwordCtrl;
  bool _autoValid = false, loader = false;
  final _loginForm = GlobalKey<FormState>();

  @override
  void initState() {
    loader = false;
    super.initState();
    emailCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
    email = FocusNode();
    password = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    email.dispose();
    emailCtrl.dispose();
    password.dispose();
    passwordCtrl.dispose();
  }

  login(BuildContext context) {
    password.unfocus();
    email.unfocus();
    setState(() {
      _autoValid = true;
    });
    if (_loginForm.currentState.validate()) {
      setState(() {
        loader = true;
      });
      try {
        print('ok start');
        Provider.of<AuthDataProvider>(context, listen: false).loginUser(
          email: emailCtrl.value.text,
          password: passwordCtrl.value.text,
        );
        print('ok');
        setState(() {
          loader = false;
        });
//        if (_user != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
//                  builder: (BuildContext context) => Welcome(user: _user.user)),
            builder: (BuildContext context) => WelcomeScreen(),
          ),
          ModalRoute.withName('/root'),
        );
//        }
      } on PlatformException catch (e) {
//        Provider.of<AuthDataProvider>(context, listen: false).showToast(context, _authentication.handleError(e));
//        _authentication.showToast(context, _authentication.handleError(e));
        print(e);
        setState(() {
          loader = false;
        });
      }
    }
  }

  showDialogBox(context) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return SimpleDialog(
          titlePadding: EdgeInsets.all(10.5),
          contentPadding: EdgeInsets.all(20.0),
          title: Row(
            children: <Widget>[
              Expanded(
                child: Text("Reset password"),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: InkResponse(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Icon(Icons.close),
                ),
              )
            ],
          ),
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  TextFormField(
                    obscureText: true,
                    textInputAction: TextInputAction.done,
                    style: FormInputDecoration.customTextStyle(),
                    textAlign: TextAlign.center,
                    textCapitalization: TextCapitalization.none,
                    decoration:
                        FormInputDecoration.formInputDesign(name: "Password"),
                  )
                ],
              ),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Builder(
        builder: (context) {
          return Stack(
            children: <Widget>[
              loginForm(context),
              loader ? loaderWidget() : Container()
            ],
          );
        },
      )),
    );
  }

  Widget loginForm(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _loginForm,
        autovalidate: _autoValid,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20.0,
              ),
              PageHeader(title: "Sign In"),
              SizedBox(
                height: 70.0,
              ),
              TextFormField(
                focusNode: email,
                controller: emailCtrl,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                style: FormInputDecoration.customTextStyle(),
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.none,
                decoration: FormInputDecoration.formInputDesign(name: "Email"),
                onFieldSubmitted: (node) {
                  email.unfocus();
                  FocusScope.of(context).requestFocus(password);
                },
                validator: (value) => CheckFieldValidation(
                    val: value,
                    password: '',
                    fieldName: "Email",
                    fieldType: VALIDATION_TYPE.EMAIL),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                controller: passwordCtrl,
                focusNode: password,
                obscureText: true,
                textInputAction: TextInputAction.done,
                style: FormInputDecoration.customTextStyle(),
                textAlign: TextAlign.center,
                textCapitalization: TextCapitalization.none,
                decoration:
                    FormInputDecoration.formInputDesign(name: "Password"),
                onFieldSubmitted: (node) {
                  password.unfocus();
                  login(context);
                },
                validator: (value) => CheckFieldValidation(
                    val: value,
                    password: '',
                    fieldName: "Password",
                    fieldType: VALIDATION_TYPE.TEXT),
              ),
              SizedBox(
                height: 20.0,
              ),
              CustomButton(
                text: "Login",
                color: primaryColor,
                onPressed: () => login(context),
              ),
              SizedBox(
                height: 20.0,
              ),
              Container(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Forgot Password ?",
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    GestureDetector(
                      onTap: () => showDialogBox(context),
                      child: Text(
                        "Click here",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.teal),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
