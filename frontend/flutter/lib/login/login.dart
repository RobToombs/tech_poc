import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

const _url = 'http://localhost:9000/admin';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: LoginForm(),
          ),
        ),
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String? _validateTextField(String text, String? value) {
    if (value!.isEmpty) {
      return text;
    }
    return null;
  }

  void _navigateToAppointments() {
    Navigator.of(context).pushNamed('/appointments');
  }

  void _navigateToSignup() {
    Navigator.of(context).pushNamed('/sign-up');
  }

  void _navigateToAdmin() async => await canLaunch(_url)
      ? await launch(_url, webOnlyWindowName: "_self")
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Login', style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(hintText: 'Username'),
              validator: (value) {
                return _validateTextField('Please enter your username', value);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: InputDecoration(hintText: 'Password'),
              obscureText: true,
              validator: (value) {
                return _validateTextField('Please enter your password', value);
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  left: 10.0, top: 10.0, right: 10.0, bottom: 10.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        flex: 2,
                        child: RichText(
                          text: TextSpan(
                            style: TextStyle(color: Colors.grey),
                            children: <TextSpan>[
                              TextSpan(text: 'No account? '),
                              TextSpan(
                                  text: 'Signup',
                                  style: TextStyle(color: Colors.blue),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      _navigateToSignup();
                                    }),
                            ],
                          ),
                        )),
                    Expanded(
                        flex: 1,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateColor.resolveWith(
                                          (Set<MaterialState> states) {
                                    return Colors.white;
                                  }),
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (Set<MaterialState> states) {
                                    return Colors.blue;
                                  }),
                                ),
                                onPressed: () {
                                  _navigateToAdmin();
                                },
                                child: Text('Admin'),
                              ),
                              TextButton(
                                style: ButtonStyle(
                                  foregroundColor:
                                      MaterialStateColor.resolveWith(
                                          (Set<MaterialState> states) {
                                    return Colors.white;
                                  }),
                                  backgroundColor:
                                      MaterialStateColor.resolveWith(
                                          (Set<MaterialState> states) {
                                    return Colors.blue;
                                  }),
                                ),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    _navigateToAppointments();
                                  }
                                },
                                child: Text('Login'),
                              ),
                            ]))
                  ])),
        ],
      ),
    );
  }
}
