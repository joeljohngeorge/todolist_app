import 'package:flutter/material.dart';
import 'package:todolist/databasehelper.dart';
import 'package:todolist/screens/taskpage.dart';
import 'package:todolist/screens/widgets.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
 DatabaseHelper _dbhelper=DatabaseHelper();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(24.0),
        color: Color(0xfff6f6f6),
        child: Stack(children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  margin: EdgeInsets.only(bottom: 32),
                  child: Image(image: AssetImage('assets/images/logo.png'))),
              Expanded(child: FutureBuilder(
                initialData: [],
                builder: (context,snapshot){
                return ScrollConfiguration(
                  behavior: NoGlowBehaviour(),
                                  child: ListView.builder(
                    itemBuilder:(context,index){
                      return GestureDetector(
                         onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Taskpage(
                                        task: snapshot.data[index],
                                      ),
                                    ),
                                  ).then(
                                    (value) {
                                      setState(() {});
                                    },
                                  );
                                },
                                              child: TaskCard(
                          title:snapshot.data[index].title,
                          desc: snapshot.data[index].description,
                        ),
                      );
                    },
                    itemCount:snapshot.data.length,
                  ),
                );
              },
              future: _dbhelper.getTasks(),)
              )],
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: (){
                Navigator.push(context, 
                MaterialPageRoute(
                  builder: (context)=>Taskpage(
                    task: null,
                  )
                )).then(
                                    (value) {
                                      setState(() {});
                
              },);},

                          child: Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0xff7349fe),
                    borderRadius: BorderRadius.circular(20)),
                child: Image(image: AssetImage('assets/images/add_icon.png')),
              ),
            ),
          )
        ]),
      ),
    ));
  }
}
