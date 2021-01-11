import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

import './about_app.dart';

class MorePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String moreText;
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.dstATop),
          image: AssetImage(
            'assets/images/fola.jpeg',
          ),
        ),
      ),
      child: SingleChildScrollView( 
              child: Column(
          children: <Widget>[
            AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
            ),
            Row(
              children: <Widget>[
                Divider(
                  color: Colors.black,
                  thickness: 2,
                ),
                Text(
                  'Contact Developer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
                Divider(color: Colors.black, thickness: 2),
              ],
            ),
            ListTile(
              onTap: () {},
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/whatsapp1.png'),
              ),
              title: Text('Contact us via Instagram'),
              subtitle: Text(
                '@intellecttechnologies',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black45,
                ),
              ),
              trailing: Icon(Icons.send),
            ),
            ListTile(
              onTap: () {},
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/whatsapp1.png'),
              ),
              title: Text('Contact us via Twitter'),
              subtitle: Text(
                '@intellecttechnologies',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black45,
                ),
              ),
              trailing: Icon(Icons.send),
            ),
            ListTile(
              onTap: () async {
                final url = 'http://Wa.me/234${07068363489}';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch!';
                }
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/whatsapp1.png'),
              ),
              title: Text('Contact us via WhatsApp'),
              subtitle: Text(
                '07068363489, 08129190909',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black45,
                ),
              ),
              trailing: Icon(Icons.send),
            ),
            ListTile(
              onTap: () {},
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/whatsapp1.png'),
              ),
              title: Text('Contact us via Telegram'),
              subtitle: Text(
                '07068363489, 08129190909',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black45,
                ),
              ),
              trailing: Icon(Icons.send),
            ),
            ListTile(
              onTap: () async {
                final url = 'tel:${07068363489}';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch!';
                }
              },
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/images/whatsapp1.png'),
              ),
              title: Text('Contact us via Call'),
              subtitle: Text(
                '07068363489, 08129190909',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black45,
                ),
              ),
              trailing: Icon(Icons.send),
            ),
            ListTile(
              onTap: () async {
                final url = 'sms:${07068363489}';
                if (await canLaunch(url)) {
                  await launch(url);
                } else {
                  throw 'Could not launch!';
                }
              },
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.message, color: Colors.blue, size: 26),
              ),
              title: Text('Contact us via message'),
              subtitle: Text(
                '07068363489, 08129190909',
                style: TextStyle(
                  decoration: TextDecoration.underline,
                  color: Colors.black45,
                ),
              ),
              trailing: Icon(Icons.send),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AboutApp()));
              },
              leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.info,
                  size: 30,
                  color: Colors.black,
                ),
              ),
              title: Text('About \'Easy Rocord\''),
              subtitle: Text('Easy record is an.............'),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              child: FlatButton(
                  textColor: Colors.white,
                  color: Colors.red,
                  child: Text(
                    'EXIT',
                    style: TextStyle(fontSize: 18),
                  ),
                  onPressed: () {
                    SystemNavigator.pop();
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
