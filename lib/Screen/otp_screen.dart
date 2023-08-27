import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacementNamed(context, '/forget_password_screen');
    });
  }
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 50,right: 20,left: 20),
            // color: Colors.white,
            child: Row(
              children: [
                IconButton(
                    onPressed: (){},
                    icon: Icon(Icons.arrow_back_rounded),),
                const SizedBox(width: 70,),
                Text('Verfication Code',style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black,
                ),)
              ],

            ),
          ),
          Container(
            padding: EdgeInsets.only(
                top: 20, left: 20, right: 20,bottom: 40),
            child: Column(
              children: [
                Text(
                  'Enter the code',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Color(0xFF393939)
                  ),
                ),
                SizedBox(height: 10,),
                Text(
                  'Please , Enter the code we sent',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                      color: Color(0xFFB6B6B6)

                  ),
                ),
                Text(
                  'to your email to verfiy your',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                      color: Color(0xFFB6B6B6)

                  ),
                ),
                Text(
                  'account',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                      color: Color(0xFFB6B6B6)

                  ),
                ),

              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height:70 ,
                  width:60 ,

                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5,
                        offset: Offset(0, 5),
                      ),
                    ],
                      borderRadius: BorderRadius.circular(10),
                    color: Colors.white

                  ),
                  child: TextField(
                    cursorColor: const Color(0xFFFFC727),
                    style: GoogleFonts.nunito(),
                    onTap: () => print('Tapped'),
                    onChanged: (String value) => print('Value: $value'),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (String value) =>
                        print('Submitted: $value'),
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(15),

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
                      enabled: true
                    ),

                  ),
                ),
                SizedBox(width: 12,),
                Container(
                  height:70 ,
                  width:60 ,

                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white

                  ),
                  child: TextField(
                    cursorColor: const Color(0xFFFFC727),
                    style: GoogleFonts.nunito(),
                    onTap: () => print('Tapped'),
                    onChanged: (String value) => print('Value: $value'),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (String value) =>
                        print('Submitted: $value'),
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),

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
                        enabled: true
                    ),

                  ),
                ),
                SizedBox(width: 12,),

                Container(
                  height:70 ,
                  width:60 ,

                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white

                  ),
                  child: TextField(
                    cursorColor: const Color(0xFFFFC727),
                    style: GoogleFonts.nunito(),
                    onTap: () => print('Tapped'),
                    onChanged: (String value) => print('Value: $value'),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (String value) =>
                        print('Submitted: $value'),
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),

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
                        enabled: true
                    ),

                  ),
                ),
                SizedBox(width: 12,),

                Container(
                  height:70 ,
                  width:60 ,

                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white

                  ),
                  child: TextField(
                    cursorColor: const Color(0xFFFFC727),
                    style: GoogleFonts.nunito(),
                    onTap: () => print('Tapped'),
                    onChanged: (String value) => print('Value: $value'),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (String value) =>
                        print('Submitted: $value'),
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),

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
                        enabled: true
                    ),

                  ),
                ),
                SizedBox(width: 12,),

                Container(
                  height:70 ,
                  width:60 ,

                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xFFe8e8e8),
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white

                  ),
                  child: TextField(
                    cursorColor: const Color(0xFFFFC727),
                    style: GoogleFonts.nunito(),
                    onTap: () => print('Tapped'),
                    onChanged: (String value) => print('Value: $value'),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (String value) =>
                        print('Submitted: $value'),
                    keyboardType: TextInputType.number,

                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15),

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
                        enabled: true
                    ),

                  ),
                ),

              ],
            ),
          ),
        ],
      ) ,
    );
  }
}
