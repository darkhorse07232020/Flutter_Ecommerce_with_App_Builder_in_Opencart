import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/models/TokenData.dart';
import 'package:shop_app/models/Variable.dart';
import 'package:shop_app/screens/main/loading_screen.dart';
import 'package:shop_app/screens/categories/categories.dart';
import 'package:shop_app/screens/search/search.dart';
import 'package:shop_app/screens/sign_in/sign_in_screen.dart';

import '../home/home.dart';

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
  int _currentTab = 0;

  List<Widget> _pages = [
    HomeTab(),
    CategoriesTab(),
    SearchTab(),
    SearchTab(),
    // CartScreen(),
    SignInScreen(),
  ];
  Widget _currentPage;

  @override
  void initState() {
    _currentTab = 0;
    _currentPage = HomeTab();
    super.initState();
  }

  void onTabTapped(int index) {
    setState(() {
      _currentTab = index;
      _currentPage = _pages[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _currentPage,
      bottomNavigationBar: _bottomNavBar(),
      backgroundColor: kBGColor,
    );
  }

  Widget _bottomNavBar() {
    return BottomNavigationBar(
      backgroundColor: kPrimaryColor,
      type: BottomNavigationBarType.fixed,
      selectedFontSize: 12,
      selectedItemColor: kButtonColor,
      unselectedItemColor: kBtnTxtColor,
      currentIndex: _currentTab,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets),
          label: 'Categories',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: loginState ? 'My Account' : 'Log in',
        ),
      ],
    );
  }
}
