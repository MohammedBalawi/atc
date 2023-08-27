import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../context/icon_screen.dart';
import '../../../context/read_more.dart';

class CourseDescription extends StatefulWidget {
  const CourseDescription({super.key});

  @override
  State<CourseDescription> createState() => _CourseDescriptionState();
}

class _CourseDescriptionState extends State<CourseDescription> {
  @override
  late int _curr = 0;

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            child: Container(
              width: double.infinity,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('img/Rectangle 545.jpg'),
                ),
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            child: Padding(
              padding: const EdgeInsets.only(top: 40, right: 350),
              child: Container(
                height: 40,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.pink.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/item_screen');
                    },
                    icon: const Icon(
                      Icons.arrow_back_rounded,
                      color: Colors.white,
                      size: 25,
                    )),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            top: 330,
            child: SingleChildScrollView(
              child: Container(
                // color: Colors.red,
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 700),

                decoration: BoxDecoration(
                  color: Color(0xFFFBFBFE),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('UI / UX Design',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                              color: Colors.black,
                            )),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(
                                    5,
                                    (index) => Icon(
                                          Icons.star,
                                          color: Color(0xFFFFB300),
                                          size: 20,
                                        ))),
                            SizedBox(
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
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Image.asset('img/Frame-2_2.jpg'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '45 hour training',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Color(0xFF7D7D7D)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset('img/Vector.jpg'),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          'Salah Ahmed',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Color(0xFF7D7D7D)),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text('Description',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500,
                          fontSize: 18,
                          color: Colors.black,
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: const Column(
                        children: [
                          SingleChildScrollView(
                            child: ReadMore(
                              text:
                                  'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit ',
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 120,

        padding:
            const EdgeInsets.only(top: 30, bottom: 30, left: 20, right: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),

          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey,
              blurRadius: 5,
              // offset: Offset(0, 5),
            )
          ]
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 28,
              width:100,

              padding: EdgeInsets.only(left: 10),
              child: Text('\$100.00',style: GoogleFonts.poppins(
                fontSize:22 ,
                fontWeight: FontWeight.w600,
                color: Colors.black
              ),),
            ),
            const SizedBox(
              width: 40,
            ),
            Container(
              padding: EdgeInsets.only(right: 15),
              height:50 ,
              width:170 ,
              decoration: BoxDecoration(


                color: Color(0xFFFFB300),
                borderRadius: BorderRadius.circular(10),
                boxShadow:  const [
                     BoxShadow(
                    color: Colors.blueGrey,
                    blurRadius: 5,
                    offset: Offset(0, 5),
                     ) ,]
              ),
              child:Center(
                child: Text('Book now',
                  style: GoogleFonts.poppins(
                    fontSize:17 ,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
