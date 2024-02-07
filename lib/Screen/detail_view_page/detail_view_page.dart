import 'package:flutter/material.dart';

class DetailViewPage extends StatelessWidget {
  const DetailViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFFdadada),
     body: Column(
      children: [
        Stack(
                    children: [
                      Container(
                         height: 100,
                         color: Colors.black,
                      ),
                         Container(
                    height: 250,
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/truck2.png'))
              
                    ),
                  ),
                  Container(
                    height: 250,
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromARGB(164, 0, 0, 0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 30, bottom:30),
                          child: Row(
                            children: [
                           
                                CircleAvatar(
                              radius: 20,
                              backgroundColor: Color.fromARGB(98, 255, 255, 255),
                              child: Icon(Icons.arrow_back, color: Colors.amber,size:20)),
                       
                            
                          
                            ],
                          ),
                        ),
                        
                      
                      ],
                    ),
                  )
                    ],
                  ),
      ],
     ),
    );
  }
}