import 'package:flutter/material.dart';
import 'package:local_brand/widgets/ProfileScreenWidgets/ProfileNavigationWidgets/profile_navigation_row.dart';
import 'package:local_brand/widgets/ProfileScreenWidgets/profile_picture_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          SizedBox(
            height: 8*12,
          ),
          ProfilePictureSection(),
          SizedBox(
            height: 8*4,
          ),
          ProfileNavigationRow()
        ],
      ),
    );
  }
}
