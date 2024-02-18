import 'package:flutter/material.dart';
import 'package:local_brand/widgets/SettingsScreenWidgets/settings_button.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [SettingsButton(),SettingsButton(),SettingsButton()],),
    );
  }
}
