import 'package:flutter/material.dart';

import 'appointments/appointment_list.dart';
import 'login/login.dart';
import 'sign_up/sign_up.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/login",
      routes: {
        '/sign-up': (context) => SignUpScreen(),
        '/login': (context) => LoginScreen(),
        '/appointments': (context) => AppointmentScreen(),
      },
    );
  }
}
