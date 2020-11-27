import 'package:flutter/material.dart';
import 'package:shop_app/helpers/colors.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/models/TokenData.dart';
import 'package:shop_app/screens/home/components/home_app_bar.dart';
import 'package:shop_app/screens/home/components/nav_bar.dart';
import 'package:shop_app/screens/home/loading_screen.dart';

import 'pages/home.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HommeAppBar(),
      drawer: NavBar(),
      body: TabBarView(
        children: <Widget>[
          HomeTab(),
          page('the other one!'),
          page('the other one!'),
          page('the other one!'),
          page('headset is on?')
        ],
        controller: tabController,
      ),
      bottomNavigationBar: _bottomNavBar(),
    );
  }

  Widget _bottomNavBar() {
    return Material(
      color: kBackgroundDarkColor,
      child: TabBar(
        labelPadding: EdgeInsets.all(0),
        controller: tabController,
        tabs: <Widget>[
          Tab(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.home),
                Text('Home', style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
          Tab(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.widgets),
                Text('Categories', style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
          Tab(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.search),
                Text('Search', style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
          Tab(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.shopping_cart_outlined),
                Text('Cart', style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
          Tab(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.person_outline),
                Text('Login', style: TextStyle(fontSize: 11)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class page extends StatelessWidget {
  String title;
  page(this.title);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(title),
      ),
    );
  }
}
