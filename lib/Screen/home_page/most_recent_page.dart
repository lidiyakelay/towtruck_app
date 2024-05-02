import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'package:towtruck_app/models/feed_model.dart';
import 'package:get/route_manager.dart';
import 'package:towtruck_app/Screen/detail_view_page/detail_view_page.dart';
import 'package:towtruck_app/controllers/feed_controller.dart';

class MostRecentPage extends StatefulWidget {
  const MostRecentPage({super.key});

  @override
  State<MostRecentPage> createState() => _MostRecentPageState();
}

class _MostRecentPageState extends State<MostRecentPage> {
   var currPageValue =0.0;
  double scaleFactor= 0.8;
  double height = 150;
  String formattedDate="";
    String formattedTime="";



  // Parse the timestamp string
  



  String formatDate(DateTime dateTime) {
  // Format the date part of the DateTime object
  String formattedDate = "${dateTime.year}-${_twoDigits(dateTime.month)}-${_twoDigits(dateTime.day)}";
  return formattedDate;
}

String formatTime(DateTime dateTime) {
  // Format the time part of the DateTime object
  String formattedTime = "${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)}:${_twoDigits(dateTime.second)}.${dateTime.millisecond}";
  return formattedTime;
}

String _twoDigits(int n) {
  // Add leading zero if the number is less than 10
  return n.toString().padLeft(2, '0');
}

  @override
 void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        currPageValue= pageController.page!;
      });

    });

  }
  @override
  void dispose() {
   pageController.dispose();
   super.dispose();
  }
  PageController pageController = PageController(viewportFraction: 0.85);
  @override
  Widget build(BuildContext context) {
    return  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        
          Container(
            margin:EdgeInsets.only(left: 30, right: 30, top: 10),
            child: Text('Most Recent Posts', style:
                    TextStyle(
                      color: Color.fromARGB(176, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      decoration: TextDecoration.none
                    ),),
      
          ),
          
         GetBuilder<FeedController>(
           builder: (feedController) {
             return feedController.isLoaded? feedController.feedList!=null? Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                 
                ),
                child: PageView.builder(
                        controller: pageController,
                        itemCount: feedController.feedList.length,
                        itemBuilder: (context, Position){
                          return _buildPageItem(Position,feedController.feedList[Position] );
                        }),):Center(child: CircularProgressIndicator( color:  Colors.amber,)): Center(child: CircularProgressIndicator( color:  Colors.amber,));
           }
         ) ,
        Container(
            margin:EdgeInsets.only(left: 30, right: 30, bottom: 10, top: 10),
            child: Text('Near Your Area', style:
                    TextStyle(
                      color: Color.fromARGB(176, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      decoration: TextDecoration.none
                    ),),
      
          ),
          
        
          
       
        ],
      )
        
        
      

    ;
  }

   Widget _buildPageItem(int index, FeedBody feedBody){
    DateTime timestamp = DateTime.parse(feedBody.timestamp!);

  // Get date and time separately
   formattedDate = formatDate(timestamp);
  formattedTime = formatTime(timestamp);
    Matrix4 matrix = new Matrix4.identity();
    if(index==currPageValue.floor()){
      var currScale= 1-(currPageValue-index)*(1-scaleFactor);
      var currTrans= height*(1-currScale)/2;
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
      //print("currScale 1 "+ currScale.toString());
    }
    else if(index==currPageValue.floor()+1)
    {
      var currScale= scaleFactor+(currPageValue-index+1)*(1-scaleFactor);
      var currTrans= height*(1-currScale)/2;
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
     // print("currScale 2 "+ currScale.toString());

    }
    else if(index==currPageValue.floor()-1)
    {
      var currScale= 1-(currPageValue-index)*(1-scaleFactor);
      var currTrans= height*(1-currScale)/2;
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
      // print("currScale 2 "+ currScale.toString());

    }
    else
    {
      var currScale= 0.8;
      var currTrans= height*(1-currScale)/2;
      matrix= Matrix4.diagonal3Values(1,currScale,1)..setTranslationRaw(0, currTrans, 0);
      // print("currScale 2 "+ currScale.toString());

    }

    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          Container(
           
                      height:200,
          margin: EdgeInsets.only( right:20 ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30
                  ), color: Colors.white,)
          ),
        Align(
        alignment: Alignment.topCenter,
          child: Column(
            children: [
              GestureDetector(
                
                child: feedBody.photoUrl==null?Container(
                height:130,
                margin: EdgeInsets.only( right:20 ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                          30
                        ),
                    color: index.isEven?Color(0XFF69c5df):Color(0XFF9492cc),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/truck.png'),
                    )
                ),
                      ):Container(
                height:130,
                margin: EdgeInsets.only( right:20 ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                          30
                        ),
                    color: index.isEven?Color.fromARGB(255, 46, 46, 46):Color.fromARGB(255, 200, 150, 0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(feedBody.photoUrl!),
                    )
                ),
                      ),
              ),
              Container(
                margin: EdgeInsets.only(top:2,left:0, right:20 ),
                padding: EdgeInsets.only(left: 15,right: 15),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.location_on, size:18,color: Colors.red,),
                          SizedBox(width: 5,),
                          Text(feedBody.location!.latitude.toString()+", "+feedBody.location!.longitude.toString(),style:
                            TextStyle(
                            color: Color.fromARGB(176, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          ),)
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(Icons.calendar_month,size: 18, color: Colors.green,),
                          SizedBox(width: 5,),
                          Text(formattedDate,style:
                            TextStyle(
                            color: Color.fromARGB(176, 0, 0, 0),
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            decoration: TextDecoration.none
                          ),)
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                            children: [
                              Icon(Icons.lock_clock,size: 18, color: Colors.orange,),
                              SizedBox(width: 5,),
                              Text(formattedTime,style:
                                TextStyle(
                                color: Color.fromARGB(176, 0, 0, 0),
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                                decoration: TextDecoration.none
                              ),),
                               
                            ],
                          ),
                    SizedBox(height: 25,)
                    ],
                  )
                ]) ,
              )
            ],
          ),
        ),
        
        ],
      ),
    );

  }
}