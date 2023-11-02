import 'package:api_demo_office/Modules/Authentication/LogIn_Screen/LogIn_Screen.dart';
import 'package:api_demo_office/Modules/Authentication/SignUp_Screen/SignUp_Screen.dart';
import 'package:api_demo_office/Modules/Authentication/Splash_Screen/Splash_Screen.dart';
import 'package:api_demo_office/Routes/Routes.dart';
import 'package:get/get.dart';
import '../Modules/Home_Screen/Home_Screen.dart';

  String initalRoute =Routes.splash;

final appPages = [
  GetPage(
    name: Routes.splash,
    page: () =>  SplashScreen(),
  ),
  GetPage(
    name: Routes.logIn,
    page: () =>  LogInScreen(),
  ),
  GetPage(
    name: Routes.signUp,
    page: () =>  SignUpScreen(),
  ),
  GetPage(
    name: Routes.homeScreen,
    page: () =>  HomeScreen(),
  ),
];
