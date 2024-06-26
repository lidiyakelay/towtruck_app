import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:towtruck_app/Components/attachment_widget.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:towtruck_app/Components/big_text.dart';
import 'package:towtruck_app/base/show_custom_snackbar.dart';
import 'package:towtruck_app/controllers/location_controller.dart';
import 'package:towtruck_app/controllers/publish_Controller.dart';
import 'package:towtruck_app/models/publish_data_model.dart';
import 'package:towtruck_app/utils/dimensions.dart';

class PublishPostPage extends StatefulWidget {
  const PublishPostPage({super.key});

  @override
  State<PublishPostPage> createState() => _PublishPostPageState();
}

class _PublishPostPageState extends State<PublishPostPage> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  var pickedFile=null;
  var descriptionController=TextEditingController();

   
  
     Future pickImage(ImageSource source) async {
      image = await picker.pickImage(
        source: source,
      );
      setState(() {
        pickedFile = File(image!.path);
      });
    }

    removeImage() {
      setState(() {
        image = null;
      });
    }

  
  @override
  Widget build(BuildContext context) {
    var location= Get.find<LocationController>().location;
    return GetBuilder<PublishController>(
      builder: (publishController) {
        return 
            Stack(
              children:[
              Stack(
              children: [
                Container(
                 decoration: BoxDecoration(
                   image: DecorationImage(
                     fit: BoxFit.cover,
                     image: AssetImage('assets/images/truck.png')
                   )
                 ),
                  ),
                  Container(
          color: Color.fromARGB(206, 0, 0, 0),
        ),
             ] ),
         
                Column(
                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                 Column(
                             children: [
                  image == null? TextButton(
                             onPressed: () => showDialog<String>(
                               context: context,
                               builder: (BuildContext context) => AlertDialog(
                title: const Text('Add Image',style:TextStyle(
                                           color: Color.fromARGB(255, 244, 241, 241),
                                           fontWeight: FontWeight.normal,
                                           fontSize: 18,
                                           decoration: TextDecoration.none
                                          )),
                actions: <Widget>[
                   Container(
                                height: MediaQuery.of(context).size.height / 5,
                              
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                   
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        optionComponent(
                                            title: 'Camera',
                                            icon: Icons.camera_alt,
                                            onTap: () {
                                              Navigator.pop(context);
                                              pickImage(ImageSource.camera);
                                            }),
                                        optionComponent(
                                            title: 'Image',
                                            icon: Icons.image,
                                            onTap: () {
                                              Navigator.pop(context);
                                              pickImage(ImageSource.gallery);
                                            }),
                                   
                                          
                                      ],
                                    ),
                                    SizedBox(height: Dimensions.height10)
                                  ],
                                ),
                              )
                ],
                               ),
                             ),
                             child:Container(
                               margin: EdgeInsets.only(left:20, right: 20),
                               height: 50,
                decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color.fromARGB(117, 15, 15, 15)
                      ),
                               child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.attachment_rounded,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(
                                      width: Dimensions.height15,
                                    ),
                                    Text(
                                        'Add Attachment',style:TextStyle(
                                             color: Color.fromARGB(255, 244, 241, 241),
                                             fontWeight: FontWeight.normal,
                                             fontSize: 15,
                                             decoration: TextDecoration.none
                                            )
                                        )
                                  ]),
                             ),
                    )
                  : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(alignment: Alignment.topRight, children: [
                          Container(
                              margin: EdgeInsets.only(
                                  top: Dimensions.height10,
                                  left: Dimensions.height20,
                                  right: Dimensions.height20),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(10),
                              ),
                              height: MediaQuery.of(context).size.width / 2,
                              width: MediaQuery.of(context).size.width / 2,
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(10),
                                child: Image.file(
                                  fit: BoxFit.cover,
                                  File(image!.path),
                                ),
                              )),
                          GestureDetector(
                            onTap: () {
                              // Navigator.pop(context);
                              removeImage();
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                  top: Dimensions.height15,
                                  right: Dimensions.height20,
                                  left: Dimensions.height30),
                              width: MediaQuery.of(context).size.width / 4,
                              child: Align(
                                alignment: AlignmentDirectional.topEnd,
                                child: CircleAvatar(
                                  backgroundColor: const Color.fromARGB(172, 255, 193, 7),
                                  radius: 10,
                                  child: Icon(
                                    Icons.close,
                                    size: Dimensions.iconSize15,
                                    color: Colors.yellow,
                                  ),
                                ),
                              ),
                            ),
                          )
                        ]),
                    ],
                  ),
                    
                             ],
                    ),
                 GetBuilder<LocationController>(
                   builder: (locationController) {
                     return Column(
                       children: [
                           Container(
                                  height: 40,
                                  width: double.maxFinite,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  margin: EdgeInsets.only(left: 30,right: 30, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(63, 255, 255, 255),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on, color: Colors.red,),
                                      Text('LAT: ${locationController.location!.latitude ?? ""}',style:
                                                   TextStyle(
                                                    color: Color.fromARGB(226, 255, 255, 255) ,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    decoration: TextDecoration.none
                                                   ), ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: double.maxFinite,
                                  padding: EdgeInsets.only(left: 10, right: 10),
                                  margin: EdgeInsets.only(left: 30,right: 30, top: 10, bottom: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color.fromARGB(63, 255, 255, 255),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(Icons.location_on, color: Colors.red,),
                                      Text('LNG: ${locationController.location!.longitude ?? ""}',style:
                                                   TextStyle(
                                                    color: Color.fromARGB(226, 255, 255, 255) ,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12,
                                                    decoration: TextDecoration.none
                                                   ), ),
                                    ],
                                  ),
                                ),
                             
                               
                       
                            
                           Padding(  
                          
                                  padding: EdgeInsets.only(left:30, right: 30, top: 10),  
                                  child: TextField(  
                                    controller: descriptionController,
                                    style: TextStyle(fontSize: 12, color: Colors.white),
                                    cursorColor: Colors.grey,
                                    obscureText: false,  
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 5),
                                      hintText: 'Description',
                                      filled: true,
                                      fillColor: Color.fromARGB(63, 255, 255, 255),  
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(width: 1, color: const Color.fromARGB(0, 158, 158, 158)), ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    borderSide: BorderSide(width: 1, color: Colors.grey), ),
                                      border: OutlineInputBorder(),  
                                      prefixIcon: Icon(Icons.edit, color: Colors.white,),
                                       hintStyle: TextStyle(
                                        fontSize: 14,
                                     color: Color.fromARGB(207, 255, 255, 255),  ),
                                    ),  
                                  ),  
                                ),
                                     
                       ],
                     );
                   }
                 ),
   GestureDetector(
                          onTap: () {
                            
                            Get.find<LocationController>().getCurrentPosition();
                            print(  Get.find<LocationController>().location);
                          },
                           child: Container(
                              height: 40,
                              width: double.maxFinite,
                              margin: EdgeInsets.only(left: 30,right: 30, top: 10, bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color.fromARGB(213, 96, 96, 96),
                              ),
                              child: Center(
                                child: Text('Get Current Location',style:
                                             TextStyle(
                                              color: Color.fromARGB(255, 244, 241, 241),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                              decoration: TextDecoration.none
                                             ), )
                              ),
                            ),
                         ) ,

                 GestureDetector(
                  onTap: () {
                    publish(publishController, location!);
                  },
                   child: Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width/2,
                        margin: EdgeInsets.only(left: 20,right: 20, top: 10, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color.fromARGB(158, 255, 193, 7),
                        ),
                        child: Center(
                          child: Text('Post',style:
                                       TextStyle(
                                        color: Color.fromARGB(235, 237, 237, 237),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        decoration: TextDecoration.none
                                       ), )
                        ),),
                 )
                    
                               ]
                             ),
                       
              ]);
            
      }
    );
  }
 void publish(PublishController  publishController, Position location){
      double lat= location!.latitude;
      double long =location!.longitude;
      String description= descriptionController.text.trim();
     
     if(long==null && lat==null){
         showCustomSnackbar('please input location', title: "Location");
      }
      else if(description.isEmpty){
        showCustomSnackbar('Type in description', title: 'Password');
      }

      else if(pickedFile==null){
       PublishData publishData= PublishData(description: description, location: {"latitude":lat,"longitude":long});
        publishController.postFeed(publishData).then((status){
          if(status.isSuccess){
            Get.snackbar("Post","Successfully Submited",
              titleText: BigText(text:"Post" , color: Colors.white,),
              messageText: Text("Successfully Submited",style: const TextStyle(
                color: Colors.white,
              ),),
              colorText: Colors.white,
              backgroundColor: const Color.fromARGB(255, 53, 52, 52)
              );
                      }
          else{
            showCustomSnackbar(status.message);
          }
        });
      }
      else{
        
        PublishData(imageFile:pickedFile , description: description, location: {"latitude":lat,"longitude":long});
      }
      }


}