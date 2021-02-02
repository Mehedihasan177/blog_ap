import 'package:blog_ap/pages/page_one.dart';
import 'package:blog_ap/pages/page_three.dart';
import 'package:blog_ap/pages/page_two.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _indexPage = 0;
  final pageOption = [
    ItemOne(),
    ItemTwo(),
    ItemThree(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Firebase Blog, this is new app'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: [

            Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      UserAccountsDrawerHeader(
              currentAccountPicture: Container(
            child: Column(
            children: [
        CircleAvatar(
          radius: 35.0,
          backgroundImage: AssetImage('images/hot.jpg'),
        ),
        ],
        ),
                ),
    accountName: Text('mehedi hasan'),
    accountEmail: Text('mdmehedihasan4051@gmail.com'),
    decoration: BoxDecoration(
    color: Colors.teal,
    ),
              ),
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemOne()));
              },
              title: Text('Pool Page',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold
              ),
              ),
              leading: Icon(Icons.poll, size: 30.0),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemTwo()));
              },
              title: Text('Home Page',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              leading: Icon(Icons.home, size: 30.0),
            ),
            ListTile(
              onTap: (){
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ItemThree()));
              },
              title: Text('Gallery One',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold
                ),
              ),
              leading: Icon(Icons.border_all, size: 30.0),
            ),
          ],
        ),
      ),
      body: pageOption[_indexPage],
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.teal,
        index: 0,
        items: [
          Icon(Icons.poll,size: 30.0),
          Icon(Icons.home,size: 30.0),
          Icon(Icons.border_all,size: 30.0),
        ],
        onTap: (int index){
          setState(() {
            _indexPage = index;
          });
        },
      ),
    );
  }
}
