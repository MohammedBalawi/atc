import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../context/page_view_indicator.dart';
import 'booking_view/cancelled.dart';
import 'booking_view/completed.dart';
import 'booking_view/upcoming.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  @override
   bool _curr_1 = true;
   bool _curr_2 = false;
   bool _curr_3 = false;
  var _currValue = 0.0;
  double _scaleCurr = 0.8;
  Color color_1 = const Color(0xFFFFB300);

  Color color_2 = Colors.black;

  Color color_3 = Colors.black;

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFBFE),
      body: Column(
          children: [
        Container(
          margin: const EdgeInsets.only(top: 130),
          height: 70,
          color: Colors.white,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    setState(() {
                      _curr_1 = true;
                      _curr_2 = false;
                      _curr_3 = false;

                      color_1 = const Color(0xFFFFB300);
                      color_2 = Colors.black;
                      color_3 = Colors.black;
                    });
                  },
                  child: Text(
                    'Upcoming',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: color_1),
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _curr_1 = false;
                      _curr_2 = true;
                      _curr_3 = false;
                      color_1 = Colors.black;
                      color_2 = const Color(0xFFFFB300);
                      color_3 = Colors.black;
                    });
                  },
                  child: Text(
                    'Completed',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: color_2),
                  )),
              TextButton(
                  onPressed: () {
                    setState(() {
                      _curr_1 = false;
                      _curr_2 = false;
                      _curr_3 = true;
                      color_1 = Colors.black;
                      color_2 = Colors.black;
                      color_3 = const Color(0xFFFFB300);
                    });
                  },
                  child: Text(
                    'Cancelled',
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        color: color_3),
                  )),
            ],
          ),),
        const SizedBox(height: 10,),
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PageViewIndicator(
                marginEnd: 0,
                selected: _curr_1 ,
              ),
              PageViewIndicator(
                marginEnd: 0,
                selected: _curr_2 ,
              ),
              PageViewIndicator(
                marginEnd: 10,
                selected: _curr_3,
              ),
            ],
          ),
        ),
            const SizedBox(height: 20,),
            _curr_1 ? const Upcoming(): Container(),
            _curr_2 ? const Completed() : Container(),
            _curr_3 ? const Cancelled() : Container(),

      ]),
    );
  }
}
