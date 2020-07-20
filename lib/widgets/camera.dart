import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,

      child: FlatButton(
        child: Ink(
          child: RaisedButton.icon(
            onPressed: (){
            },
            icon: Icon(

              Icons.camera_alt,
              color: Colors.black.withOpacity(.7),
            ),
            label: Text("Camera ", style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600,fontSize: 20),),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),



            color: Colors.grey.withOpacity(.7),
          ),

        ),
      ),
      alignment: Alignment.center,
    );
  }
}
