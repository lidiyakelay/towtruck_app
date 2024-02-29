import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:towtruck_app/Screen/home_page/most_recent_page.dart';
import 'package:towtruck_app/Screen/home_page/near_area_page.dart';
import 'package:towtruck_app/controllers/auth_controller.dart';
import 'package:towtruck_app/controllers/feed_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

    Future<void> _loadResource() async   {
    await Get.find<FeedController>().getFeedList();}
    
  @override
  Widget build(BuildContext context) {
    return     
    RefreshIndicator(
      onRefresh: 
        _loadResource,
      child: Scaffold(
        backgroundColor: Color(0XFFDADADA),
        body: Column(
          children: [
            Container(
              child: Stack(
                        children: [
                          Container(
                             height: 100,
                             color: Colors.black,
                          ),
                             Container(
                        height: 210,
                        margin: EdgeInsets.only(top: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/truck2.png'))
                  
                        ),
                      ),
                      Container(
                        height: 210,
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
                                Icon(Icons.location_on, color: Colors.amber,size:20),
                                SizedBox(width: 5,),
                                Text('Alaska', style:
                                TextStyle(
                                  color: Color.fromARGB(235, 237, 237, 237),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  decoration: TextDecoration.none
                                ),)
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 30),
                              width: MediaQuery.of(context).size.width/2,
                                child: Text('Hello! Jane Doe. Tell us where you are',
                              style:
                                TextStyle(
                                  color: Color.fromARGB(235, 237, 237, 237),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  decoration: TextDecoration.none
                                ),
                                textAlign: TextAlign.start,),
                            
                            ),
                             Padding(  
                            padding: EdgeInsets.only(left:30, right: 30, top: 10),  
                            child: TextField(  
                              style: TextStyle(fontSize: 12),
                              cursorColor: Colors.grey,
                              obscureText: true,  
                              decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(top: 2, bottom: 2, left: 5, right: 5),
                                filled: true,
                                fillColor: Color.fromARGB(63, 255, 255, 255),  
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(width: 1, color: const Color.fromARGB(0, 158, 158, 158)), ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              borderSide: BorderSide(width: 1, color: Colors.grey), ),
                                border: OutlineInputBorder(),  
                                labelText: 'Search by place',  
                                prefixIcon: Icon(Icons.search, color: Colors.amber,),
                                 labelStyle: TextStyle(
                                  fontSize: 14,
                               color: Color.fromARGB(207, 255, 255, 255),  ),
                              ),  
                            ),  
                          ),
                          ],
                        ),
                      )
                        ],
                      ),
            ),
          
              Expanded(child: SingleChildScrollView(
              child: Column(
                children: [
                  //MostRecentPage(),
                  NearAreaPage(),
                   
                ],
              ),
            )),
          ],
        ),
      ),
    );
  }
}

 
