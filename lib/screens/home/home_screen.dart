import 'package:flutter/material.dart';
import 'package:shop_app/helpers/colors.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/screens/home/components/home_app_bar.dart';
import 'package:shop_app/screens/home/loading_screen.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // bool isLoaded;

  Future<void> initialize() async {
    await getHomeData();
  }

  @override
  void initState() {
    // isLoaded = false;
    // getHomeData().whenComplete(() {
    //   print(homeScreenVariable.titleBarLogoUrl);
    //   isLoaded = true;
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return HomePage();
        } else {
          return LoadingScreen();
        }
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: kBackgroundLightColor,
        ),
        backgroundColor: kBackgroundDarkColor,
        title: Text("ShopCart"),
      ),
      drawer: leftNavBar(),
      body: Body(),
    );
  }

  Widget leftNavBar() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(vertical: 70.0, horizontal: 30.0),
        children: <Widget>[
          SwitchListTile(
            title: const Text('Darkmode'),
            value: true,
            onChanged: (value) {},
            activeTrackColor: Colors.lightBlueAccent,
            activeColor: Colors.blue,
          ),
          ExpansionTile(
            title: Text("Languages"),
            children: <Widget>[],
          ),
        ],
      ),
    );
  }
}
