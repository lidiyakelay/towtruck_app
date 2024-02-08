import 'package:flutter/material.dart';

class MapViewPage extends StatefulWidget {
  const MapViewPage({super.key});

  @override
  State<MapViewPage> createState() => _MapViewPageState();
}

class _MapViewPageState extends State<MapViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Stack(
       children: [
        Container(
                         height: 100,
                         color: Colors.black,
                      ),
         Container(
          margin: EdgeInsets.only(top: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
            topRight: Radius.circular(30)),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/map.png')
            )
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 30),
          padding: EdgeInsets.only(top: 20, left: 20, right: 20) ,
          decoration: BoxDecoration(
               borderRadius: BorderRadius.only(topLeft: Radius.circular(30),
            topRight: Radius.circular(30)),
              color: Color.fromARGB(87, 0, 0, 0),
          ),
        
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                       radius: 25,
                      backgroundColor: Color.fromARGB(153, 7, 7, 7),
                       child: Icon(Icons.arrow_back, color: Colors.amber,size:20)),
                   Container(  
                    width: MediaQuery.of(context).size.width/1.3,
                        padding: EdgeInsets.only(left:20, right: 20, top: 10),  
                        child: TextField(  
                          style: TextStyle(fontSize: 12),
                          cursorColor: Colors.grey,
                          obscureText: true,  
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 5),
                            filled: true,
                            hintText: ('Search by place'),
                             hintStyle: TextStyle(
                              fontSize: 14,
                           color: Color.fromARGB(207, 255, 255, 255),), 
                            fillColor: Color.fromARGB(153, 7, 7, 7),  
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(width: 1, color: const Color.fromARGB(0, 158, 158, 158)), ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          borderSide: BorderSide(width: 1, color: Colors.grey), ),
                            border: OutlineInputBorder(),  
                            
                            prefixIcon: Icon(Icons.search, color: Colors.amber,),
                            
                          ),  
                        ),  
                      ),  
                ],
              ),
              Container(
          margin: EdgeInsets.only(left: 10,right: 10, bottom: 30),
          height:80 ,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(10),
            color: Colors.white),
           child: Row(
            children: [
              Container(
                height:65,
                width: MediaQuery.of(context).size.width/4,
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(10),
            image:DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/truck.png')) ,
            ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                            children: [
                              Icon(Icons.location_on, size: 16,color: Colors.red,),
                              SizedBox(width: 5,),
                              Text('Texas, Interstate 105 ...',style:
                                TextStyle(
                                color: Color.fromARGB(176, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                decoration: TextDecoration.none
                              ),)
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.calendar_month,size: 16, color: Colors.green,),
                              SizedBox(width: 5,),
                              Text('Jan 25 2024',style:
                                TextStyle(
                                color: Color.fromARGB(176, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                decoration: TextDecoration.none
                              ),)
                            ],
                          ),
                             Row(
                                children: [
                                  Icon(Icons.lock_clock, size: 16, color: Colors.orange,),
                                  SizedBox(width: 5,),
                                  Text('08:24 pm',style:
                                    TextStyle(
                                    color: Color.fromARGB(176, 0, 0, 0),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    decoration: TextDecoration.none
                                  ),),
                                   
                                ],
                              ),
                
                  ],
                ),
              ) ],
           ),
          )
            ],
          ),
        ),
       ],
    ),
      
      ])
    );
  }
}