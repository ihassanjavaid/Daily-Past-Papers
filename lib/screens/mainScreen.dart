import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Daily Past Papers',
          overflow: TextOverflow.clip,
          maxLines: 1,
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Daily Past Papers"),
              accountEmail: Text('By Saif'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage('https://png.pngtree.com/element_our/20190528/ourmid/pngtree-paper-icon-image_1131168.jpg'
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Home'
              ),
            ),
            ListTile(
              title: Text(
                  'Terms & Conditions'
              ),
            ),
            ListTile(
              title: Text(
                  'Privacy Policy'
              ),
            ),
            ListTile(
              title: Text(
                  'About Us'
              ),
            ),
            ListTile(
              title: Text(
                  'Contact Us'
              ),
            ),
          ],
        ),
      ),
      /*body: Center(
      ),*/
    );
  }
}
