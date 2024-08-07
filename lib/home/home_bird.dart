// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:bird_wallpaper/constant/gloable.dart';
import 'package:bird_wallpaper/view/category_bird.dart';
import '../controller/utility/utility.dart';

class HomeBird extends StatefulWidget {
  HomeBird({Key? key}) : super(key: key);

  @override
  State<HomeBird> createState() => _HomeBirdState();
}

class _HomeBirdState extends State<HomeBird> {
  List category=[
    'HD',
    'Beautiful',
    'Aesthetic',
    'Natural',
    'Gallary'
  ];
  List categoryimg=[
    'assets/images/ddhhdh.jpg',
    'assets/images/beuu.jpg',
    'assets/images/natutt.jpg',
     'assets/images/asee.jpg',
    'assets/images/ggaal.jpg', 
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () =>  showExitdialog(context),
      child: Scaffold(
        appBar: AppBar(  
          flexibleSpace: Container(
            decoration: BoxDecoration(gradient: gredient() ),
          ),
          iconTheme:const IconThemeData(color:gcolor.white),
          title: const Text("Birds Wallpaper",style: TextStyle(fontSize:17,fontFamily:"Poppins",color: gcolor.white),),
          centerTitle: true, 
        ),
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
                          crossAxisCount:1,
                          mainAxisSpacing:5,
                          crossAxisSpacing:6,
                          childAspectRatio:0.35/0.2,
                          children:List.generate(category.length,((index) {
                            return 
                            InkWell(
                              onTap: (){
                                 if(index==0)
                                  {
                                    Navigator.push(context,MaterialPageRoute(builder:((context)=>CatBird(cimg:bbhh,name:category[index]))));
                                  }
                                  else if(index==1)
                                  {
                                    Navigator.push(context,MaterialPageRoute(builder:((context)=>CatBird(cimg:bbut,name:category[index]))));
                                  }
                                  else if(index==2)
                                  {
                                    Navigator.push(context,MaterialPageRoute(builder:((context)=>CatBird(cimg:asth,name:category[index]))));
                                  }
                                  else if(index==3)
                                  {
                                    Navigator.push(context,MaterialPageRoute(builder:((context)=>CatBird(cimg:nattu,name:category[index]))));
                                  }
                                  else if(index==4)
                                  {
                                    Navigator.push(context,MaterialPageRoute(builder:((context)=>CatBird(cimg:gal,name:category[index]))));
                                  } 
                              },
                              child:Stack(
                                children: [
                                  Container(
                                    decoration:BoxDecoration(
                                      image:DecorationImage(image: AssetImage(categoryimg[index]),fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(15)
                                    ),
                                  ),
                                  Container(
                                    decoration:BoxDecoration(
                                      borderRadius:  BorderRadius.circular(15)
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex:4,
                                          child:Container(
                                            decoration:BoxDecoration(
                                              borderRadius:  BorderRadius.circular(15)
                                            ),
                                          )
                                        ),
                                        Expanded(
                                          child: Container(
                                            decoration:BoxDecoration(
                                              color: gcolor.black.withOpacity(0.5),
                                              borderRadius:  const BorderRadius.only(bottomLeft: Radius.circular(15),bottomRight: Radius.circular(15))
                                            ), 
                                            child:Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                const Icon(Icons.collections,color: gcolor.white,size:20,),
                                                const SizedBox(width:5,),
                                                Flexible(child: Text(category[index],style: const TextStyle(fontSize:20,color: gcolor.white,),overflow: TextOverflow.ellipsis,)),    
                                              ],
                                            )
                                          )
                                        )
                                      ],
                                    ),        
                                  ),
                                ],
                              )
                            );
                          }))  ,
                        ),
                    ),
                  ), 
                ]
              ),
            ],
          ) 
        ),
      ),
    );
}
}