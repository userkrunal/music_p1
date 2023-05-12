import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music_p1/model1/music_model.dart';

class MusicProvider extends ChangeNotifier
{

  int musicindex=0;

  List musicList=[
    MusicModel(name: "Bato ko Teri",img: "assets/images/img.png",siger: "Arijit",path: "assets/music/m1.mp3",c1:Colors.purpleAccent.shade700,images: "assets/images/img_1.png"),
    MusicModel(name: "Leja Re ",img: "assets/images/img_3.png",siger: "Dhvani Bhanushali",path: "assets/music/leja.mp3",c1:Colors.purpleAccent.shade700,images: "assets/images/img_2.png"),
    MusicModel(name: "Hame Tumse ",img: "assets/images/img_4.png",siger: "Udit Narayan",path: "assets/music/m2.mp3",c1:Colors.purpleAccent.shade700,images: "assets/images/img_5.png"),
    MusicModel(name: "Chogada",img: "assets/images/img_6.png",siger: "Aayush Sharma",path: "assets/music/m3.mp3",c1:Colors.purpleAccent.shade700,images: "assets/images/img_7.png"),
    MusicModel(name: "Kamariya",img: "assets/images/img_8.png",siger: "Darshan Raval",path: "assets/music/m4.mp3",c1:Colors.purpleAccent.shade700,images: "assets/images/img_9.png"),
    MusicModel(name: "Cham Cham",img: "assets/images/img_10.png",siger: "Meet Bros",path: "assets/music/m5.mp3",c1:Colors.purpleAccent.shade700,images: "assets/images/img_11.png"),
  ];

  AssetsAudioPlayer assetsAudioPlayer=AssetsAudioPlayer();
  bool isplay=false;
  Duration musicduration=Duration(seconds: 0);

  List<Audio>playList=[
    Audio("assets/music/m1.mp3"),
    Audio("assets/music/leja.mp3"),
    Audio("assets/music/m2.mp3"),
    Audio("assets/music/m3.mp3"),
    Audio("assets/music/m4.mp3"),
    Audio("assets/music/m5.mp3"),
  ];
  initMusic()
  {
    assetsAudioPlayer.open(
      autoStart: false,
      showNotification: true,
      Playlist(
          audios: playList,
        startIndex: musicindex!,

      )
    );
    audioduration();
  }
  playmusic()
  {
    isplay=true;
    assetsAudioPlayer.play();
    notifyListeners();
  }

  stopmusic()
  {
    isplay=false;
    assetsAudioPlayer.pause();
    notifyListeners();
  }

  nextmusic()
  {
    assetsAudioPlayer.next();
    isplay=true;
    if(musicindex<musicList.length-1)
      {
        musicindex++;
      }
    notifyListeners();
  }
  permusic()
  {
    assetsAudioPlayer.previous();
    isplay=true;
    if(musicindex>0)
      {
        musicindex--;
      }
    notifyListeners();
  }
  audioduration()
  {
    assetsAudioPlayer.current.listen((event) {
      musicduration=event!.audio.duration;
    });
  }

  musicindexpass(int index)
  {
    musicindex=index;
    notifyListeners();
  }
}