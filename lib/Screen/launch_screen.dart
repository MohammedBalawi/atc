import 'package:atc/shared_pref/shared.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LaunchScreen extends StatefulWidget {
  const LaunchScreen({super.key});

  @override
  State<LaunchScreen> createState() => _LaunchScreenState();
}

class _LaunchScreenState extends State<LaunchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      bool loggedIn = SharedPrefController().getValueFor<bool>(Key: PreKey.loggedIn.name)??false;
      // bool loggedIn = FirebaseAuth.instance.authStateChanges();
      String rout = loggedIn ? '/home_screen':'/login_screen';
      Navigator.pushReplacementNamed(context,'/auth_context');
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: AlignmentDirectional.center,

          color:Colors.amber.shade600,

        child: Image.asset('img/Group 318.png'),
      ),
    );
  }
}
