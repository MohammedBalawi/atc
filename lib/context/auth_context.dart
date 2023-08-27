import 'package:atc/Screen/home_screen.dart';
import 'package:atc/Screen/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class AuthContext extends StatelessWidget {
  const AuthContext({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context ,snapshot){
          if(snapshot.hasData){
            return  HomeScreen();
          }
          return LoginScreen();
        }
    );
  }
}
