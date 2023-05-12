import 'package:flutter/material.dart';
import 'package:music_p1/provider/music_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MusicHome extends StatefulWidget {
  const MusicHome({Key? key}) : super(key: key);

  @override
  State<MusicHome> createState() => _MusicHomeState();
}

class _MusicHomeState extends State<MusicHome> {
  MusicProvider? mpT;
  MusicProvider? mpF;
  @override
  Widget build(BuildContext context) {
    mpF=Provider.of<MusicProvider>(context,listen: false);
    mpT=Provider.of<MusicProvider>(context,listen: true);
    return SafeArea(child: Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, 'play',arguments: index);
                  mpT!.musicindex=index;
                },
                child: Container(
                  height: 10.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mpF!.musicList[index].c1,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 15),
                      Container(
                        height: 13.h,
                        width: 13.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage("${mpF!.musicList[index].img}"),fit: BoxFit.cover)
                        ),
                      ),
                      SizedBox(width: 20),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${mpF!.musicList[index].name}",style: TextStyle(fontSize: 18.sp,color: Colors.white)),
                          Text("${mpF!.musicList[index].siger}",style: TextStyle(fontSize: 13.sp,color: Colors.white70)),
                        ],
                      ),
                      Spacer(),
                      Icon(Icons.play_arrow,size: 25,color: Colors.white),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
            ),itemCount: mpF!.musicList.length,
            ),
          ),
        ],
      ),
    ));
  }
}
