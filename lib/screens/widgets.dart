
import 'dart:ui';

import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String desc;

  TaskCard({this.title, this.desc});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
    
      padding: EdgeInsets.symmetric(
        horizontal:24,
        vertical:32
      ),
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius:BorderRadius.circular(20)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: [
          Text(
           title ?? "(Unnamed Task)",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold
            ),
          ),
       
      Padding(
        padding: EdgeInsets.only(
          top: 15
        ),
        child: Text(
          desc ?? "No Description Added",
          style: TextStyle(
            fontSize: 16,
            color:Color(0xff3c2a92),
            height: 1.5
          ),
        ),
      )
       ],
      ),
    );
  }
}

class TodoWidget extends StatelessWidget {
 final String activity;
final bool isChecked;
TodoWidget(
  {this.activity,@required this.isChecked}
);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 5.0,
      ),
      child: Row(
        children: [
          Container(
            width: 20,
            height: 20,
            margin: EdgeInsets.only(
              right:12
            ),
            decoration: BoxDecoration(
              color:isChecked?Color(0xff7349fe):Colors.transparent,
              borderRadius:BorderRadius.circular(5),
              border: isChecked? null:Border.all(
                color:Colors.black
              )
            ),
            child:
            Image(
              image: AssetImage('assets/images/check_icon.png')
            )
          ),
          Text(
            activity ?? "{Unnamed ToDo}",
          style: TextStyle(
            color: isChecked?Color(0xff211551):Color(0xff868290),
            fontSize:16, fontWeight:isChecked? FontWeight.bold:FontWeight.w500
          ),)
        ],
      ),
    );
  }
}

class NoGlowBehaviour extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
    BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}