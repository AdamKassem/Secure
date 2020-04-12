import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:secure/screens/home/home.dart';


class Insta extends StatefulWidget {
  final Function toggleView;
  Insta({this.toggleView});

  @override
  _Insta createState() => new _Insta();
  
}
class _Insta extends State<Insta> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Background.jpg'),
              fit: BoxFit.cover
          )
        ),
        constraints: BoxConstraints.expand(),
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 10.0),


        //white card
        child: Column(
          children: <Widget>[
            SizedBox(height:5,),
//            Text("PROFILE", style: TextStyle(fontSize: 30),),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(55)),
                ),

                // LOGO
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Center(
                        child: Image(
                          image: AssetImage(
                            'images/secure4.1.jpg',
                          ),
                          height: 100.0,
                          width: 200.0,
                        ),
                      ),
                      Center(
                        child: Text(
                          "PROFILE", style: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 40))),

                      ),
                      SizedBox(height: 20,),

                      // INSIDE CARD SLOTS
                      Container(
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(
                            color: Color.fromRGBO(27, 95, 225, .3),
                            blurRadius: 20,
                            offset: Offset(0,10),
                          )]
                        ),

                        child: Container(
                          width: 500,
                          child: Text("First Name", style: TextStyle(fontSize: 15),
                            textAlign: TextAlign.center,
                                )
                              )
                            ),

                          SizedBox(height: 15),
                          Container(
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                color: Color.fromRGBO(27, 95, 225, .3),
                                blurRadius: 20,
                                offset: Offset(0,10),
                              )]
                          ),

                          child: Container(
                              width: 500,
                              child: Text("Last Name", style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                              )
                          )
                      ),

                      SizedBox(height: 15,),
                      Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                color: Color.fromRGBO(27, 95, 225, .3),
                                blurRadius: 20,
                                offset: Offset(0,10),
                              )]
                          ),
                          child: Container(
                              width: 500,
                              child: Text("Email Address", style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                              )
                             )
                            ),

                      SizedBox(height: 15,),
                      Container(
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(
                                color: Color.fromRGBO(27, 95, 225, .3),
                                blurRadius: 20,
                                offset: Offset(0,10),
                              )]
                          ),
                          child: Container(
                              width: 500,
                              child: Text("Number of Favorited Passwords", style: TextStyle(fontSize: 15),
                                textAlign: TextAlign.center,
                              )

                          )
                      )
                    ],
                  ),
                ),
              ))],
            ),
          ),
        );

  }
}