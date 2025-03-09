import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_application_1/RecognizerScreen.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {


  late ImagePicker imagePicker;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    imagePicker = ImagePicker();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 40,bottom: 10,left: 5,right: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Card(
            color: Colors.blueAccent, 
            child: SizedBox(
                height: 80,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        InkWell(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.scanner,
                                size: 35 ,
                                color: Colors.white,
                              ),
                              Text("Scan",style: TextStyle(color: Colors.white),)
                            ],
                          ),onTap: (){

                          },
                        ),
                        InkWell(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.document_scanner,
                                size: 45,
                                color: Colors.white,
                              ),
                              Text("Recognize",style: TextStyle(color: Colors.white),)
                            ],
                          ),onTap: (){

                          },
                        ),
                        InkWell(
                          child:Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.assessment_sharp,
                                size: 35,
                                color: Colors.white,
                              ),
                              Text("Enhanse",style: TextStyle(color: Colors.white),)
                            ],
                          ),onTap: (){

                          },
                        ),
                    ],
                )
                )
          ),
          Card(
            color: Colors.black,
            child: Container(
              height: MediaQuery.of(context).size.height-300,

            ),
          ),
          Card(
            color: Colors.blueAccent, 
            child: SizedBox(
                height: 100,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                        InkWell(
                          child:const Icon(
                            Icons.rotate_left,
                            size: 35 ,
                            color: Colors.white,
                          ),onTap: (){

                          },
                        ),
                        InkWell(
                          child:const Icon(
                            Icons.camera,
                            size: 50,
                            color: Colors.white,
                          ),onTap: (){

                          },
                        ),
                        InkWell(
                          child:const Icon(
                            Icons.image,
                            size: 35,
                            color: Colors.white,
                          ),onTap: () async {
                            XFile? xFile= await imagePicker.pickImage(source: ImageSource.gallery);
                            if(xFile!=null){
                              File image = File(xFile.path);
                              Navigator.push(context, MaterialPageRoute(builder: (cyx){
                                return RecScreen(image);
                              }));
                            }
                          },
                        )
                    ],
                )
                )
          ),
        ],
      ),
    );
  }
}
