// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:bird_wallpaper/constant/gloable.dart';

class WallpapersetBird extends StatefulWidget {
  WallpapersetBird({Key? key}) : super(key: key);

  @override
  State<WallpapersetBird> createState() => _WallpapersetBirdState();
}

class _WallpapersetBirdState extends State<WallpapersetBird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: applicationbar("Wallpaper Set"),
      body: const SafeArea(
        child:Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height:170,width:200,
                    child: Icon(Icons.wallpaper_outlined,size:100,color: gcolor.red,)),
                  ],
                ) ,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Wallpaper are Set",style: TextStyle(fontSize:17,fontFamily:"Poppins",))  
                  ],
                ),
                Divider(color: gcolor.red,height: 50,indent:30,endIndent:30,thickness: 2,) ,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    Text("Show your Homescreen and",style: TextStyle(fontSize:13,fontFamily:"Poppins",)),
                    Text("lockscreen both wallpaper are set",style: TextStyle(fontSize:13,fontFamily:"Poppins",)),
                  ],
                ),
              ],
            ),
          ],
        )
      ),
    );
  }
}