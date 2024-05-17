import 'package:flutter/material.dart';
import 'package:flutter101/src/pages/home/home_page.dart';
import 'package:flutter101/src/pages/login/login_page.dart';
import 'package:flutter101/src/pages/register/register_page.dart';

class AppRoute {
  static const home = 'home';
  static const login = 'login';
  static const register = 'register';

  static get all => <String, WidgetBuilder>{
        login: (context) => const LoginPage(),
        home: (context) => const HomePage(),
        register: (context) => const RegisterPage()
      };
}
