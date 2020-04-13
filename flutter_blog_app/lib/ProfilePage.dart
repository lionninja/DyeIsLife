import 'package:flutter/material.dart';
import 'package:flutter_blog_app/Authentication.dart';
import 'infoPage.dart';
import 'HomePage.dart';
import 'EditProfile.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({
    this.auth,
    this.onSignedOut,
  });
  final AuthImplementation auth;
  final VoidCallback onSignedOut;

  @override
  State<StatefulWidget> createState() {
    return _ProfilePageState();
  }
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
       appBar: new AppBar(
          title: new Text("My Profile"),
          automaticallyImplyLeading: false,
          actions: <Widget>[
            // action button
            FlatButton(
            child: Text('Edit Profile'),
            textColor: Colors.white,
            onPressed: ( )
                  {
                    Navigator.push
                    (
                      context, 
                      MaterialPageRoute(builder: (context)
                      {
                          return new EditProfilePage(); 
                      }),
                    );

                  },
          )
          ]),
      
      body: 
      new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Text(
                "@yosfanpage",
                style: Theme.of(context).textTheme.subhead,
                textAlign: TextAlign.center,
              ),
              new Text(
                "Seattle, WA",
                style: Theme.of(context).textTheme.subtitle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          SizedBox(
            height: 3.0,
          ),
          new Image.network('https://www.nwchess.com/articles/events/2011/images/WJOR_2011_Yos.JPG', fit: BoxFit.fitWidth),
          SizedBox(
            height: 5.0,
          ),
          new Text(
            "This is where the user's bio will go",
            style: Theme.of(context).textTheme.subhead,
            textAlign: TextAlign.center,
          ), 
        ],
      ),
    ),
      //  new CircleAvatar(
      //     backgroundColor: Colors.transparent,
      //     radius: 50.0,
      //     child: Image.asset('images/app_logo.jpeg'),
      //   ),
        // IconButton(
        // icon: new Icon(Icons.exit_to_app),
        // iconSize: 50,
        // color: Colors.teal,
        // onPressed: logoutUser, //Add logoutuser later on
      bottomNavigationBar: new BottomAppBar(
        color: Colors.teal,
        
        child: new Container(
            margin: const EdgeInsets.only(left: 70.0, right: 70.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                new IconButton(
                  icon: new Image.asset('images/dyeicon.png'),
                  iconSize: 50,
                  color: Colors.white,
                  onPressed: ( )
                  {
                    Navigator.push
                    (
                      context, 
                      MaterialPageRoute(builder: (context)
                      {
                          return new InfoPage(); 
                      }),
                    );

                  },
                ),
                new IconButton(
                  icon: new Icon(Icons.forum),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: ( )
                  {
                    Navigator.push
                    (
                      context, 
                      MaterialPageRoute(builder: (context)
                      {
                          return new HomePage(); 
                      }),
                    );

                  },
                ),
                new IconButton(
                  icon: new Icon(Icons.person),
                  iconSize: 30,
                  color: Colors.white,
                  onPressed: ( )
                  {
                    Navigator.push
                    (
                      context, 
                      MaterialPageRoute(builder: (context)
                      {
                          return new ProfilePage(); 
                      }),
                    );

                  },
                ),
 
              ],
            )),
      ),
      
      
    );
  }
  void logoutUser() async {
    try {
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e.toString());
    }
  }
}
