import 'package:atc/context/context-extenssion.dart';
import 'package:atc/database/controller/user_db_controller.dart';
import 'package:atc/modle/process_response.dart';
import 'package:atc/modle/user.dart';
import 'package:atc/shared_pref/shared.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  bool _obscureText = true;

  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;



  String? _emailError;
  String? _passwordError;
  bool? _inCheck = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amber.shade600,
        alignment: AlignmentDirectional.center,
        child: Column(
          children: [
            const SizedBox(
              height: 70,
            ),
            Image.asset('img/Group 318.png'),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView(children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 0),
                  height: 900,
                  decoration: const BoxDecoration(
                    color: Color(0xFFFBFBFE),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding:
                        const EdgeInsets.only(top: 10, left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Center(
                          child: Text(
                            'login',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Email
                        TextField(
                          cursorColor: const Color(0xFFFFC727),
                          controller: _emailTextController,
                          style: GoogleFonts.nunito(),
                          onTap: () => print('Tapped'),
                          onChanged: (String value) => print('Value: $value'),
                          textInputAction: TextInputAction.send,
                          onSubmitted: (String value) =>
                              print('Submitted: $value'),
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            constraints: BoxConstraints(
                              maxHeight: _emailError == null ? 50 : 70,
                            ),
                            hintText: 'Email',
                            hintMaxLines: 1,
                            hintStyle:
                                GoogleFonts.nunito(color: Colors.black38),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.white,
                                width: 1,
                              ),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1,
                              ),
                            ),
                            errorText: _emailError,
                            errorMaxLines: 1,
                            errorStyle: GoogleFonts.nunito(),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red.shade300,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red.shade800,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Password
                        TextField(
                          cursorColor: const Color(0xFFFFC727),
                          controller: _passwordTextController,
                          keyboardType: TextInputType.text,
                          style: GoogleFonts.nunito(),
                          obscureText: _obscureText,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            constraints: BoxConstraints(
                                maxHeight: _passwordError == null ? 50 : 70),
                            hintText: 'Password',
                            hintStyle:
                                GoogleFonts.nunito(color: Colors.black38,
                                fontWeight: FontWeight.w400),
                            hintMaxLines: 1,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() => _obscureText = !_obscureText);
                              },
                              icon: Icon(
                                _obscureText
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: _color(),
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0,
                                color: Colors.white,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                width: 0,
                                color: Colors.white,
                              ),
                            ),
                            errorText: _passwordError,
                            errorMaxLines: 1,
                            errorStyle: GoogleFonts.nunito(),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red.shade300,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 1,
                                color: Colors.red.shade800,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Checkbox(
                                    value: _inCheck,
                                    activeColor: const Color(0xFFFFC727),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(3),),
                                    onChanged: (newBool) {
                                      setState(() {
                                        _inCheck = newBool;
                                      });
                                    }),
                                Text(
                                  'Remember me',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, '/forget_screen'),
                              child: Text(
                                'Forget Password ?',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: const Color(0xFF1CA0BF),
                                ),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              await _performLogin();
                              await loginFireBase();
                              } ,
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFFFB300),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'login',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                color: Color(0xFF2E2E2E),
                              ),
                            ),
                            TextButton(
                              onPressed: () => Navigator.pushNamed(
                                  context, '/sign_up_screen'),
                              child: Text(
                                'Sign up',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 13,
                                  color: const Color(0xFF2E2E2E),
                                  decoration: TextDecoration.combine(
                                      [TextDecoration.underline]),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _performLogin() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (_checkData()) {

    }
  }

  bool _checkData() {
    _controlErrorValue();
    if (_emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty) {
      return true;
    }
    context.showMessage(message: 'Error, enter required data!', error: true);
    return false;
  }

  //
  void _controlErrorValue() {
    setState(() {
      _emailError =
          _emailTextController.text.isEmpty ? 'Enter email address' : null;
      _passwordError =
          _passwordTextController.text.isEmpty ? 'Enter password' : null;
    });
  }

  //
  // void _login() async {
  //   ProcessResponse processResponse = await UserDbController().login(
  //       email: _emailTextController.text,
  //       password: _passwordTextController.text);
  //   if (processResponse.success) {
  //     Navigator.pushReplacementNamed(context as BuildContext, '/home_screen');
  //   }
  //   context.showMessage(
  //       message: processResponse.message, error: !processResponse.success);
  //   bool loggedIn =
  //       SharedPrefController().getValueFor<bool>(Key: PreKey.loggedIn.name) ??
  //           false;
  // }

  Color _color() {
    if (_obscureText!) {
      return const Color(0xFFFFC727);
    }
    return Colors.grey;
  }

  Future<void> loginFireBase ()async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailTextController.text.trim(), password: _passwordTextController.text.trim());
    Navigator.pushReplacementNamed(context, '/home_screen');
  }
}
