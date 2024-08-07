// ignore_for_file: camel_case_types, must_be_immutable
import 'package:flutter/material.dart';
import 'package:bird_wallpaper/constant/gloable.dart';
import 'package:bird_wallpaper/view/viewwallpaper_bird.dart';

class CatBird extends StatefulWidget {
  List<dynamic> cimg=[];
  String name;
  CatBird({Key? key,required this.cimg,required this.name}) : super(key: key);

  @override
  State<CatBird> createState() => _CatBirdState();
}
class _CatBirdState extends State<CatBird> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: applicationbar(widget.name),
      body: SafeArea(
        child:Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top:10,bottom: 12,right: 8,left: 8),
                    child: GridView.count(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true, 
                        crossAxisCount:2,
                        mainAxisSpacing:5,
                        crossAxisSpacing:5,
                        childAspectRatio:0.3/0.49,
                        children:List.generate(widget.cimg.length,((index) {
                          return GestureDetector(
                            onTap: ()
                            {
                              Navigator.push(context,MaterialPageRoute(builder:((context)=>ViewBird(img: widget.cimg, startpage:index))));   
                            },
                            child: Stack(
                              children: [
                                Container(  
                                  decoration:BoxDecoration(
                                    boxShadow: [boxshaw()],
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(image: AssetImage(widget.cimg[index]),fit: BoxFit.cover)
                                  ),       
                                ),
                              ],
                            )
                          );
                        })
                      )  ,
                    ),
                  ),
                ), 
              ]
            ),
          ],
        ) 
      ),
    );
  }
}