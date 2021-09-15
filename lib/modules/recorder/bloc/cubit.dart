import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/states.dart';

import 'package:flutter_sound_lite/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';


class RecordingCubit extends Cubit<RecordingStates>
{

  FlutterSoundPlayer _player = FlutterSoundPlayer();
  FlutterSoundRecorder _recorder = FlutterSoundRecorder();

  bool get isPlayed     => _player.isPlaying;
  bool get isRecording  => _recorder.isRecording;
  String path = 'test.aac';

  RecordingCubit() : super(Intial())
  {
    _player.openAudioSession();
    _recorder.openAudioSession();
  }

  void dispose()
  {
    _player.closeAudioSession();
    _recorder.closeAudioSession();
  }


  Future<int> getLength() async
  {
    final results = await FirebaseStorage.instance.ref('records').listAll();
    return results.items.length;
  }

  Future<List<Reference>> getItems() async
  {
    final results = await FirebaseStorage.instance.ref('records').listAll();
    return results.items;
  }



  Future<void> play({Future<String>? link}) async
  {
   await _player.startPlayer(
      fromURI: await link ?? this.path,
      codec: Codec.defaultCodec,
    );
  }

  Future<void> pause() async
  {
    _player.isPaused ? await _player.resumePlayer() : await _player.pausePlayer();
  }

  Future<void> stop() async
  {
    await _player.stopPlayer();
  }



  Future<void> startRecording() async
  {
    var status = await Permission.microphone.request();
    if (status == PermissionStatus.granted)
    {
      await _recorder.startRecorder(
        toFile: path,
        codec: Codec.defaultCodec,
      );
    }
    else
      print('Noooo Permission');
  }

  Future<String?> stopRecording() async
  {
    final url = await _recorder.stopRecorder();
    if ( url!= null )
    {
      print('The Link to Record $url');
      await FirebaseStorage.instance.ref('records/'+ Timestamp.now().millisecondsSinceEpoch.toString() +'_$path').putFile(File(url));
    }
    else
      print('The Link to Record is NULLLLLLLLL');

    return url;
  }

  Future<void> removeRecord({String? path})async
  {
    await FirebaseStorage.instance.ref(path).delete();
    return;
  }





  void playRanomSong()
  {

    List<String> _list = [
      "https://www.dlxfile.com/dl/3en/amr-diab/albums/ya-ana-ya-la/05.%20Tabl.mp3",
      "https://www.dlxfile.com/dl/3en/amr-diab/albums/ya-ana-ya-la/11.%20Mahsoud%20-%20Oriental%20Remix.mp3",
      "https://ii.jjj.is/download/dytRwbnEloI/mp3/192/1631657073/efbd0d98c7a51f1fc2bf1216945993d784b186b9a894fe335ca0fe1b9bf1eadc/0",
      "https://www.dlxfile.com/dl/3en/amr-diab/singels%202/Dndnha.Com.Amr.Diab.Ahe.Ahe.remix.mp3",
      "https://www.dlxfile.com/dl/3en/amr-diab/singels/Dndnha.Com.Amr.Diab_Elly_Beny_W_Benak.mp3",
      "https://www.dlxfile.com/dl/3en/amr-diab/albums/sahraan/14.%20Odam%20Merayetha.mp3",
      "https://www.dlxfile.com/dl/3en/amr-diab/albums/sahraan/01.%20Gamda%20Bas.mp3",
      "https://www.dlxfile.com/dl/alf/adham-nabolsi/singles/Dndnha.Com.Adham.Nabulsi.Han.Alan.mp3",
    ];


    play(  link: Future.value( _list.elementAt(Random().nextInt(_list.length)) )  );

  }
  

}