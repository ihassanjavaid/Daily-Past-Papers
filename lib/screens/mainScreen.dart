import 'package:flutter/material.dart';
import 'package:dailypastpapers/components/constants.dart';

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
              accountName: Text('Daily Past Papers', style: kSideHeader),
              accountEmail: Text('By Saif'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT41KuC6cpqTR5hUyO_qjNn0Ph7w73DFc8agiNslBMfDrhiQbNA&usqp=CAU'),
              ),
            ),
            ListTile(
              title: Text('Home'),
            ),
            ksideBarDiv,
            ListTile(
              title: Text(
                'Papers',
                style: kSideBarHeading,
              ),
            ),
            ListTile(
                title: Text(
              'Matric',
              style: kSideBarPapers,
            )),
            ListTile(
                title: Text(
              'F.A/F.Sc.',
              style: kSideBarPapers,
            )),
            ListTile(
                title: Text(
              'Bachelors',
              style: kSideBarPapers,
            )),
            ListTile(
                title: Text(
              'MS IT',
              style: kSideBarPapers,
            )),
            ksideBarDiv,
            ListTile(
              title: Text('Terms & Conditions'),
            ),
            ListTile(
              title: Text('Privacy Policy'),
            ),
            ListTile(
              title: Text('About Us'),
            ),
            ListTile(
              title: Text('Contact Us'),
            ),
          ],
        ),
      ),
      /*body: Center(
      ),*/
    );
  }
}
