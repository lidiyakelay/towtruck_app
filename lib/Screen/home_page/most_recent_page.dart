import 'package:flutter/material.dart';

class MostRecentPage extends StatefulWidget {
  const MostRecentPage({super.key});

  @override
  State<MostRecentPage> createState() => _MostRecentPageState();
}

class _MostRecentPageState extends State<MostRecentPage> {
   var currPageValue =0.0;
  double scaleFactor= 0.8;
  double height = 150;
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
          
         Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
             
            ),
            child: PageView.builder(
                    controller: pageController,
                    itemCount: 5,
                    itemBuilder: (context, Position){
                      return _buildPageItem(Position);
                    }),) ,
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

   Widget _buildPageItem(int index){
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
        GestureDetector(

          onTap: (){
   
    },
          child: Align(
          alignment: Alignment.topCenter,
            child: Column(
              children: [
                Container(
                height:130,
                margin: EdgeInsets.only( right:20 ),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                          30
                        ),
                    color: index.isEven?Color(0XFF69c5df):Color(0XFF9492cc),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image:AssetImage('assets/images/truck.png'),
                    )
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
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(Icons.calendar_month,size: 18, color: Colors.green,),
                            SizedBox(width: 5,),
                            Text('Jan 25 2024',style:
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
                                Text('08:24 pm',style:
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
        ),
        
        ],
      ),
    );

  }
}