import 'package:flutter/material.dart';
import 'package:dailypastpapers/utilities/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          'Daily Past Papers',
          overflow: TextOverflow.clip,
          maxLines: 1,
          style: kAppBarText,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text('Daily Past Papers', style: kSideHeader),
              accountEmail: Text('By Saif', style: kSideHeaderSubText),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.grey,
                backgroundImage: NetworkImage(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT41KuC6cpqTR5hUyO_qjNn0Ph7w73DFc8agiNslBMfDrhiQbNA&usqp=CAU'),
              ),
            ),
            ListTile(
              title: Text(
                'Home',
                style: kSideBarNormal,
              ),
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
              title: Text(
                'Terms & Conditions',
                style: kSideBarNormal,
              ),
            ),
            ListTile(
              title: Text(
                'Privacy Policy',
                style: kSideBarNormal,
              ),
            ),
            ListTile(
              title: Text(
                'About Us',
                style: kSideBarNormal,
              ),
            ),
            ListTile(
              title: Text(
                'Contact Us',
                style: kSideBarNormal,
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: WebView(
          initialUrl: 'https://www.dailypastpapers.xyz/',
          onWebViewCreated: (WebViewController webViewController) {
            _controller.complete(webViewController);
          },
        ),
      ),
    );
  }
}
