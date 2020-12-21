import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/detail_state.dart';

import 'components/body.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
