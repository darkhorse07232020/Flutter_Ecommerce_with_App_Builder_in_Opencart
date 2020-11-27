import 'package:flutter/material.dart';
import 'package:shop_app/helpers/colors.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/models/TokenData.dart';
import 'package:shop_app/screens/home/components/home_app_bar.dart';
import 'package:shop_app/screens/home/components/nav_bar.dart';
import 'package:shop_app/screens/home/loading_screen.dart';

import 'components/body.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = "/home";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> initialize() async {
    if (isLoaded) return;
    await getAPItoken();
    await getHomeData();
    isLoaded = true;
  }

  @override
  void initState() {
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
      drawer: NavBar(),
      body: Body(),
    );
  }
}
