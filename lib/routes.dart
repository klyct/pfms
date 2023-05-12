// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:pfms/entry_point.dart';
import 'package:pfms/screens/home/home_screen.dart';
import 'package:pfms/screens/login/LoginPageMobile.dart';
import 'package:pfms/screens/login/forgot_password_page.dart';
import 'package:pfms/screens/login/forgot_password_verification_page.dart';
import 'package:pfms/screens/login/registration_page.dart';
import 'package:pfms/screens/onboding/onboding_screen.dart';
import 'package:pfms/screens/splash_screen.dart';

const String Route_login = '/login';
const String Route_profile = '/profile';
const String Route_registration = '/registration';
const String Route_forgotPass = '/forgotPass';
const String Route_verificationPass = '/verificationPass';
const String Route_SplasScreen = '/SplashScreen';
const String Route_OnBoardScreen = '/onBoard';
const String Route_Settings = '/Settings';
const String Route_Add = '/Add';
const String Route_Calendar = '/Calendar';
const String Route_Api = '/Api';
const String Route_Modify = '/modify';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/login': (BuildContext context) => LoginPage(),
    '/profile': (BuildContext context) => EntryPoint(),
    '/registration': (BuildContext context) => RegistrationPage(),
    '/forgotPass': (BuildContext context) => ForgotPasswordPage(),
    '/SplashScreen': (BuildContext context) => SplashScreen(),
    '/verificationPass': (BuildContext context) =>
        ForgotPasswordVerificationPage(),
    '/onBorard': (BuildContext context) => OnboardingScreen(),
  };
}
