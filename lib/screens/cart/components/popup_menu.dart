import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  final Function(int) onTap;

  const PopupMenu({Key key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      padding: EdgeInsets.all(0),
      elevation: 20,
      onSelected: (value) {
        onTap(value);
      },
      offset: Offset.lerp(Offset(0, 0), Offset(10, 10), 10),
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 1,
          child: Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                child: Icon(Icons.edit),
              ),
              Text('Update Quantity'),
            ],
          ),
        ),
        PopupMenuItem(
            value: 2,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(2, 2, 8, 2),
                  child: Icon(Icons.delete),
                ),
                Text('Remove')
              ],
            )),
      ],
    );
  }
}
