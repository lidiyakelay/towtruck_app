import 'package:flutter/material.dart';

class PublishPostPage extends StatefulWidget {
  const PublishPostPage({super.key});

  @override
  State<PublishPostPage> createState() => _PublishPostPageState();
}

class _PublishPostPageState extends State<PublishPostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
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
          padding: EdgeInsets.all(20),
          width: double.maxFinite,
          color: Color.fromARGB(206, 0, 0, 0),
          child:  Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width/1.4,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(227, 0, 0, 0),
              image: DecorationImage(
                image: AssetImage('assets/images/addphoto.png'))

            ),
          ),
           Column(
             children: [
               Padding(  
                            padding: EdgeInsets.only(left:40, right: 40, top: 10),  
                            child: TextField(  
                              style: TextStyle(fontSize: 12),
                              cursorColor: Colors.grey,
                              obscureText: true,  
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 5),
                                hintText: 'Location',
                                filled: true,
                                fillColor: Color.fromARGB(63, 255, 255, 255),  
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(width: 1, color: const Color.fromARGB(0, 158, 158, 158)), ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(width: 1, color: Colors.grey), ),
                                border: OutlineInputBorder(),  
                                prefixIcon: Icon(Icons.location_on, color: Colors.red,),
                                 hintStyle: TextStyle(
                                  fontSize: 14,
                               color: Color.fromARGB(207, 255, 255, 255),  ),
                              ),  
                            ),  
                          ),
                  
                 Padding(  
                        padding: EdgeInsets.only(left:40, right: 40, top: 10),  
                        child: TextField(  
                          style: TextStyle(fontSize: 12),
                          cursorColor: Colors.grey,
                          obscureText: true,  
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
           ),
           Container(
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
                ),)

        ]
      ) ,
        ),
       ],
    ),
     
      ])
    
    );
  }
}