// import 'dart:js';


import 'package:atc/Screen/view/booking_view.dart';
import 'package:atc/Screen/view/category_view.dart';
import 'package:atc/Screen/view/home_view.dart';
import 'package:atc/Screen/view/profile_view.dart';
import 'package:atc/context/bin_context.dart';
import 'package:atc/shared_pref/shared.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class ItemScreen extends StatefulWidget {
  const ItemScreen({Key? key}) : super(key: key);

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  int _crrrut = 0;
  final List<BinScreen> _screens = <BinScreen>[
    BinScreen(title: '  Act hub', widget: HomeView(), center: false, bcenter: true),
    BinScreen(title: 'Category', widget: CategoryView(), center: true, bcenter: true),
    BinScreen(title: 'My Appointment', widget: BookingView(), center: true, bcenter: false),
    BinScreen(title: 'Profile', widget: ProfileView(), center: true, bcenter: true),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        centerTitle: _screens[_crrrut].center,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title:_screens[_crrrut].center ?
        Row(children: [

          const Icon(Icons.arrow_back_rounded,size: 22,color: Colors.black,),
          _screens[_crrrut].bcenter!? SizedBox(width: 120,):SizedBox(width: 80,),
          Text(_screens[_crrrut].title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 27,
            color:_screens[_crrrut].center? Colors.black:Color(0xFFFFC727),
          ),),],)
        :  Text(_screens[_crrrut].title,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 27,
            color:_screens[_crrrut].center? Colors.black:Color(0xFFFFC727),
          ),),

        actions: [
          Container(
            margin: EdgeInsets.only(left: 10,right: 20),
            child:_screens[_crrrut].center?
            Row(children: [],)  :
                Row(
            children: [
              Image.asset('img/Search.png'),
              const SizedBox(width: 20,),
              Image.asset('img/Notification.png'),
              const SizedBox(width: 10,),
              IconButton(
                  onPressed: ()async{
            await  _comfirmLogout() ;
              },
                  icon: Icon(Icons.login_outlined,color: Colors.black,))




            ],
          ),
          ),
        ],
      ),
      body: _screens[_crrrut].widget,
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(top: 40 ,bottom: 30,left: 20,right: 20),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight:Radius.circular(20),
            )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: (){
                setState(() {
                  _crrrut = 0;
                });
              },
              child: Container(
                padding: EdgeInsets.only(left: 20,right: 20),
                  child: Image.asset('img/Home 2.jpg')),
            ),
            const SizedBox(width: 20,),
            InkWell(
              onTap: (){
                setState(() {
                  _crrrut = 1;
                });
              },
              child: Container(
                  padding: EdgeInsets.only(left: 20,right: 20),
                  child: Image.asset('img/Menu.jpg')),
            ),
            const SizedBox(width: 20,),
            InkWell(
              onTap: (){
                setState(() {
                  _crrrut = 2;
                });
              },
              child: Container(
                  padding: EdgeInsets.only(left: 20,right: 20),

                  child: Image.asset('img/Group 19.jpg')),
            ),
            const SizedBox(width: 20,),
            InkWell(
              onTap: (){
                setState(() {
                  _crrrut = 3;
                });
              },
              child: Container(
                  padding: EdgeInsets.only(left: 20,right: 20),

                  child: Image.asset('img/Profile.jpg')),
            ),
        ],),


        ),

    );
  }

  void claer_method(BuildContext context) {
    setState(() async {
      bool clear = await SharedPrefController().clear();
      if (clear) {
        // Navigator.popAndPushNamed(context, "/scaned_login_screen");
      }
    });
  }

  Future<void> _comfirmLogout() async {
    bool? reslt = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: Text('are you sure?!'),
            content: Text('logout & sing login',style: GoogleFonts.aBeeZee(
              color: Colors.grey
            ),),
            actions: [
              TextButton(onPressed: () {
                Navigator.pushReplacementNamed(context, '/login_screen');
              }, child: Text('Yes',
                style:GoogleFonts.macondo(
                  color: Colors.red
                ),),),
              TextButton(onPressed: () {
                Navigator.pop(context,false);

              }, child: Text('Cancel'),),
            ],

          );
        });
    if(reslt??false){
      Navigator.popAndPushNamed(context, '/scaned_login_screen');
    }
  }
}
/*
* var view = UIView()
view.frame = CGRect(x: 0, y: 0, width: 24, height: 24)

var parent = self.view!
parent.addSubview(view)
view.translatesAutoresizingMaskIntoConstraints = false
view.widthAnchor.constraint(equalToConstant: 24).isActive = true
view.heightAnchor.constraint(equalToConstant: 24).isActive = true
view.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 127).isActive = true
view.topAnchor.constraint(equalTo: parent.topAnchor, constant: 28).isActive = true
<View
android:id="@+id/rectangle_1"
android:layout_width="0dp"
android:layout_height="0dp"
android:layout_alignParentLeft="true"
android:layout_alignParentRight="true"
android:layout_alignParentTop="true"
android:layout_alignParentBottom="true"
android:background="#000000"
 />

 await FirebaseAuth.instance.signOut();
                await _comfirmLogout();
                claer_method(context);
* */