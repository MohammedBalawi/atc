import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../context/icon_screen.dart';
import '../../context/page_view_indicator.dart';
import '../../context/page_view_radio.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  late int _curr = 0;
  var _currValue = 0.0;
  double _scaleCurr = 0.8;
    bool color_1=true;
  bool _color_2 =true ;
 late bool _color_3 =true;

  late PageController _pageController = PageController(viewportFraction: 0.85);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pageController = PageController(initialPage: 0);
    _pageController.addListener(() {
      setState(() {
        _currValue = _pageController.page!;
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:
          Column(
          children: [
            Container(
              // color: Colors.red,
              height: 400,

                    child: PageView.builder(
                        onPageChanged: (int value) {
                          setState(() {
                            print(value);
                            _curr = value;
                          });
                        },
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return _buildPageItem(index);
                        }),




              ),
            Container(
              padding: const EdgeInsets.only(left: 10,right: 10,bottom: 20),
              // margin: EdgeInsets.only(top: 350),
              // color: Colors.red,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Categories',style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    color: Colors.black,
                  ),),
                  Text('See All',style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 15,
                    color: Colors.black,
                  ),),
                ],
              ),
            ),
              Container(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 40),
                // margin: EdgeInsets.only(top: 350),
                // color: Colors.red,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        onTap: (){
                          // color_1 = true;


                           print(color_1);

                        },
                        child: Container(
                          padding: const EdgeInsets.only(left: 10,right: 20,top: 20,bottom: 20),
                          decoration: BoxDecoration(
                            color: color_1 ? const Color(0xFFFFC727) :Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(children: [
                            Image.asset('img/Icon.jpg'),
                            const SizedBox(width: 20,),
                            Text('Office',style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white
                            ),),
                          ],),
                        ),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        padding: const EdgeInsets.only(left: 10,right: 20,top: 20,bottom: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC727),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(children: [
                          Image.asset('img/Icon1.jpg'),
                          const SizedBox(width: 20,),
                          Text('Meeting Room',style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white
                          ),),
                        ],),
                      ),
                      const SizedBox(width: 10,),
                      Container(
                        padding: const EdgeInsets.only(left: 10,right: 20,top: 20,bottom: 20),
                        decoration: BoxDecoration(
                          color: const Color(0xFFFFC727),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(children: [
                          Image.asset('img/Icon2.jpg'),
                          const SizedBox(width: 20,),
                          Text('Shared Desk',style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: Colors.white
                          ),),
                        ],),
                      )
                    ],
                  ),
                ),
              ),
              Container(
                padding:  const EdgeInsets.only(left: 15,right: 15),
                // margin: EdgeInsets.only(top: 350),
                // color: Colors.red,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Popular Courses',style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.black,
                    ),),
                    Row(
                      children: [
                        Text('View all',
                          style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: const Color(0xFFFFC727),
                      ),
                        ),
                        const SizedBox(width: 8,),
                        IconButton(
                            onPressed: (){},
                            icon: const Icon(
                              Icons.arrow_forward_ios_rounded,
                              size: 15,
                              color: Color(0xFFFFC727),
                            ),),
                      ],),

                  ],
                ),
              ),
            Expanded(
              child:  SingleChildScrollView(
                child: Column(


                    children: [

                    ListView.builder(
                        physics:  const NeverScrollableScrollPhysics(
                        ),
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(children: [
                              Container(
                                width: 120,
                                height: 120,
                                margin: const EdgeInsets.only(top: 10),

                                decoration: BoxDecoration(

                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white38,
                                    image: const DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage('img/Rectangle 545.jpg'),
                                    ),
                                    boxShadow:const [
                                       BoxShadow(
                                        color: Colors.blueGrey,
                                        blurRadius: 5,
                                        offset: Offset(0, 5),
                                      ),

                                    ]
                                ),
                              ),
                              const SizedBox(width: 10,),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Title', style: GoogleFonts.aBeeZee(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 25,
                                    color: Colors.black,
                                  )),
                                  const SizedBox(width: 15,),
                                  Text('Sub Title', style: GoogleFonts.aBeeZee(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 13,
                                      color: Colors.black38),),

                                  const Row(children: [
                                    IconScreen(
                                        iconData: Icons.circle_sharp,
                                        text: 'Normal',
                                        color: Colors.black38,
                                        iconColor: Colors.orangeAccent),
                                    SizedBox(width: 5,),
                                    IconScreen(
                                      iconData: Icons.location_on,
                                      text: '1.7km',
                                      color: Colors.black38,
                                      iconColor: Color(0xFF89dad0),),
                                    SizedBox(width: 5,),
                                    IconScreen(
                                      iconData: Icons.access_time_outlined,
                                      text: '32min',
                                      color: Colors.black38,
                                      iconColor: Colors.orangeAccent,),

                                  ],),

                                ],
                              ),
                            ],),
                          );
                        }),




          ],
        ),
              ),
              ),
            ]
      ),
    );
  }

  Widget _buildPageItem(int index) {
  //   Matrix4 matrix4 = Matrix4.identity();
  //   if(index==_currValue.floor()){
  //     var currScale = 1-(_currValue-index)*(1-_scaleCurr);
  //     matrix4=Matrix4.diagonal3Values(1, currScale, 1);
  //   }else if(index==_currValue.floor()+1){
  //     var currScale = _scaleCurr+(_currValue-index+1 )*(1-_scaleCurr);
  //     matrix4=Matrix4.diagonal3Values(1, currScale, 1);
  //   }//
    //       //       Transform(transform: matrix4,
    //       // child:
    return Stack(
        children: [

          Container(
            height: 230,
            margin: const EdgeInsets.only(left: 5, right: 5, top: 150),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven ? Colors.blue : Colors.pinkAccent,
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('img/Rectangle 545.jpg'),
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(left: 5, right: 5, bottom: 20),
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  gradient: const LinearGradient(
                    begin: AlignmentDirectional.centerEnd,
                    end: AlignmentDirectional.topEnd,
                    colors: [
                      Colors.black54,
                      Colors.white10,
                    ],
                  )),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 100, right: 20, left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'UI / UX Design',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Basic User Interface Design for',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        Text(
                          'Beginner',
                          style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              '45 Hour',
                              style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              '(Courses)',
                              style: GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 120,top: 170),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
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
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),


        ]);


  }

}
