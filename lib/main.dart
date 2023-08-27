
import 'package:atc/Screen/forget_confirm_password_screen.dart';
import 'package:atc/Screen/forget_password_screen.dart';
import 'package:atc/Screen/forget_screen.dart';
import 'package:atc/Screen/item_screen.dart';
import 'package:atc/Screen/home_screen.dart';
import 'package:atc/Screen/launch_screen.dart';
import 'package:atc/Screen/login_screen.dart';
import 'package:atc/Screen/otp_screen.dart';
import 'package:atc/Screen/sign_up_screen.dart';
import 'package:atc/Screen/view/booking_view.dart';
import 'package:atc/Screen/view/category_view.dart';
import 'package:atc/Screen/view/category_view/course_description.dart';
import 'package:atc/Screen/view/home_view.dart';
import 'package:atc/context/auth_context.dart';
import 'package:atc/database/db_controller.dart';
import 'package:atc/shared_pref/shared.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Screen/view/category_view/shared_desk_view.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await SharedPrefController().initPreferences();
  await DbController().initDatabase();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
      routes: {
        '/launch_screen':(context) => const LaunchScreen(),
        '/login_screen':(context) => const LoginScreen(),
        '/sign_up_screen':(context) => const SignUpScreen (),
        '/home_screen':(context) =>const  HomeScreen(),
        '/home_view':(context) =>const  HomeView(),
        '/booking_view':(context) =>const  BookingView(),
        '/forget_screen':(context) =>const  ForgetScreen(),
        '/item_screen':(context) =>const  ItemScreen(),
        '/auth_context':(context) =>const  AuthContext(),
        '/forget_password_screen':(context) =>const  ForgetPasswordScreen(),
        '/forget_confirm_password_screen':(context) =>const  ForgetConfirmPasswordScreen(),
        '/otp_screen':(context) =>const  OtpScreen(),
        '/category_view':(context) =>const  CategoryView(),
        '/course_description':(context) =>const  CourseDescription(),
        '/shared_desk_view':(context) =>const  SharedDeskView(),

      },
    );
  }
}
