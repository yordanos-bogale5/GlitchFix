// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:bird_wallpaper/controller/utility/utility.dart';
import '../constant/getx.dart';
import '../constant/gloable.dart';


class ViewBird extends StatefulWidget {
  List img=[];
  int startpage;
  ViewBird({Key? key,required this.img,required this.startpage}) : super(key: key);
  @override
  State<ViewBird> createState() => _ViewBirdState();
}

class _ViewBirdState extends State<ViewBird> {
  late PageController pagecontrol;
  String ?wallimage;
  @override
  void initState() {
    super.initState();
    pagecontrol=PageController(initialPage: widget.startpage);
     if(gcontrolloer.interadpluse.value!=40)
     {needpermission();}
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:applicationbar("Wallpaper"),
      body: SafeArea(
        child: Stack(
          children: [
                PageView.builder(             
                  scrollDirection: Axis.horizontal,
                  controller: pagecontrol,
                  itemCount:widget.img.length,
                  itemBuilder:(context, index) {
                    wallimage=widget.img[index];
                  return    
                  Container(
                    height: height(context),
                    width: width(context),
                    decoration:BoxDecoration(
                      image:DecorationImage(
                        fit: BoxFit.cover,
                        image:AssetImage(widget.img[index],)
                      ),  
                    ),
                  );
                  }
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10,bottom:100),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           InkWell(
                                 onTap: (){
                                 },
                                 child: Container(
                                   height:70,
                                   width:70,
                                   decoration:BoxDecoration(
                                     gradient: gredient(),
                                     borderRadius:BorderRadius.circular(20),
                                   ),
                                   child: const Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Icon(Icons.download,size:30,color: gcolor.white,),
                                       Text("Download",style:TextStyle(fontSize:10,fontFamily:"Poppins",color: gcolor.white),),
                                     ],
                                   ),
                                 ),
                               ),
                               InkWell(
                                 onTap: (){
                                   wallpapersetdialog(context,wallimage.toString());  
                                 },
                                 child: Container(
                                   height:70,
                                   width:70,
                                   decoration:BoxDecoration(
                                     gradient: gredient(),
                                     borderRadius:BorderRadius.circular(25),
                                   
                                   ),
                                   child: const Column(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Icon(Icons.wallpaper,size:25,color: gcolor.white,),
                                       Text("Set",style:TextStyle(fontSize:10,fontFamily:"Poppins",color: gcolor.white),),
                                       Text("Wallpaper",style:TextStyle(fontSize:10,fontFamily:"Poppins",color: gcolor.white),),
                                     ],
                                   ),
                                 ),
                               ),
                              InkWell(
                                onTap: (){

                                },
                                  child: Container(
                                  height:70,
                                  width:70,
                                  decoration:BoxDecoration(
                                    borderRadius:BorderRadius.circular(25),
                                    gradient: gredient()
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.share,size:30,color: gcolor.white,),
                                      Text("Shar",style:TextStyle(fontSize:11,fontFamily:"Poppins",color: gcolor.white),),
                                    ],
                                  ),
                                ),
                              ),
                    ],
                  )    
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}