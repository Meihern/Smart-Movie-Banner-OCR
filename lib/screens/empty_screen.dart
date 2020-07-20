import 'package:flutter/material.dart';

class EmptyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
        backgroundColor: Color(0xFF0E0E12),
        body: Center(
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // SizedBox(height:10,width: 10,),
                  Image.asset(
                    "assets/images/erreur.png",
                    height: size.height * 0.5,
                  ),


                  Text(
                    "Sorry,we can't... ",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Tap to try again ",
                    style: TextStyle(
                        color: Colors.white.withOpacity(.7),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),

                  SizedBox(height: 5),
                  Container(
                    height: 100,
                    width: double.infinity,
                    child: FlatButton(
                      child: Ink(
                        child: RaisedButton.icon(
                          onPressed:() {

                          } ,
                          icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            size: 40,

                          ),
                          label: Text("Back", style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.w500,fontSize: 30),),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),

                          ),

                          color: Colors.grey.withOpacity(.7),
                        ),

                      ),
                    ),
                    alignment: Alignment.center,
                  ),
                ]),
          ),
        ));
  }
}
