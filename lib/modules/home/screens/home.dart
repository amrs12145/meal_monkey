
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meal_monkey/modules/home/bloc/cubit.dart';
import 'package:meal_monkey/modules/home/bloc/states.dart';
import 'package:meal_monkey/modules/login/bloc/cubit.dart';
import 'package:meal_monkey/shared/routes.dart';

import 'package:flutter_slidable/flutter_slidable.dart';

import 'tmp.dart';




class HomeScreen extends StatelessWidget {


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

        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push( context,MaterialPageRoute(builder:(_)=> AddScreen()) )
            //Instead of Reloading with setState
            .then((_) => Navigator.pushReplacementNamed(context,Routes.loginScreen)),
          child: Icon(Icons.add),
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Theme.of(context).accentColor,
          //materialTapTargetSize:MaterialTapTargetSize.padded
        ),

        body: FutureBuilder(
          future: read.getItems(),
          builder:(ctx,AsyncSnapshot<List<Reference>> snapshot){

            if ( snapshot.connectionState == ConnectionState.done )
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (ctx,i){
                  return MySlider(snapshot.data![i],read);
                },
              );
            return CircularProgressIndicator();

          }
        ),
          
      );
      },
    );
    
  }
}


class MySlider extends StatefulWidget {

  final Reference ref;
  final RecordingCubit read;
  const MySlider(this.ref,this.read);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {

  @override
  Widget build(BuildContext context) {
    return Slidable(
        actionPane: SlidableStrechActionPane(),
        secondaryActions: [
          SlideAction(
            closeOnTap: true,
            onTap: () {
              widget.read.removeRecord(path: widget.ref.fullPath )
                .then((_) => Navigator.pushReplacementNamed(context,Routes.loginScreen) );
            },
            child: Icon(Icons.delete),
          ),
        ],
        actionExtentRatio: 0.25,
        child: Card(
          margin: EdgeInsets.only(bottom: 20.0),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: InkWell(
                onTap: () async {
                  if ( widget.read.isPlayed )
                  {
                    await widget.read.pause().then((_) => setState((){}));
                  }
                  else
                  {
                    await widget.read.play( link: widget.ref.getDownloadURL() ).then((_) => setState((){}));
                  }
                  
                },
                child: Icon(widget.read.isPlayed ? Icons.pause : Icons.play_arrow ,size: 35,),
              ),
              title: Text('Tap to play'),
              subtitle: Text('Scroll to delete'),
              trailing: Icon(Icons.arrow_forward_ios ,size: 28),
            ),
          ),
        ),

      );
  }
}