import 'package:expance_app/Profile_page.dart';
import 'package:flutter/material.dart';

class Home_page extends StatefulWidget {
  const Home_page({super.key});

  @override
  State<Home_page> createState() => _Home_pageState();
}

class _Home_pageState extends State<Home_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Hoşgeldin Talha" ,style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,),),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
              child: CircleAvatar(
                radius: 25,
              ),
            ),
          ),

        ],
      ),
      body: SafeArea(
        child: Row(
          children: [
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 4,
                        width: 40,
                        color: Colors.grey,
                        margin: EdgeInsets.only(bottom: 16),
                      ),
                   /*  Row(
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         CircleAvatar(
                           radius: 25,
                         ),
                         Text("data"),
                       ],
                     ),*/

                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                        ),
                        title: Text("Elektrik", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 15,),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                        ),
                        title: Text("Elektrik", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 15,),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                        ),
                        title: Text("Elektrik", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 15,),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                        ),
                        title: Text("Elektrik", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 15,),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                        ),
                        title: Text("Elektrik", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 15,),
                      ListTile(
                        leading: CircleAvatar(
                          radius: 25,
                        ),
                        title: Text("Elektrik", style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      //SizedBox(height: 400, width: 355,),
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
