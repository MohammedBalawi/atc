import 'package:atc/context/context-extenssion.dart';
import 'package:atc/database/controller/user_db_controller.dart';
import 'package:atc/modle/process_response.dart';
import 'package:atc/modle/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:atc/context/context-extenssion.dart';
import 'package:atc/database/controller/user_db_controller.dart';
import 'package:atc/modle/process_response.dart';
import 'package:atc/modle/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpScreen> {
  @override
  bool _obscureText = true;
  bool _obscureTextTwo = true;

  late TextEditingController _nameTextController;
  late TextEditingController _emailTextController;
  late TextEditingController _passwordTextController;
  late TextEditingController _phoneTextController;
  late TextEditingController _confirmPasswordTextController;


  late String _language;

  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _phoneError;
  String? _confirmPasswordError;
  bool? _inCheck = true ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    _phoneTextController = TextEditingController();
    _confirmPasswordTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _nameTextController.dispose();
    _emailTextController.dispose();
    _passwordTextController.dispose();
    _phoneTextController.dispose();
    _confirmPasswordTextController.dispose();
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
                            'Sign Up',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Full name
                        TextField(
                          cursorColor: const Color(0xFFFFC727),
                          controller: _nameTextController,
                          keyboardType: TextInputType.name,
                          style: GoogleFonts.nunito(),
                          // obscureText: _obscureText,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            constraints: BoxConstraints(
                                maxHeight: _nameError == null ? 50 : 70),
                            hintText: 'Full Name',
                            hintStyle:
                            GoogleFonts.nunito(color: Colors.black38),
                            hintMaxLines: 1,

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
                        const SizedBox(height: 10),
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
                        // Phone num
                        TextField(
                          cursorColor: const Color(0xFFFFC727),
                          controller: _phoneTextController,
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.nunito(),
                          // obscureText: _obscureText,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            constraints: BoxConstraints(
                                maxHeight: _phoneError == null ? 50 : 70),
                            hintText: 'Phone Num',
                            hintStyle:
                            GoogleFonts.nunito(color: Colors.black38),
                            hintMaxLines: 1,
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
                            errorText: _phoneError,
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
                            GoogleFonts.nunito(color: Colors.black38),
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
                        const SizedBox(height: 10),
                        // Confirm Password
                        TextField(
                          cursorColor: const Color(0xFFFFC727),
                          controller: _confirmPasswordTextController,
                          keyboardType: TextInputType.text,
                          style: GoogleFonts.nunito(),
                          obscureText: _obscureTextTwo,
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.all(15),
                            constraints: BoxConstraints(
                                maxHeight: _confirmPasswordError == null ? 50 : 70),
                            hintText: 'Confirm Password',
                            hintStyle:
                            GoogleFonts.nunito(color: Colors.black38),
                            hintMaxLines: 1,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() => _obscureTextTwo =
                                !_obscureTextTwo,

                                );
                              },
                              icon: Icon(
                                _obscureTextTwo
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: _colorTwo(),
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
                            errorText: _confirmPasswordError,
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
                                  'I agree to our',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2F2E41)  ,

                                  ),
                                ),
                                Text(
                                  ' service',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.combine(
                                        [TextDecoration.underline]),
                                    color: Color(0xFF3F3D56)  ,

                                  ),
                                ),
                                Text(
                                  ' and',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF2F2E41)  ,

                                  ),
                                ),
                                Text(
                                  ' Privacy policy',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    decoration: TextDecoration.combine(
                                        [TextDecoration.underline]),
                                    color: Color(0xFF3F3D56)  ,

                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        SizedBox(height: 10,),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async{
                              await signInFireBase();
                              await _performRegister();
                              },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFFFB300),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Sign Up',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.bold, fontSize: 19),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Do you Have Account?',
                              style: GoogleFonts.poppins(
                                  fontSize: 15, fontWeight: FontWeight.w600),
                            ),
                            TextButton(
                              onPressed: () =>
                                  Navigator.pushNamed(
                                      context, '/login_screen'),
                              child: Text(
                                'Login ',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 15,
                                  color: const Color(0xFF000000),
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

  Future<void> _performRegister() async {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    if (_checkData()) {
      // _register();
    }
  }

  bool _checkData() {
    _controlErrorValue();
    if (_nameTextController.text.isNotEmpty &&
        _emailTextController.text.isNotEmpty &&
        _passwordTextController.text.isNotEmpty&&
        _phoneTextController.text.isNotEmpty&&
        _confirmPasswordTextController.text.isNotEmpty
    ) {
      return true;
    }

    context.showMessage(message: 'Error, enter required data!', error: true);
    return false;
  }

  void _controlErrorValue() {
    setState(() {
      _nameError = _emailTextController.text.isEmpty ? 'Enter Your Name' : null;
      _emailError =
      _emailTextController.text.isEmpty ? 'Enter Email Address' : null;
      _passwordError =
      _passwordTextController.text.isEmpty ? 'Enter Password' : null;
       _phoneError =
      _phoneTextController.text.isEmpty ? 'Enter phone Num' : null;
       _confirmPasswordError =
      _confirmPasswordTextController.text.isEmpty ? 'Enter Confirm Password' : null;
    });
  }

  // void _register() async {
  //   ProcessResponse processResponse  =  ;
  //   context.showMessage(
  //       message: processResponse.message, error: !processResponse.success);
  // }
  // Users get users {
  //   Users users = Users();
  //   users.name = _nameTextController.text;
  //   users.email = _emailTextController.text;
  //   users.password = _passwordTextController.text;
  //   users.confirmPassword = _confirmPasswordTextController.text;
  //   users.phone = _phoneTextController.hashCode;
  //   return users;
  // }
  Color _color() {
    if (_obscureText!) {
      return const Color(0xFFFFC727);
    }
    return Colors.grey;
  }
  Color _colorTwo() {
    if (_obscureTextTwo!) {
      return const Color(0xFFFFC727);
    }
    return Colors.grey;
  }
  Future<void> signInFireBase ()async{
    if(passwordConfirm()){
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailTextController.text.trim(), password: _passwordTextController.text.trim());
      Navigator.pop(context);
    }

  }
  bool passwordConfirm () {
    if(_passwordTextController.text.trim() == _confirmPasswordTextController.text.trim()){
      return true ;
    }
    else{
      return false;
    }
  }
}
 // Container(
 //    color: Colors.amber.shade600,
 //    alignment: AlignmentDirectional.center,
 //    child: Column(
 //    children: [
 //    SizedBox(
 //    height: 110,
 //    ),
 //    Text(
 //    'act',
 //    style: GoogleFonts.actor(
 //    fontSize: 120,
 //    fontWeight: FontWeight.bold,
 //    color: Colors.white,
 //    ),
 //    ),
 //    SizedBox(
 //    height: 10,
 //    ),
 //    Expanded(
 //    child: Card(
 //    margin: const EdgeInsets.symmetric(vertical: 0),
 //    elevation: 20,
 //    color: Colors.white,
 //    clipBehavior: Clip.antiAlias,
 //    shape: RoundedRectangleBorder(
 //    borderRadius: BorderRadiusDirectional.only(
 //    topStart: Radius.circular(40),
 //    ),
 //    ),
 //    child: Padding(
 //    padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
 //    child: Column(
 //    crossAxisAlignment: CrossAxisAlignment.start,
 //    children: [
 //    Center(
 //    child: Text(
 //    'sign up',
 //    style: GoogleFonts.nunito(
 //    fontWeight: FontWeight.bold,
 //    fontSize: 22,
 //    color: Colors.black,
 //    ),
 //    ),
 //    ),
 //    SizedBox(height: 20),
 //    TextField(
 //    controller: _nameTextController,
 //    style: GoogleFonts.nunito(),
 //    //***************************
 //    onTap: () => print('Tapped'),
 //    onChanged: (String value) => print('Value: $value'),
 //    textInputAction: TextInputAction.send,
 //    onSubmitted: (String value) =>
 //    print('Submitted: $value'),
 //    //***************************
 //    keyboardType: TextInputType.name,
 //    //***************************
 //    decoration: InputDecoration(
 //    //***************************
 //    contentPadding: EdgeInsets.zero,
 //    constraints: BoxConstraints(
 //    maxHeight: _emailError == null ? 50 : 70,
 //    ),
 //    hintText: 'name',
 //    hintMaxLines: 1,
 //    hintStyle: GoogleFonts.nunito(),
 //    prefixIcon: const Icon(Icons.person),
 //    enabledBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: const BorderSide(
 //    color: Colors.grey,
 //    width: 1,
 //    ),
 //    ),
 //    focusedBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: const BorderSide(
 //    color: Colors.green,
 //    width: 1,
 //    ),
 //    ),
 //    disabledBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: BorderSide(
 //    color: Colors.grey.shade300,
 //    width: 1,
 //    ),
 //    ),
 //    //***************************
 //    errorText: _nameError,
 //    errorMaxLines: 1,
 //    errorStyle: GoogleFonts.nunito(),
 //    errorBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: BorderSide(
 //    width: 1,
 //    color: Colors.red.shade300,
 //    ),
 //    ),
 //    focusedErrorBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: BorderSide(
 //    width: 1,
 //    color: Colors.red.shade800,
 //    ),
 //    ),
 //    //***************************
 //    ),
 //    ),
 //    SizedBox(height: 10),
 //    TextField(
 //    controller: _emailTextController,
 //    style: GoogleFonts.nunito(),
 //    //***************************
 //    onTap: () => print('Tapped'),
 //    onChanged: (String value) => print('Value: $value'),
 //    textInputAction: TextInputAction.send,
 //    onSubmitted: (String value) =>
 //    print('Submitted: $value'),
 //    //***************************
 //    keyboardType: TextInputType.emailAddress,
 //    //***************************
 //    decoration: InputDecoration(
 //    //***************************
 //    contentPadding: EdgeInsets.zero,
 //    constraints: BoxConstraints(
 //    maxHeight: _emailError == null ? 50 : 70,
 //    ),
 //    hintText: 'email',
 //    hintMaxLines: 1,
 //    hintStyle: GoogleFonts.nunito(),
 //    prefixIcon: const Icon(Icons.email),
 //    enabledBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: const BorderSide(
 //    color: Colors.grey,
 //    width: 1,
 //    ),
 //    ),
 //    focusedBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: const BorderSide(
 //    color: Colors.green,
 //    width: 1,
 //    ),
 //    ),
 //    disabledBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: BorderSide(
 //    color: Colors.grey.shade300,
 //    width: 1,
 //    ),
 //    ),
 //    //***************************
 //    errorText: _emailError,
 //    errorMaxLines: 1,
 //    errorStyle: GoogleFonts.nunito(),
 //    errorBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: BorderSide(
 //    width: 1,
 //    color: Colors.red.shade300,
 //    ),
 //    ),
 //    focusedErrorBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: BorderSide(
 //    width: 1,
 //    color: Colors.red.shade800,
 //    ),
 //    ),
 //    //***************************
 //    ),
 //    ),
 //    SizedBox(height: 10),
 //    TextField(
 //    controller: _passwordTextController,
 //    keyboardType: TextInputType.text,
 //    style: GoogleFonts.nunito(),
 //    obscureText: _obscureText,
 //    decoration: InputDecoration(
 //    /************************/
 //    contentPadding: EdgeInsets.zero,
 //    constraints: BoxConstraints(
 //    maxHeight: _passwordError == null ? 50 : 70),
 //    /************************/
 //    hintText: 'password',
 //    hintStyle: GoogleFonts.nunito(),
 //    hintMaxLines: 1,
 //    prefixIcon: const Icon(Icons.lock),
 //    suffixIcon: IconButton(
 //    onPressed: () {
 //    setState(() => _obscureText = !_obscureText);
 //    },
 //    icon: Icon(
 //    _obscureText
 //    ? Icons.visibility
 //    : Icons.visibility_off,
 //    ),
 //    ),
 //    enabledBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: const BorderSide(
 //    width: 1,
 //    color: Colors.grey,
 //    ),
 //    ),
 //    focusedBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: const BorderSide(
 //    width: 1,
 //    color: Colors.blue,
 //    ),
 //    ),
 //
 //    //***************************
 //    errorText: _passwordError,
 //    errorMaxLines: 1,
 //    errorStyle: GoogleFonts.nunito(),
 //    errorBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: BorderSide(
 //    width: 1,
 //    color: Colors.red.shade300,
 //    ),
 //    ),
 //    focusedErrorBorder: OutlineInputBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    borderSide: BorderSide(
 //    width: 1,
 //    color: Colors.red.shade800,
 //    ),
 //    ),
 //    //***************************
 //    ),
 //    ),
 //    SizedBox(height: 20),
 //    ElevatedButton(
 //    onPressed: () async => await _performRegister(),
 //    style: ElevatedButton.styleFrom(
 //    primary: Colors.blueGrey,
 //    minimumSize: Size(double.infinity, 50),
 //    shape: RoundedRectangleBorder(
 //    borderRadius: BorderRadius.circular(10),
 //    ),
 //    ),
 //    child:
 //    Text('sign up'),
 //
 //
 //
 //    ),
 //    Row(
 //    mainAxisAlignment: MainAxisAlignment.center,
 //    children: [
 //    Text(
 //    'Do you Have Account ? ',
 //    style: GoogleFonts.cairo(),
 //    ),
 //    TextButton(
 //    onPressed: () =>
 //    Navigator.pushNamed(context, '/login_screen'),
 //    child: Text(
 //    'login',
 //    style: GoogleFonts.cairo(
 //    fontWeight: FontWeight.bold,
 //    ),
 //    ),
 //    )
 //    ],
 //    ),
 //    ],
 //    ),
 //    ),
 //    ),
 //    ),
 //    ],
 //    ),
 //    ),


