import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/HomeScreen.dart';
import 'package:shop_app/models/Languages.dart';
import 'package:shop_app/models/TokenData.dart';
import 'package:shop_app/models/Variable.dart';
import 'package:shop_app/screens/cart/cart_screen.dart';
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
  final int initTab;

  const HomePage({Key key, this.initTab = 0}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  int _currentTab;

  List<Widget> _pages = [
    HomeTab(),
    CategoriesTab(),
    CartScreen(),
    loginState ? SearchTab() : SignInScreen(),
  ];
  Widget _currentPage;

  @override
  void initState() {
    _currentTab = widget.initTab;
    _currentPage = _pages[_currentTab];
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
          label: getWord(isoCode, 'home'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.widgets),
          label: getWord(isoCode, 'categories'),
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.search),
        //   label: 'Search',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart_outlined),
          label: getWord(isoCode, 'cart'),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person_outline),
          label: loginState
              ? getWord(isoCode, 'my_account')
              : getWord(isoCode, 'log_in'),
        ),
      ],
    );
  }
}
