import 'package:flutter/material.dart';

import 'appointments/appointment_list.dart';
import 'login/login.dart';
import 'sign_up/sign_up.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/v2/login",
      routes: {
        '/v2/sign-up': (context) => SignUpScreen(),
        '/v2/login': (context) => LoginScreen(),
        '/v2/appointments': (context) => AppointmentScreen(),
      },
    );
  }
}
