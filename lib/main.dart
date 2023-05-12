import 'package:flutter/material.dart';
import 'package:music_p1/provider/music_provider.dart';
import 'package:music_p1/view/music_play.dart';
import 'package:music_p1/view/music_screen.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
   Sizer(builder: (context, orientation, deviceType) {
     return  MultiProvider(
       providers: [
         ChangeNotifierProvider(create: (context) => MusicProvider())
       ],
       child: MaterialApp(
         debugShowCheckedModeBanner: false,
         routes: {
           '/':(context) => MusicHome(),
           'play':(context) => MusicPlayScreen(),
         },
       ),
     );
   },)
  );
}