import 'package:flutter/material.dart';

import 'animated_progress.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
        child: SizedBox(
          width: 400,
          child: Card(
            child: SignUpForm(),
          ),
        ),
      ),
    );
  }
}

class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _firstNameTextController = TextEditingController();
  final _lastNameTextController = TextEditingController();
  final _usernameTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  final _confirmPasswordTextController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  double _formProgress = 0;

  String? _validatePassword(
      String text, String? value, String passwordToMatch) {
    if (value!.isEmpty) {
      return text;
    } else if (value != passwordToMatch) {
      return "Passwords don't match";
    }

    return null;
  }

  String? _validateTextField(String text, String? value) {
    if (value!.isEmpty) {
      return text;
    }
    return null;
  }

  void _updateFormProgress() {
    var progress = 0.0;
    var controllers = [
      _firstNameTextController,
      _lastNameTextController,
      _usernameTextController,
      _passwordTextController,
      _confirmPasswordTextController,
    ];

    for (var controller in controllers) {
      if (controller.value.text.isNotEmpty) {
        progress += 1 / controllers.length;
      }
    }

    setState(() {
      _formProgress = progress;
    });
  }

  void _navigateToAppointments() {
    Navigator.of(context).pushNamed('/v2/appointments');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      onChanged: _updateFormProgress,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedProgressIndicator(value: _formProgress),
          Text('Sign up', style: Theme.of(context).textTheme.headline4),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _firstNameTextController,
              decoration: InputDecoration(hintText: 'First name'),
              validator: (value) {
                return _validateTextField('Please enter a first name', value);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _lastNameTextController,
              decoration: InputDecoration(hintText: 'Last name'),
              validator: (value) {
                return _validateTextField('Please enter a last name', value);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _usernameTextController,
              decoration: InputDecoration(hintText: 'Username'),
              validator: (value) {
                return _validateTextField('Please enter a username', value);
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _passwordTextController,
              decoration: InputDecoration(hintText: 'Password'),
              validator: (value) {
                return _validatePassword('Please enter a password', value,
                    _confirmPasswordTextController.value.text);
              },
              obscureText: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: TextFormField(
              controller: _confirmPasswordTextController,
              decoration: InputDecoration(hintText: 'Confirm Password'),
              validator: (value) {
                return _validatePassword('Please confirm password', value,
                    _passwordTextController.value.text);
              },
              obscureText: true,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 5.0),
            child: TextButton(
              style: ButtonStyle(
                foregroundColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  return Colors.white;
                }),
                backgroundColor:
                    MaterialStateColor.resolveWith((Set<MaterialState> states) {
                  return Colors.blue;
                }),
              ),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _navigateToAppointments();
                }
              },
              child: Text('Sign up'),
            ),
          ),
        ],
      ),
    );
  }
}
