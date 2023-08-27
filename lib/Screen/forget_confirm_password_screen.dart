import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';


class ForgetConfirmPasswordScreen extends StatefulWidget {
  const ForgetConfirmPasswordScreen({super.key});

  @override
  State<ForgetConfirmPasswordScreen> createState() => _ForgetConfirmPasswordScreenState();
}

class _ForgetConfirmPasswordScreenState extends State<ForgetConfirmPasswordScreen> {
  @override
  late TextEditingController _emailTextController;
  String? _emailError;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailTextController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailTextController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.only(top: 30),
                height: 400,
                // margin: EdgeInsets.only(left: 5, right: 5, top: 5),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30),
                  ),
                  color: Color(0xFFFFB300),
                ),

                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20,),
                    IconButton(onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login_screen');
                    },
                        icon: Icon(
                          Icons.arrow_back_rounded, color: Colors.white,)),
                    const SizedBox(height: 20,),

                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset('img/Group 1868.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset('img/Group 1868.png'),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset('img/Group 1868.png'),
                      ],
                    ),
                  ],
                ),
              ),
              Align(
                child: Container(
                  alignment: AlignmentDirectional.bottomCenter,
                  height: 377,
                  width: 346,
                  // margin: EdgeInsets.only(top: 10, left: 30, right: 30, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),

                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 10, left: 15, right: 15),
                    child: Column(
                      children: [
                        Text('Change Password',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xFFFFB300),
                            )),
                        Container(
                          padding: EdgeInsets.only(
                              top: 10, left: 20, right: 20),
                          child: Column(
                            children: [
                              Text(
                                'To reset your password, enter',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                              Text(
                                'your last password ',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 10, right: 20, left: 20, bottom: 30),
                          child: Column(
                            children: [
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
                                  hintText: 'Enter new Password',
                                  hintMaxLines: 1,
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFD1D1D1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
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
                              const SizedBox(height: 15,),
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
                                  hintText: 'Confirm Password',
                                  hintMaxLines: 1,
                                  hintStyle: GoogleFonts.poppins(
                                    color: Color(0xFFD1D1D1),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                  ),
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
                            ],
                          ),
                        ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () async {
                              Navigator.pushReplacementNamed(context, '/login_screen');

                            },
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFFFFB300),
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Text(
                              'Change',
                              style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w500, fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }


}