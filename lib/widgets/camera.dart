import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_movie_banner/bloc/main/main_bloc.dart';

class CameraWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,

      child: FlatButton(
        child: Ink(
          child: RaisedButton.icon(
            onPressed: () => AwesomeDialog(
                context: context,
                customHeader: Text("Movie Banner"),
                tittle: "Pick an Image",
                dialogType: DialogType.INFO,
                desc: "",
                btnOkText: "Gallery",
                btnCancelText: "Camera",
                btnCancelColor: Colors.blue,
                btnOkColor: Colors.blue,
                btnOkOnPress: (){
                 // Navigator.of(context).pop();
                  BlocProvider.of<MainBloc>(context).add(MainAppSendImageEvent(imageSource: "Gallery"));
                },
                btnCancelOnPress: (){
                  //Navigator.of(context).pop();
                  BlocProvider.of<MainBloc>(context).add(MainAppSendImageEvent(imageSource: "Camera"));
                }
            ).show(),
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
