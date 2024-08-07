import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bird_wallpaper/constant/gloable.dart';
import 'package:bird_wallpaper/view/wallpaperset_bird.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';

showExitdialog(context) async{
  return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:gcolor.white,
          shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(30.0),),
          content: Wrap(
            alignment: WrapAlignment.center,
            children: [
              const SizedBox(height:5), 
              SizedBox(height:120,width: width(context),child: const Icon(Icons.exit_to_app_outlined,size:70,color: gcolor.red,),),
              const Text("Exit App",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:gcolor.black,fontFamily:"Poppins"),),
              const Text("Do you want to really exit the app?",style: TextStyle(fontSize: 12,color:gcolor.black,fontFamily:"Poppins"),),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   GestureDetector(
                     onTap: (){
                        Navigator.of(context).pop();
                     },
                     child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 40,
                        width: 85,
                        decoration: BoxDecoration(
                          gradient: gredient()
                        ),
                        child: const Center(child: Text("No",style: TextStyle(color:gcolor.white,fontFamily:"Poppins",fontSize:14)),),
                      ),
                    ),
                   ),
                  GestureDetector(
                    onTap: (){ 
                         exit(0);
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 40,
                        width: 85,
                        decoration: BoxDecoration(
                          gradient: gredient()
                        ),
                        child: const Center(child: Text("Yes",style: TextStyle(color:gcolor.white,fontFamily:"Poppins",fontSize:14)),),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 30,),
           ]
          ),
        );
      });
} 

urlpassweb(String path)
async{
  final Uri url= Uri.parse(path);
  await launchUrl(url,mode: LaunchMode.externalApplication);
  
}
needpermission() async {
    await Permission.storage.request();
     var status=await Permission.storage.request();
     if (status==PermissionStatus.permanentlyDenied ||status==PermissionStatus.denied ) 
    {
      tost("If you are use our app feature to go permission setting and give Permission Allowed");
      needpermission();
      openAppSettings();   
    }
}
tost(String tosttitle)
  {
    return Fluttertoast.showToast(
        msg: tosttitle,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 2,
        backgroundColor:gcolor.red,
        textColor:gcolor.white,
        fontSize: 16.0,    
    );
  }





Future wallpapersetdialog(BuildContext context,String image) async{
  return await showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor:gcolor.white,
          shape: RoundedRectangleBorder(borderRadius:  BorderRadius.circular(30.0),),
          content: Wrap(
            alignment: WrapAlignment.center,
            children: [
              const SizedBox(width: 200,height: 120, child:Icon(Icons.wallpaper,color:gcolor.red,size:100)),
              const Text("Set Wallpaper",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color:gcolor.black,fontFamily:"Poppins"),),
              const Text("Are you sure set wallpaper?",style: TextStyle(fontSize: 12,color:gcolor.black,fontFamily:"Poppins"),),
              const SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                   GestureDetector(
                     onTap: (){ 
                         Navigator.of(context).pop();    
                     },
                     child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(gradient: gredient()),
                        child: const Center(child: Text("No",style: TextStyle(color:gcolor.white,fontFamily:"Poppins",fontSize:14)),),
                      ),
                    ),
                   ),
                  GestureDetector(
                    onTap: () async {
                        wallpaperset(image.toString());                      
                        Navigator.of(context).pop();
                        Navigator.push(context,MaterialPageRoute(builder:((context)=>WallpapersetBird())));   
                    },
                    child: ClipRRect(
                       borderRadius: BorderRadius.circular(20),
                      child: Container(
                        height: 40,
                        width: 90,
                        decoration: BoxDecoration(gradient: gredient()),
                        child: const Center(child: Text("Yes",style: TextStyle(color:gcolor.white,fontFamily:"Poppins",fontSize:14)),),
                      ),
                    ),
                  )
                ],
              ),   
              const SizedBox(height: 30,),
            ]
          ),
        );
      }
  );
}

wallpaperset(String imgwallpaper)async {
    DateTime d=DateTime.now();
    int mi= d.microsecond;
    final bytes = await rootBundle.load(imgwallpaper);
    final list = bytes.buffer.asUint8List();
    final tempDir = await getTemporaryDirectory();
    final file = await File('${tempDir.path}/$mi+$d.jpg').create();
    file.writeAsBytesSync(list);
    int location = WallpaperManager.BOTH_SCREEN; // or location = WallpaperManager.LOCK_SCREEN;
    await WallpaperManager.setWallpaperFromFile(file.path, location);
}

