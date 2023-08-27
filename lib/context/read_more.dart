import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ReadMore extends StatefulWidget {
  final String text ;
  const ReadMore({super.key, required this.text});

  @override
  State<ReadMore> createState() => _ReadMoreState();
}

class _ReadMoreState extends State<ReadMore> {

  late String firstHalf ;
  late String secondHalf;
  bool hidden =true ;
  double textHidden = 200;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>textHidden){
       firstHalf = widget.text.substring( 0,textHidden.toInt());
       secondHalf = widget.text.substring(textHidden.toInt()+1,widget.text.length);
    } else{
      firstHalf = widget.text;
      secondHalf = '';
    }
  }
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?
      Text(firstHalf ,style:GoogleFonts.poppins(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Color(0xFF6A7F84)
      ),) :
          Column(
            children: [
              Text(hidden? firstHalf+'...':firstHalf+secondHalf),
              InkWell(
                onTap: (){
                  setState(() {
                    hidden=!hidden;
                  });
                },
                child:Row(children: [
                  hidden?
                  Text('Show more',style:GoogleFonts.aBeeZee(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xFF89dad0),)):Text('Show little',style:GoogleFonts.poppins(
                    fontWeight: FontWeight.w400,
                    fontSize: 20,
                    color: Color(0xFF89dad0),)),
                  Icon(hidden? Icons.arrow_drop_down_outlined:Icons.arrow_drop_up_outlined),
                ],) ,
              ),


            ],

          ),

    );
  }
}


