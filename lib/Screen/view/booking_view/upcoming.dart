import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../context/icon_screen.dart';

class Upcoming extends StatelessWidget {
  const Upcoming({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
          margin: EdgeInsets.only(bottom: 15,left: 15,right: 15),
          height:210 ,
          width: 380,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          // child: Expanded(
          // child:  SingleChildScrollView(
          child: Column(


            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                child: Row(children: [
                  Container(
                    width: 142,
                    height: 113,
                    margin: const EdgeInsets.only(top: 10),

                    decoration: BoxDecoration(

                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white38,
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('img/Rectangle 545.jpg'),
                      ),
                      // boxShadow:const [
                      //   BoxShadow(
                      //     color: Colors.blueGrey,
                      //     blurRadius: 5,
                      //     offset: Offset(0, 5),
                      //   ),

                      // ]
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const SizedBox(height: 15,),
                      Text('Shared workspace', style: GoogleFonts.aBeeZee(
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                        color: Colors.black,
                      )),
                      const SizedBox(height: 15,),
                      Text('MA49 ', style: GoogleFonts.aBeeZee(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Color(0xFF928F8E)),),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(
                                  1,
                                      (index) => const Icon(
                                    Icons.star,
                                    color: Color(0xFFFFB300),
                                    size: 20,
                                  ))),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '(4.8)',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFFD3D2D2),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Text(
                            '\$42.00',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Color(0xFFFFB300),
                            ),
                          ),
                          Text(
                            '/day',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFFD3D2D2),
                            ),
                          ),
                          SizedBox(width: 18,),
                          Container(
                            padding: EdgeInsets.only(left:8 ,right:8,top: 8, ),
                            height:40 ,
                            width: 86,
                            decoration: BoxDecoration(
                              color: Color(0xFFCACACA),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              'activation',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                fontSize: 13,
                                color:Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),

                    ],
                  ),
                ],),
              ),
              const Divider(
                // color: Colors.greenAccent,
                color: Color(0xFFE4E4E4),
                // height: 50,
                endIndent: 30,
                thickness: 1,
                indent: 30,
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 40,bottom: 5),
                    padding: EdgeInsets.only(left:35 ,right:8,top: 10, ),
                    height:40 ,
                    width: 125,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10,),


                    ),
                    child: Text(
                      'Cancel',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color: Color(0xFFFFB300),

                      ),
                    ),
                  ),
                  SizedBox(width: 18,),
                  Container(
                    margin: EdgeInsets.only(left: 40),
                    padding: EdgeInsets.only(left:5,right:8,top: 10, ),
                    height:40 ,
                    width: 125,
                    decoration: BoxDecoration(
                      color: Color(0xFFFFB300),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Reservation view',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 13,
                        color:Colors.white,
                      ),
                    ),
                  ),
                ],
              ),



            ],
          ),
          // ),
          // ),
        ),
            Container(
              margin: EdgeInsets.only(bottom: 15,left: 15,right: 15),
              height:210 ,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              // child: Expanded(
              // child:  SingleChildScrollView(
              child: Column(


                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(children: [
                      Container(
                        width: 142,
                        height: 113,
                        margin: const EdgeInsets.only(top: 10),

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white38,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('img/Rectangle 545.jpg'),
                          ),
                          // boxShadow:const [
                          //   BoxShadow(
                          //     color: Colors.blueGrey,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 5),
                          //   ),

                          // ]
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15,),
                          Text('Shared workspace', style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          )),
                          const SizedBox(height: 15,),
                          Text('MA49 ', style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF928F8E)),),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Wrap(
                                  children: List.generate(
                                      1,
                                          (index) => const Icon(
                                        Icons.star,
                                        color: Color(0xFFFFB300),
                                        size: 20,
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '(4.8)',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFD3D2D2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text(
                                '\$42.00',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Color(0xFFFFB300),
                                ),
                              ),
                              Text(
                                '/day',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFD3D2D2),
                                ),
                              ),
                              SizedBox(width: 18,),
                              Container(
                                padding: EdgeInsets.only(left:8 ,right:8,top: 8, ),
                                height:40 ,
                                width: 86,
                                decoration: BoxDecoration(
                                  color: Color(0xFFCACACA),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'activation',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color:Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],),
                  ),
                  const Divider(
                    // color: Colors.greenAccent,
                    color: Color(0xFFE4E4E4),
                    // height: 50,
                    endIndent: 30,
                    thickness: 1,
                    indent: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 40,bottom: 5),
                        padding: EdgeInsets.only(left:35 ,right:8,top: 10, ),
                        height:40 ,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10,),


                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xFFFFB300),

                          ),
                        ),
                      ),
                      SizedBox(width: 18,),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        padding: EdgeInsets.only(left:5,right:8,top: 10, ),
                        height:40 ,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Reservation view',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color:Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),



                ],
              ),
              // ),
              // ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15,left: 15,right: 15),
              height:210 ,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              // child: Expanded(
              // child:  SingleChildScrollView(
              child: Column(


                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(children: [
                      Container(
                        width: 142,
                        height: 113,
                        margin: const EdgeInsets.only(top: 10),

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white38,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('img/Rectangle 545.jpg'),
                          ),
                          // boxShadow:const [
                          //   BoxShadow(
                          //     color: Colors.blueGrey,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 5),
                          //   ),

                          // ]
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15,),
                          Text('Shared workspace', style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          )),
                          const SizedBox(height: 15,),
                          Text('MA49 ', style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF928F8E)),),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Wrap(
                                  children: List.generate(
                                      1,
                                          (index) => const Icon(
                                        Icons.star,
                                        color: Color(0xFFFFB300),
                                        size: 20,
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '(4.8)',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFD3D2D2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text(
                                '\$42.00',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Color(0xFFFFB300),
                                ),
                              ),
                              Text(
                                '/day',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFD3D2D2),
                                ),
                              ),
                              SizedBox(width: 18,),
                              Container(
                                padding: EdgeInsets.only(left:8 ,right:8,top: 8, ),
                                height:40 ,
                                width: 86,
                                decoration: BoxDecoration(
                                  color: Color(0xFFCACACA),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'activation',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color:Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],),
                  ),
                  const Divider(
                    // color: Colors.greenAccent,
                    color: Color(0xFFE4E4E4),
                    // height: 50,
                    endIndent: 30,
                    thickness: 1,
                    indent: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 40,bottom: 5),
                        padding: EdgeInsets.only(left:35 ,right:8,top: 10, ),
                        height:40 ,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10,),


                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xFFFFB300),

                          ),
                        ),
                      ),
                      SizedBox(width: 18,),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        padding: EdgeInsets.only(left:5,right:8,top: 10, ),
                        height:40 ,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Reservation view',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color:Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),



                ],
              ),
              // ),
              // ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15,left: 15,right: 15),
              height:210 ,
              width: 380,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              // child: Expanded(
              // child:  SingleChildScrollView(
              child: Column(


                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(children: [
                      Container(
                        width: 142,
                        height: 113,
                        margin: const EdgeInsets.only(top: 10),

                        decoration: BoxDecoration(

                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white38,
                          image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('img/Rectangle 545.jpg'),
                          ),
                          // boxShadow:const [
                          //   BoxShadow(
                          //     color: Colors.blueGrey,
                          //     blurRadius: 5,
                          //     offset: Offset(0, 5),
                          //   ),

                          // ]
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 15,),
                          Text('Shared workspace', style: GoogleFonts.aBeeZee(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                          )),
                          const SizedBox(height: 15,),
                          Text('MA49 ', style: GoogleFonts.aBeeZee(
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                              color: Color(0xFF928F8E)),),
                          const SizedBox(height: 10,),
                          Row(
                            children: [
                              Wrap(
                                  children: List.generate(
                                      1,
                                          (index) => const Icon(
                                        Icons.star,
                                        color: Color(0xFFFFB300),
                                        size: 20,
                                      ))),
                              const SizedBox(
                                width: 5,
                              ),
                              Text(
                                '(4.8)',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFD3D2D2),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text(
                                '\$42.00',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18,
                                  color: Color(0xFFFFB300),
                                ),
                              ),
                              Text(
                                '/day',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                  color: Color(0xFFD3D2D2),
                                ),
                              ),
                              SizedBox(width: 18,),
                              Container(
                                padding: EdgeInsets.only(left:8 ,right:8,top: 8, ),
                                height:40 ,
                                width: 86,
                                decoration: BoxDecoration(
                                  color: Color(0xFFCACACA),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  'activation',
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 13,
                                    color:Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),

                        ],
                      ),
                    ],),
                  ),
                  const Divider(
                    // color: Colors.greenAccent,
                    color: Color(0xFFE4E4E4),
                    // height: 50,
                    endIndent: 30,
                    thickness: 1,
                    indent: 30,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 40,bottom: 5),
                        padding: EdgeInsets.only(left:35 ,right:8,top: 10, ),
                        height:40 ,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10,),


                        ),
                        child: Text(
                          'Cancel',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color: Color(0xFFFFB300),

                          ),
                        ),
                      ),
                      SizedBox(width: 18,),
                      Container(
                        margin: EdgeInsets.only(left: 40),
                        padding: EdgeInsets.only(left:5,right:8,top: 10, ),
                        height:40 ,
                        width: 125,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFB300),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          'Reservation view',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                            fontSize: 13,
                            color:Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),



                ],
              ),
              // ),
              // ),
            ),

          ],),
      ),
    );

      
  }
}
