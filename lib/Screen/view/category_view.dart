import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30,left: 30,right: 20,bottom: 20),
              child: Container(
                color: Color(0xFFFBFBFE),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          height:152 ,
                          width: 172,

                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                            BoxShadow(
                              color: Colors.blueGrey,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                  ],

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('img/comp.png'),
                              const SizedBox(height: 10,),
                               Text('Meeting Room',
                                 style: GoogleFonts.poppins(
                                   fontSize: 15,
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black
                                 ),),
                            ],
                          ),

                        ),
                        const SizedBox(width: 25,),
                        Container(
                          height:152 ,
                          width: 172,

                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5,
                                offset: Offset(0, 5),
                              ),
                            ],

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('img/commpp.png'),
                              const SizedBox(height: 10,),
                               Text('Office',style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),),
                            ],
                          ),

                        ),

                      ],
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, '/shared_desk_view');
                          },
                          child: Container(
                            height:152 ,
                            width: 172,

                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F1F1),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('img/_icon.png'),
                                const SizedBox(height: 10,),
                                 Text('Shared Desk',style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),),
                              ],
                            ),

                          ),
                        ),
                        const SizedBox(width: 25,),
                        Container(
                          height:152 ,
                          width: 172,

                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5,
                                offset: Offset(0, 5),
                              ),
                            ],

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('img/Frame.jpg'),
                              const SizedBox(height: 10,),
                               Text('recording studio',style: GoogleFonts.poppins(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black
                              ),),
                            ],
                          ),

                        ),

                      ],
                    ),
                    const SizedBox(height: 25,),
                    Row(
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.pushReplacementNamed(context, '/course_description');
                          },
                          child: Container(
                            height:152 ,
                            width: 172,

                            decoration: BoxDecoration(
                              color: const Color(0xFFF1F1F1),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.blueGrey,
                                  blurRadius: 5,
                                  offset: Offset(0, 5),
                                ),
                              ],

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset('img/teacher.png'),
                                const SizedBox(height: 10,),
                                 Text('course',style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black
                                ),),
                              ],
                            ),

                          ),
                        ),
                        const SizedBox(width: 25,),
                        Container(
                          height:152 ,
                          width: 172,

                          decoration: BoxDecoration(
                            color: const Color(0xFFF1F1F1),
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.blueGrey,
                                blurRadius: 5,
                                offset: Offset(0, 5),
                              ),
                            ],

                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('img/Frame.png'),
                              const SizedBox(height: 10,),
                               Text('Play Station',style: GoogleFonts.poppins(
                                   fontSize: 15,
                                   fontWeight: FontWeight.w500,
                                   color: Colors.black
                               ),),
                            ],
                          ),

                        ),

                      ],
                    ),


                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
// GridView.builder(
// itemCount: 6,
// padding: const EdgeInsets.only(top: 150,left: 15,right: 15,bottom: 15),
// gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
// crossAxisCount: 2,
// crossAxisSpacing: 10,
// mainAxisSpacing: 10,
//
// ),
// itemBuilder: (context, index) {
// return Card(
//
// clipBehavior: Clip.antiAlias,
// elevation: 5,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(10),
// ),
// child: Column(
// children: [
// Icon(Icons.meeting_room_rounded),
// Image.network('img/Icon3.jpg'),
//
// ],
// ),
// );
// },
// ),
