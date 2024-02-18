import 'package:flutter/material.dart';
import 'package:local_brand/screens/settings_screen.dart';
import 'package:local_brand/widgets/ProfileScreenWidgets/ProfileNavigationWidgets/profile_navigation_item.dart';

class ProfileNavigationRow extends StatelessWidget {
  const ProfileNavigationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ProfileNavigationItem(title:"Orders",icon:Icon(Icons.shop_2_outlined,color: Colors.grey)),
        ProfileNavigationItem(title:"pass",icon:Icon(Icons.card_giftcard_outlined,color: Colors.grey)),
        ProfileNavigationItem(title:"events",icon:Icon(Icons.event,color: Colors.grey)),
    GestureDetector(onTap: (){Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SettingsScreen(), // Replace with your widget
        )
    );},child:ProfileNavigationItem(title: "Settings",icon:Icon(Icons.settings,color: Colors.grey,)))
      ],
    );
  }
}
