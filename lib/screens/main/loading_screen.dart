import 'package:flutter/material.dart';
import 'package:shop_app/constants.dart';
import 'package:shop_app/models/Languages.dart';
import 'package:shop_app/models/Variable.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            getWord(isoCode, 'loading_data'),
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: kTGreyColor,
            ),
          ),
          SizedBox(height: 20),
          CircularProgressIndicator()
        ],
      ),
    );
  }
}
