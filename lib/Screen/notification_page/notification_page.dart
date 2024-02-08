import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color(0XFFdadada) ,
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20, right: 20, top: 40,bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.notifications, color: const Color.fromARGB(210, 0, 0, 0),),
                    Text('Notifications', style: TextStyle(
                                          color: Color.fromARGB(176, 0, 0, 0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          decoration: TextDecoration.none
                                        ),)
                  ],
                ),
                 Row(
                  children: [
                    Icon(Icons.delete, color: const Color.fromARGB(210, 0, 0, 0),),
                    Text('Clear', style: TextStyle(
                                          color: Color.fromARGB(176, 0, 0, 0),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          decoration: TextDecoration.none
                                        ),)
                  ],
                ),
              ],
            ),
            
          ),
          Divider(
            color: Color.fromARGB(201, 75, 75, 75),
            indent: 20,
            endIndent: 20,
          ),
          Container(
             padding: EdgeInsets.only(left: 20, right: 20, top: 1,bottom: 1),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width/1.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                         Text('Lorem ipsum dolor sit amet, consectetur, Lorem...',style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('January 24 2024',style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          )),
                          Text('08:24 PM',style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          )),
                          ],
                        )
                      ],
                    ),
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
             padding: EdgeInsets.only(left: 20, right: 20, top: 1,bottom: 1),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width/1.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                         Text('Lorem ipsum dolor sit amet, consectetur, Lorem...',style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('January 24 2024',style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          )),
                          Text('08:24 PM',style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          )),
                          ],
                        )
                      ],
                    ),
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
             padding: EdgeInsets.only(left: 20, right: 20, top: 1,bottom: 1),
            child: Row(
              children: [
                CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/user.jpg'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    width: MediaQuery.of(context).size.width/1.35,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment:CrossAxisAlignment.start ,
                      children: [
                         Text('Lorem ipsum dolor sit amet, consectetur, Lorem...',style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          )),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('January 24 2024',style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          )),
                          Text('08:24 PM',style:
                          TextStyle(
                            color: Color.fromARGB(198, 6, 6, 6),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          )),
                          ],
                        )
                      ],
                    ),
                  )
              ],
            ),
          ),
            Divider(
            color: Color.fromARGB(201, 75, 75, 75),
            indent: 20,
            endIndent: 20,
          ),
        ],
      ),
    );
  }
}