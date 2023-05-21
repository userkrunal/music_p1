import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_p1/provider/music_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MusicPlayScreen extends StatefulWidget {
  const MusicPlayScreen({Key? key}) : super(key: key);

  @override
  State<MusicPlayScreen> createState() => _MusicPlayScreenState();
}

class _MusicPlayScreenState extends State<MusicPlayScreen> {

  @override
  void initState() {
    super.initState();
    Provider.of<MusicProvider>(context,listen: false).initMusic();
  }
  MusicProvider? mpT;
  MusicProvider? mpF;
  @override
  Widget build(BuildContext context) {

    int index=ModalRoute.of(context)!.settings.arguments as int;
    mpT=Provider.of<MusicProvider>(context,listen: true);
    mpF=Provider.of<MusicProvider>(context,listen: false);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, -1),
            child: Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, icon: Icon(Icons.arrow_back,color: Colors.white,size: 25)),
                Spacer(),
                Icon(Icons.star_border_outlined,color: Colors.white,size: 25),
                SizedBox(width: 10),
                Icon(Icons.more_vert_outlined,color: Colors.white,size: 25),
                SizedBox(width: 20),
              ],
            ),
          ),
          Align(
            alignment: Alignment(-1, -0.4),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                height: 50.h,width: 100.w,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("${mpT!.musicList[mpT!.musicindex].images}"),fit: BoxFit.cover
                  )
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, 0.5),
            child: PlayerBuilder.currentPosition(player: mpF!.assetsAudioPlayer,
                builder: (context, position) {
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Slider(value: position.inSeconds.toDouble(), onChanged: (value) {
                        position=Duration(seconds: value.toInt());
                        mpF!.assetsAudioPlayer.seek(position);
                      },
                        max: mpF!.musicduration.inSeconds.toDouble(),
                        inactiveColor: Colors.white70,
                        activeColor: Colors.purpleAccent,
                        thumbColor: Colors.white,
                      ),
                      Align(
                        alignment: Alignment(0, 0.5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 25),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("$position",style: TextStyle(color: Colors.white)),
                              Text("${mpF!.musicduration.inMinutes.toDouble()}",style: TextStyle(color: Colors.white)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
            ),
          ),
          Align(
            alignment: Alignment(0, 0.7),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: () {}, icon: Icon(Icons.refresh,color: Colors.white,size: 30,)),
                IconButton(onPressed: () {
                  mpF!.permusic();
                }, icon: Icon(Icons.skip_previous,color: Colors.white,size: 30)),
                FloatingActionButton(backgroundColor: Colors.purpleAccent.shade400,
                    onPressed: (){
                  if(mpF!.assetsAudioPlayer.isPlaying.value)
                  {
                    mpF!.stopmusic();
                  }
                  else
                  {
                    mpF!.playmusic();
                  }
                },child: mpF!.isplay?Icon(Icons.pause,color: Colors.white,size: 30):Icon(Icons.play_arrow,color: Colors.white,size: 30)),
                IconButton(onPressed: () {
                  mpF!.nextmusic();
                }, icon: Icon(Icons.skip_next,color: Colors.white,size: 30)),
                IconButton(onPressed: () {}, icon: Icon(Icons.repeat,color: Colors.white,size: 30)),
              ],
            ),
          ),
          Align(
            alignment: Alignment(0, 0.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){}, icon: Icon(Icons.share,color: Colors.white,size: 27)),
                IconButton(onPressed: (){}, icon: Icon(Icons.shuffle,color: Colors.white,size: 27)),
                IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.white,size: 27)),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
