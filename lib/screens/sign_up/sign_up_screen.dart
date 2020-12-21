import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/Languages.dart';
import 'package:shop_app/models/Variable.dart';
import 'package:shop_app/providers/detail_state.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  static String routeName = "/sign_up";
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: DetailState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(getWord(isoCode, 'sign_up')),
        ),
        body: Body(),
      ),
    );
  }
}
