import 'package:flutter/material.dart';
import 'package:shop_app/models/HomeScreen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 170,
            child: DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 0.0),
              children: <Widget>[
                DrawerItem(icon: Icons.home, text: 'Home'),
                DrawerItem(icon: Icons.account_circle, text: 'My Account'),
                Divider(),
                ListView.builder(
                  padding: EdgeInsets.all(0),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: homeScreenVariable.menuCategories.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    dynamic card = homeScreenVariable.menuCategories[index];
                    return card['second_children'].length > 0
                        ? ExpandItem(
                            icon: Icons.stars,
                            title: card['name'],
                            subMenu: card['second_children'],
                          )
                        : DrawerItem(icon: Icons.stars, text: card['name']);
                  },
                ),
                Divider(),
                DrawerItem(icon: Icons.contacts, text: 'Contact Us'),
                ExpandItem(
                  icon: Icons.language,
                  title: 'Language(s)',
                  subMenu: homeScreenVariable.languages['lang_list'],
                ),
                ExpandItem(
                  icon: Icons.monetization_on,
                  title: 'Currency(s)',
                  subMenu: homeScreenVariable.currencies['currency_list'],
                ),
                DrawerItem(icon: Icons.logout, text: 'Logout'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final double horizonPadding;
  final GestureTapCallback onTap;

  const DrawerItem(
      {Key key, this.icon, this.text, this.horizonPadding = 10, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizonPadding, vertical: 10),
        child: Row(
          children: <Widget>[
            Icon(icon),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Text(
                text,
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        ),
      ),
      onTap: onTap,
    );
  }
}

class ExpandItem extends StatefulWidget {
  final IconData icon;
  final String title;
  final dynamic subMenu;

  const ExpandItem({
    Key key,
    this.icon,
    this.title,
    this.subMenu,
  }) : super(key: key);

  @override
  _ExpandItemState createState() => _ExpandItemState();
}

class _ExpandItemState extends State<ExpandItem> {
  bool expand = false;

  @override
  void initState() {
    setState(() {
      expand = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              expand = !expand;
            });
          },
          child: Padding(
            padding: EdgeInsets.only(right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DrawerItem(
                  icon: widget.icon,
                  text: widget.title,
                ),
                Icon(expand
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
          ),
        ),
        expand
            ? ListView.builder(
                padding: EdgeInsets.all(0),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.subMenu.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return DrawerItem(
                    text: widget.subMenu[index]['name'],
                    horizonPadding: 20,
                  );
                },
              )
            : Container(),
      ],
    );
  }
}
