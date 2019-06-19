import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'dart:io';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Get Location',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: HomePage(),
    );
  }
}
class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class HomePage extends StatefulWidget {
  final drawerItems = [
    new DrawerItem("Panic Alert", Icons.add_alert),
    new DrawerItem("Report", Icons.add_location),
    new DrawerItem("Instruction", Icons.filter_frames),
    new DrawerItem("About", Icons.info),
    new DrawerItem("Exit", Icons.exit_to_app)

  ];
  @override
  State<StatefulWidget> createState() {
    return new HomePageState();
  }
}
class HomePageState extends State<HomePage> {
  int _selectedDrawerIndex = 0;

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new FirstFragment();
      case 1:
        return new SecondFragment();
      case 2:
        return new ThirdFragment();
      case 3:
        return new FourthFragment();
      case 4:
        return new FifthFragment();
      default:
        return new Text("Error");
    }
  }

  _onSelectItem(int index) {
    setState(() => _selectedDrawerIndex = index);
    Navigator.of(context).pop(); // close the drawer
  }

  @override
  Widget build(BuildContext context) {
    var drawerOptions = <Widget>[];
    for (var i = 0; i < widget.drawerItems.length; i++) {
      var d = widget.drawerItems[i];
      drawerOptions.add(
          new ListTile(
            leading: new Icon(d.icon),
            title: new Text(d.title),
            selected: i == _selectedDrawerIndex,
            onTap: () => _onSelectItem(i),
          )
      );
    }

    return new Scaffold(
      appBar: new AppBar(
        // here we display the title corresponding to the fragment
        // you can instead choose to have a static title
        title: new Text(widget.drawerItems[_selectedDrawerIndex].title),
      ),
      drawer: new Drawer(
        child: new Column(
          children: <Widget>[
            new UserAccountsDrawerHeader(
                accountName: new Text("Username goes here"), accountEmail: null),
            new Column(children: drawerOptions)
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedDrawerIndex),
    );
  }
}

class GetLocationPage extends StatefulWidget {


  @override
  _GetLocationPageState createState() => _GetLocationPageState();
}

class _GetLocationPageState extends State<GetLocationPage> {
  var location = new Location();
  Map<String, double> userLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            userLocation == null
                ? CircularProgressIndicator()
                : Text("Location:" +
                    userLocation["latitude"].toString() +
                    " " +
                    userLocation["longitude"].toString()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                onPressed: () {
                  _getLocation().then((value) {
                    setState(() {
                      userLocation = value;
                    });
                  });
                },
                color: Colors.red,
                child: Text(
                  "Click to get location",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<Map<String, double>> _getLocation() async {
    var currentLocation = <String, double>{};
    try {
      currentLocation = await location.getLocation();
    } catch (e) {
      currentLocation = null;
    }
    return currentLocation;
  }

}
class FirstFragment extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return new Center(
      child: GetLocationPage(),
    );
  }
}

class SecondFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(

          margin: EdgeInsets.all(15.0),
          padding: EdgeInsets.all(10.0),
          alignment: Alignment.topLeft,
          width: 410,
          height: 45,

          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(),
          ),
          child: Text("Description of incident", style: TextStyle(fontSize: 15)),


        ),
        Center(
          child: new TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Enter a description of the issue: ',
            ),
          ),
      ),
      ],
    );
   //  TODO: implement build
  }

}


class ThirdFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Instruccions.',
          style: TextStyle(
            fontSize: 40,
          ),
        ),
        Text(
          "Step 1, If you are in trouble the only thing you have to do is PRESS THE BUTTON to ask for help and the button will send an alert to someone in the faculty displaying your real location and your information, that way you will receive help as soon as possible.",
          style: TextStyle(
            fontSize: 25.0,
          ),
        ),
      ],
    );
  }
}
class FourthFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'About.',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          'Eyes on the street is a crowdsourcing application where users report crime, perceived danger, and suspicious activities to enhance their daily commuting alternatives.',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        Text(
          'Version 2.0',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Developers:',
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Text(
          'Adrian Gomez Rodriguez',
          style: TextStyle(
            fontSize: 16,

          ),
        ),
        Text(
          'Carlos Chavez',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Emiliano Ruiz',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Itzel Rivas',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
        Text(
          'Sandra Barba',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class FifthFragment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: ()=> exit(0),
        tooltip: 'Close app',
        child: new Icon(Icons.close),
      ),
    );
  }
  }


