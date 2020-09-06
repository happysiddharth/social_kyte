import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:provider/provider.dart';
import 'package:socialkyte/Widget/ChatWidget.dart';
import 'package:socialkyte/provider/followersProvider.dart';
import 'package:socialkyte/provider/followingProvider.dart';
import 'package:socialkyte/provider/user_data.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Provider.of<UserData>(context).fetch("id");
  }

  @override
  Widget build(BuildContext context) {
    final profileData = Provider.of<UserData>(context);
    final followerData = Provider.of<FollowersProvider>(context);
    final followingData = Provider.of<FolloweringProvider>(context);
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    final String imgUrl =
        'https://pixel.nymag.com/imgs/daily/selectall/2017/12/26/26-eric-schmidt.w700.h700.jpg';
    void _showDialogueFollowers() async {
      return await showDialog(
        context: context,
        child: AlertDialog(
          content: Container(
            child: ListView.builder(
              itemBuilder: (c, index) {
                return Column(
                  children: <Widget>[
                    ListTile(
                      leading: new Hero(
                        tag: index,
                        child: new CircleAvatar(
                          backgroundColor: Color(0xffe46b10),
                          backgroundImage: new NetworkImage(
                            followerData.item[index].profilePic,
                          ),
                        ),
                      ),
                      title: Text(
                        followerData.item[index].followerUserName,
                      ),
                      subtitle: Text(
                        followerData.item[index].timeOfFollower
                            .toIso8601String(),
                      ),
                    ),
                    Divider(),
                  ],
                );
              },
              itemCount: followerData.item.length,
            ),
          ),
        ),
      );
    }

    void _showDialogueFollowing() async {
      return await showDialog(
          context: context,
          child: AlertDialog(
            content: Container(
              child: ListView.builder(
                itemBuilder: (c, index) {
                  return Column(
                    children: <Widget>[
                      ListTile(
                        leading: new Hero(
                          tag: index,
                          child: new CircleAvatar(
                            backgroundColor: Color(0xffe46b10),
                            backgroundImage: new NetworkImage(
                                followingData.item[index].profilePic),
                          ),
                        ),
                        title: Text(followingData.item[index].followerUserName),
                        subtitle: Text(followingData.item[index].timeOfFollower
                            .toIso8601String()),
                      ),
                      Divider(),
                    ],
                  );
                },
                itemCount: followingData.item.length,
              ),
            ),
          ));
    }

    return new Stack(
      children: <Widget>[
        new Container(
          //color: Colors.blue,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2,
              ),
            ],
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xfffbb448),
                Color(0xffe46b10),
              ],
            ),
          ),
        ),
        new Image.network(
          imgUrl,
          fit: BoxFit.fill,
        ),
        new BackdropFilter(
          filter: ui.ImageFilter.blur(
            sigmaX: 6.0,
            sigmaY: 6.0,
          ),
          child: new Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2,
                ),
              ],
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xfffbb448),
                  Color(0xffe46b10),
                ],
              ),
            ),
          ),
        ),
        new Scaffold(
          appBar: new AppBar(
            title: new Text(profileData.user.name),
            centerTitle: false,
            elevation: 0.0,
            backgroundColor: Colors.transparent,
          ),
          drawer: Drawer(
            child: ListView(
              children: <Widget>[
                DrawerHeader(
                  margin: EdgeInsets.zero,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    color: Color(0xffdf8e33),
                  ),
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                          bottom: 12.0,
                          left: 16.0,
                          child: Text("Siddharth Kaushik",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.w500))),
                    ],
                  ),
                ),
                Divider(),
                FlatButton(
                  onPressed: () {
                    print("object");
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text("Log Out"),
                )
              ],
            ),
          ),
          backgroundColor: Colors.transparent,
          body: new Center(
            child: new Column(
              children: <Widget>[
                new SizedBox(
                  height: _height / 12,
                ),
                new CircleAvatar(
                  radius: _width < _height ? _width / 4 : _height / 4,
                  backgroundImage: NetworkImage(imgUrl),
                ),
                new SizedBox(
                  height: _height / 25.0,
                ),
                new Text(
                  profileData.user.name,
                  style: new TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: _width / 15,
                      color: Colors.white),
                ),
                new Padding(
                  padding: new EdgeInsets.only(
                      top: _height / 30, left: _width / 8, right: _width / 8),
                  child: new Text(
                    profileData.user.bio,
                    style: new TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: _width / 25,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                new Divider(
                  height: _height / 30,
                  color: Colors.white,
                ),
                new Row(
                  children: <Widget>[
                    rowCell(
                      followerData.item.length,
                      'FOLLOWERS',
                      _showDialogueFollowers,
                    ),
                    rowCell(
                      followingData.item.length,
                      'FOLLOWING',
                      _showDialogueFollowing,
                    ),
                  ],
                ),
                new Divider(
                  height: _height / 30,
                  color: Colors.white,
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Container(
                      color: Colors.white,
                      child: ChatWidget(),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget rowCell(int count, String type, _showDialogue) => new Expanded(
        child: InkWell(
          onTap: _showDialogue,
          child: new Column(
            children: <Widget>[
              new Text(
                '$count',
                style: new TextStyle(color: Colors.white),
              ),
              new Text(type,
                  style: new TextStyle(
                      color: Colors.white, fontWeight: FontWeight.normal))
            ],
          ),
        ),
      );
}
