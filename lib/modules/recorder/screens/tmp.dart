import 'dart:io';
import 'dart:math';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/modules/recorder/bloc/cubit.dart';
import 'package:meal_monkey/modules/recorder/bloc/states.dart';
import 'package:meal_monkey/modules/login/bloc/cubit.dart';
import 'package:meal_monkey/shared/routes.dart';

//import 'package:flutter_sound/flutter_sound.dart';

//import 'package:flutter_sound_lite/flutter_sound.dart';
//import 'package:permission_handler/permission_handler.dart';

import 'package:flutter_slidable/flutter_slidable.dart';



class AddScreen extends StatelessWidget {



  @override
  Widget build(BuildContext context) {

    return BlocBuilder<RecordingCubit,RecordingStates>(
      builder: (context,events){
        final read = BlocProvider.of<RecordingCubit>(context);
        return Scaffold(
        appBar: AppBar(
          title: InkWell(
            onTap: (){
              context.read<SignInCubit>().signOut();
              Navigator.pushNamedAndRemoveUntil(context,Routes.splashScreen,(route) => false);
            },
            child: Text('LOG OUT',style: TextStyle(color:Colors.black,fontSize:30,fontWeight: FontWeight.bold),textAlign:TextAlign.center),
          ),
          centerTitle: true,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
/*
            ElevatedButton(
              onPressed: read.play,
              child:Text('Play')
            ),

            SizedBox(height:16.0),

            ElevatedButton(
              onPressed: read.pause,
              child:Text('Pause')
            ),

            SizedBox(height:16.0),

            ElevatedButton(
              onPressed: read.stop,
              child:Text('Stop')
            ),
*/


            SizedBox(height:132.0),

            Container(
              width: 280,
              child: MyRecordUI(read)
            ),

            SizedBox(height:150.0),

            Center(child: Text('Listen to AMR Diab',style: TextStyle(fontSize:30,color:Colors.black),)),
            ElevatedButton(
              onPressed: read.playRanomSong,
              child:Text('FUN : Random song'),
              style: ElevatedButton.styleFrom(
                //fixedSize: Size(150,50),
                primary: Colors.black.withOpacity(.3)
              ),
            ),
            const SizedBox(height:10.0),
            ElevatedButton(
              onPressed: read.stop,
              child:Text('STOP'),
              style: ElevatedButton.styleFrom(
                //fixedSize: Size(150,50),
                primary: Colors.black.withOpacity(.3)
              ),
            ),

            
          ],
        ),
          
      );
      },
    );
    
  }
}


class MyRecordUI extends StatefulWidget {
  final RecordingCubit read;
  const MyRecordUI(this.read);
  @override
  _MyRecordUIState createState() => _MyRecordUIState();
}

class _MyRecordUIState extends State<MyRecordUI> {

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        widget.read.isRecording ?
          widget.read.stopRecording().then((_) => Navigator.pop(context) ) :
          widget.read.startRecording().then((_) => setState((){}));
      },
      child:Row(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon( widget.read.isRecording ? Icons.stop : Icons.play_arrow , size:30 ),
          widget.read.isRecording ? Text('Stop and Save'): Text('Start Recording'),
        ],
      ),
      style: ElevatedButton.styleFrom(
        primary: widget.read.isRecording ? Colors.red : Colors.black
      ),
    );
  }
}