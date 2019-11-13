import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  String mText = "Press Some Icon";
  String mTitle = "AppBar Tutorial";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = new TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          toolbarOpacity: 0.5,
          elevation: 30.00,
          backgroundColor: Colors.amber[200].withOpacity(0.5),
          centerTitle: true,
          primary: true,
          title: new Text(mTitle),
          leading: new IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                setState(() {
                  mText = "Home Pressed";
                  mTitle = "AppBar Tutorial";
                });
              }),
          actions: <Widget>[
            new IconButton(
                icon: Icon(Icons.refresh),
                onPressed: () {
                  setState(() {
                    mText = "Refresh Pressed";
                    mTitle = "Tutorial..." + " " + mText;
                  });
                }),
            new IconButton(
                icon: Icon(Icons.share),
                onPressed: () {
                  setState(() {
                    mText = "Share Pressed";
                    mTitle = "Tutorial..." + " " + mText;
                  });
                }),
          ],
          bottom: new TabBar(
              controller: _tabController,
              tabs: <Widget>[
                new Tab(icon: new Icon(Icons.print)),
                new Tab(icon: new Icon(Icons.people)),
                new Tab(icon: new Icon(Icons.settings)),
              ]),
        ),
        body: new TabBarView(
            controller: _tabController,
            children: <Widget>[
              new Center(child: Text("welcome 1"),),
              new Center(child: Text("welcome 2"),),
              new Center(child: Text("welcome 3"),),
            ]),
      bottomNavigationBar: new Material(
        color: Colors.amber[500],
        child: new TabBar(
            controller: _tabController,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.print)),
              new Tab(icon: new Icon(Icons.people)),
              new Tab(icon: new Icon(Icons.settings)),
            ]),
      ),),
    );
  }
}
