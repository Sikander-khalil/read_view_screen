import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pratice_app/yt_data.dart';

class ShortsScreen extends StatefulWidget {
  const ShortsScreen({super.key});

  @override
  State<ShortsScreen> createState() => _ShortsScreenState();
}

class _ShortsScreenState extends State<ShortsScreen> {
  YTData ytData = YTData();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        body: ListView.builder(
          itemCount: ytData.shortsList.length,

            itemBuilder: (context, index){

            return ShortsList(

              name: ytData.shortsList.values.elementAt(index).elementAt(0),
              profilePic : ytData.shortsList.values.elementAt(index).elementAt(1),
              vid: ytData.shortsList.values.elementAt(index).elementAt(2),
              caption: ytData.shortsList.values.elementAt(index).elementAt(3),
              likes: ytData.shortsList.values.elementAt(index).elementAt(4),
              comments: ytData.shortsList.values.elementAt(index).elementAt(5),

            );







        }),


      ),
    );
  }
}

class ShortsList extends StatefulWidget {
  final String name;
  final String profilePic;
  final String vid;
  final String caption;
  final String likes;
  final String comments;


  const ShortsList({super.key, required this.name, required this.profilePic, required this.vid, required this.caption, required this.likes,
      required this.comments});

  @override
  State<ShortsList> createState() => _ShortsListState();
}

class _ShortsListState extends State<ShortsList> {
  bool isLike = false;
  bool iSDislike = false;

  @override
  Widget build(BuildContext context) {

    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(

          width: w,
          height: h,
          child: Image.asset(widget.vid,fit: BoxFit.cover,),


        ),
        Padding(padding: EdgeInsets.only(top: 25.0, left: 15.0, right: 15,bottom: 8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  GestureDetector(

                    onTap: (){


                      Navigator.pop(context);

                    },
                    child: Icon(Icons.arrow_back_rounded, color: Colors.white, size: 32,),
                  ),
                  Icon(Icons.camera_alt, color: Colors.white, size: 32,)
                ],
              ),
              SizedBox(height: h* 0.275,),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [

                  Container(

                    child: Icon(CupertinoIcons.ellipsis, color: Colors.white, size: 30,),

                  )

                ],
              ),
              SizedBox(height: 28,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [

                  GestureDetector(
                    onTap: (){

                      setState(() {

                        isLike = !isLike;
                      });

                    },
                    child: Container(

                      child: Column(
                        children: [
                          Icon(Icons.thumb_up, color: isLike? Colors.blue : Colors.white, size: 30,),
                          SizedBox(height: 10,),
                          Text(widget.likes,style: TextStyle(color: Colors.white, fontSize: 16),),

                        ],
                      ),

                    ),
                  )

                ],
              ),
              SizedBox(height: 28,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [

                  GestureDetector(
                    onTap: (){

                      setState(() {

                        iSDislike = !iSDislike;
                      });

                    },
                    child: Container(

                      child: Column(
                        children: [
                          Icon(Icons.thumb_down, color: iSDislike? Colors.blue : Colors.white, size: 30,),
                          SizedBox(height: 10,),
                          Text("Dislike",style: TextStyle(color: Colors.white, fontSize: 16),),

                        ],
                      ),

                    ),
                  )

                ],
              ),
              SizedBox(height: 28,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [

                  GestureDetector(
                    onTap: (){



                    },
                    child: Container(

                      child: Column(
                        children: [
                          Icon(Icons.message_rounded, color:  Colors.white, size: 30,),
                          SizedBox(height: 10,),
                          Text(widget.comments,style: TextStyle(color: Colors.white, fontSize: 16),),

                        ],
                      ),

                    ),
                  )

                ],
              ),
              SizedBox(height: 28,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,

                children: [

                  GestureDetector(
                    onTap: (){



                    },
                    child: Container(

                      child: Column(
                        children: [
                          Icon(CupertinoIcons.arrowshape_turn_up_right_fill, color:  Colors.white, size: 30,),
                          SizedBox(height: 10,),
                          Text("Share",style: TextStyle(color: Colors.white, fontSize: 16),),

                        ],
                      ),

                    ),
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [


                  Container(

                    width: w * 0.6,
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [

                        Text(widget.caption,style: TextStyle(color: Colors.white, fontSize: 18),),

                        SizedBox(height: 10,),

                        Row(

                          children: [
                            CircleAvatar(radius: 15,
                            backgroundImage: AssetImage(widget.profilePic),
                            ),
                            SizedBox(width: 8,),
                            Text(widget.name,style: TextStyle(color: Colors.white,fontSize: 16),)
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(

                    height: 36,
                    width: 36,
                    color: Colors.white,
                    child: Stack(children: [

                      Center(child: Container(

                        height: 32,
                        width: 32,
                        child: Image.asset('images/music_bar.gif', fit: BoxFit.cover,),

                      ),)
                    ],),
                  )

              ],)
            ],
          ),


        )
      ],
    );
  }
}

