import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:towtruck_app/utils/dimensions.dart';

class AttachmentWidget extends StatefulWidget {
  const AttachmentWidget({super.key});

  @override
  State<AttachmentWidget> createState() => _AttachmentWidgetState();
}

class _AttachmentWidgetState extends State<AttachmentWidget> {
  ImagePicker picker = ImagePicker();
  XFile? image;
  File? photo;
  @override
  Widget build(BuildContext context) {
    
    Future pickImage(ImageSource source) async {
      image = await picker.pickImage(
        source: source,
      );
      setState(() {});
    }

    removeImage() {
      setState(() {
        image = null;
      });
    }

    return Column(
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
    );
  }
}

Widget optionComponent({
  String? title,
  IconData? icon,
  VoidCallback? onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 40 * 2,
      width: 20 * 4,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 88, 88, 88),
        borderRadius: BorderRadius.circular(Dimensions.radius20),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon!,
            color: Colors.amber,
            size: Dimensions.iconSize24 * 1.2,
          ),
          Text(title!,style:TextStyle(
                                     color: Color.fromARGB(255, 244, 241, 241),
                                     fontWeight: FontWeight.normal,
                                     fontSize: 10,
                                     decoration: TextDecoration.none
                                    ))
        ],
      ),
    ),
  );
}
