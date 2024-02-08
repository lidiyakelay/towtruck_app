import 'package:flutter/material.dart';

class DetailViewPage extends StatelessWidget {
  const DetailViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: Color(0xFFdadada),
     body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
                    children: [
                      Container(
                         height: 100,
                         color: Color.fromARGB(236, 0, 0, 0),
                      ),
                         Container(
                    height: 260,
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/truck2.png'))
              
                    ),
                  ),
                  Container(
                    height: 260,
                    margin: EdgeInsets.only(top: 25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Color.fromARGB(193, 0, 0, 0),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20, left: 30, bottom:30),
                          child: Row(
                            children: [
                           
                                CircleAvatar(
                              radius: 25,
                              backgroundColor: Color.fromARGB(61, 255, 255, 255),
                              child: Icon(Icons.arrow_back, color: Colors.amber,size:20)),
                          
                            ],
                          ),
                        ),
                         Column(
                           children: [
                             Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 CircleAvatar(
                                      radius: 4,
                                      backgroundColor: Color.fromARGB(226, 255, 255, 255),
                                   ),
                               ],
                             ),
                                   SizedBox(height: 15,)
                           ],
                         ),
                   
                      
                      ],
                    ),
                  )
                    ],
                  ),
                  Container(
                  margin:EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 15),
                  child: Text('Alaska, Alkam High Way', style:
                    TextStyle(
                      color: Color.fromARGB(198, 6, 6, 6),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      decoration: TextDecoration.none
                    ),),
          ),
          Divider(
            color: Color.fromARGB(201, 75, 75, 75),
            indent: 20,
            endIndent: 20,
          ),
          Container(
                  margin:EdgeInsets.only(left: 20, right: 20, bottom:1, top:1),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Published By',style:
                      TextStyle(
                        color: Color.fromARGB(198, 6, 6, 6),
                        fontWeight: FontWeight.w700,
                        fontSize: 14,
                        decoration: TextDecoration.none
                      )),
                      Text('Jhon Doe',style:
                      TextStyle(
                        color: Color.fromARGB(198, 6, 6, 6),
                        fontWeight: FontWeight.w500,
                        fontSize: 12,
                        decoration: TextDecoration.none
                      )),
                  ],
                ),
                CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage('assets/images/user.jpg'),
                )
              ],
            ),
          ),
           Divider(
            color: Color.fromARGB(201, 75, 75, 75),
            indent: 20,
            endIndent: 20,
          ),
            Container(
              margin:EdgeInsets.only(left: 20, right: 20, bottom:1, top:1),
              child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Description',style:
                        TextStyle(
                          color: Color.fromARGB(198, 6, 6, 6),
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                          decoration: TextDecoration.none
                        )),
                        Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet.',style:
                        TextStyle(
                          color: Color.fromARGB(198, 6, 6, 6),
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          decoration: TextDecoration.none
                        )),
                    ],
                  ),
            ),
            Divider(
            color: Color.fromARGB(201, 75, 75, 75),
            indent: 20,
            endIndent: 20,
          ),
          Container(
              margin:EdgeInsets.only(left: 20, right: 20, bottom:1, top:1),

            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width/3.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Icon(Icons.location_on, size: 16, color: Colors.red,),
                     SizedBox(width: 5,),
                     Text('Location',style:
                     TextStyle(
                     color: Color.fromARGB(176, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.none ),),
                                  ],
                                ),
                                SizedBox(height: 5,),
                  Text("63° 50' north latitude,\n152° west longitude ",style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            decoration: TextDecoration.none
                          )),
                  ],),
                ),
                  Container(
                    height: 50,
                  width: MediaQuery.of(context).size.width/4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Icon(Icons.calendar_month, size: 16, color: Colors.green,),
                     SizedBox(width: 5,),
                     Text('Location',style:
                     TextStyle(
                     color: Color.fromARGB(176, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.none ),),
                                  ],
                                ),
                                SizedBox(height: 5,),
                  Text("January 24 2024 ",style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            decoration: TextDecoration.none
                          )),
                  ],),
                ),
                  Container(
                    
                    height: 50,
                  width: MediaQuery.of(context).size.width/5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                     Icon(Icons.lock_clock, size: 16, color: Colors.yellow,),
                     SizedBox(width: 5,),
                     Text('Time',style:
                     TextStyle(
                     color: Color.fromARGB(176, 0, 0, 0),
                      fontWeight: FontWeight.bold,
                    fontSize: 14,
                    decoration: TextDecoration.none ),),
                                  ],
                                ),
                                SizedBox(height: 5,),
                  Text("08:24 PM",style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 10,
                            decoration: TextDecoration.none
                          )),
                  ],),
                )
              ],
            ),

          ),
          SizedBox(height: 30,),
              Container(
                height: 55,
                width: double.maxFinite,
                margin: EdgeInsets.only(left: 10,right: 10, top: 10, bottom: 10),
                padding: EdgeInsets.only(left: 10,right: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color.fromARGB(233, 0, 0, 0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Container(
                         margin: EdgeInsets.only(left: 20,right: 20, top: 10, bottom: 10),
                        child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                                         Text('United States',style:
                                  TextStyle(
                                   color: Color.fromARGB(255, 244, 241, 241),
                                   fontWeight: FontWeight.bold,
                                   fontSize: 12,
                                   decoration: TextDecoration.none
                                  ), ),
                                          Text('Alaska',style:
                                  TextStyle(
                                   color: Color.fromARGB(255, 244, 241, 241),
                                   fontWeight: FontWeight.normal,
                                   fontSize: 10,
                                   decoration: TextDecoration.none
                                  ), ),
                                       
                          ],
                        ),
                      ),
                    ),
                  Container(
                  width: 80,
                  padding: EdgeInsets.only(top: 5,bottom: 5,left: 2,right: 2),
                  margin: EdgeInsets.only(left: 20,right: 20, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color.fromARGB(162, 255, 255, 255),),
                    child: Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.red,),
                           Text('View Map',style:
                                  TextStyle(
                                   color: Color.fromARGB(255, 244, 241, 241),
                                   fontWeight: FontWeight.normal,
                                   fontSize: 10,
                                   decoration: TextDecoration.none
                                  ), ),
                      ],
                    ),
                ),
                  ],
                ),
              ) ,
      ],
     ),
    );
  }
}