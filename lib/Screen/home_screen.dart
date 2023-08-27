import 'package:atc/context/page_view_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../context/page_view_radio.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  int _curr = 0;
  late PageController _pageController;
  final user = FirebaseAuth.instance.currentUser!;

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFFFFFFF),
      body: Column(
        children: [
          Expanded(
            child: PageView(
                controller: _pageController,
                onPageChanged: (int value) {
                  setState(() {
                    print(value);
                    _curr = value;
                  });
                },
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: () {
                                _pageController.animateToPage(_curr = 2,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              child: Text(
                                'Sikp',
                                style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 160,
                        ),
                        Image.asset('img/illustration.png'),
                        const SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Find your cozy working space',
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet,'
                                ' consetetur sadipscing elitr, sed diam nonumy.',
                                style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black45,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          child:Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding:
                              const EdgeInsets.only(top: 73, right: 40),
                              child: IconButton(
                                  onPressed: () {
                                    _pageController.nextPage(
                                        duration: const Duration(seconds: 1),
                                        curve: Curves.easeInOut);
                                  },
                                  icon: Icon(
                                    Icons.arrow_circle_right_rounded,
                                    size: 60,
                                    color: Colors.amber.shade600,
                                  )),
                            ),
                          ],
                        ), ),

                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(
                              onPressed: () {
                                _pageController.animateToPage(_curr = 2,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.easeIn);
                              },
                              icon: Text(
                                'Sikp',
                                style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Image.asset('img/Classroom-bro 1.png'),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Find your cozy Courses',
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, '
                                'consetetur sadipscing elitr, sed diam nonumy.',
                                style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black45,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 80, right: 40),
                                    child: IconButton(
                                        onPressed: () {
                                          _pageController.previousPage(
                                              duration: const Duration(seconds: 1),
                                              curve: Curves.easeInBack);
                                        },
                                        icon: Icon(
                                          Icons.arrow_circle_left_rounded,
                                          size: 60,
                                          color: Colors.amber.shade600,
                                        )),
                                  ),
                                  const SizedBox(
                                    width: 150,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 80, left: 40),
                                    child: IconButton(
                                        onPressed: () {
                                          _pageController.nextPage(
                                              duration: const Duration(seconds: 1),
                                              curve: Curves.easeInOut);
                                        },
                                        icon: Icon(
                                          Icons.arrow_circle_right_rounded,
                                          size: 60,
                                          color: Colors.amber.shade600,
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.centerEnd,
                          child: Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pushReplacementNamed(
                                      context, '/item_screen');
                                },
                                child: Text(
                                  'Start',
                                  style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 100,
                        ),
                        Image.asset('img/Recording-bro (1) 1.png'),
                        const SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Text(
                                'Find your recording studio',
                                style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25,
                                    color: Colors.black),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet,'
                                ' consetetur sadipscing elitr, sed diam nonumy.',
                                style: GoogleFonts.aBeeZee(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Colors.black45,
                                ),
                              ),
                              const SizedBox(height: 60,),
                              Column(
                                children: [

                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.pushReplacementNamed(
                                            context, '/item_screen');
                                      },
                                      child: const Text('Let\'s get started'),
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.amber.shade600,
                                        minimumSize: const Size(double.infinity, 50),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // Row(
                              //   mainAxisAlignment: MainAxisAlignment.start,
                              //   children: [
                              //     Padding(
                              //       padding: const EdgeInsets.only(
                              //           top: 80, right: 40),
                              //       child: IconButton(
                              //           onPressed: () {
                              //             _pageController.previousPage(
                              //                 duration: Duration(seconds: 1),
                              //                 curve: Curves.easeIn);
                              //           },
                              //           icon: Icon(
                              //             Icons.arrow_circle_left_rounded,
                              //             size: 60,
                              //             color: Colors.amber.shade600,
                              //           )),
                              //     ),
                              //
                              //   ],
                              // ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PageViewRadio(
                  marginEnd: 10,
                  selected: _curr == 0,
                ),
                PageViewRadio(
                  marginEnd: 10,
                  selected: _curr == 1,
                ),
                PageViewRadio(
                  marginEnd: 10,
                  selected: _curr == 2,
                ), // PageViewIndicator PageViewIndicator (),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
