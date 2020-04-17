import 'package:flutter/material.dart';
import 'package:dailypastpapers/utilities/constants.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:async';
import 'package:url_launcher/url_launcher.dart';

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
        backgroundColor: Colors.grey,
        title: Text(
          'Daily Past Papers',
          overflow: TextOverflow.clip,
          maxLines: 1,
          style: kAppBarText,
        ),
        actions: <Widget>[
          NavigationControls(_controller.future),
        ],
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
              onTap: () {
                // TODO
              },
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

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: true),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () => navigate(context, controller, goBack: false),
            ),
          ],
        );
      },
    );
  }

  navigate(BuildContext context, WebViewController controller,
      {bool goBack: false}) async {
    bool canNavigate =
    goBack ? await controller.canGoBack() : await controller.canGoForward();
    if (canNavigate) {
      goBack ? controller.goBack() : controller.goForward();
    } else {
      Scaffold.of(context).showSnackBar(
        SnackBar(
            content: Text("No ${goBack ? 'back' : 'forward'} history item")),
      );
    }
  }
}
