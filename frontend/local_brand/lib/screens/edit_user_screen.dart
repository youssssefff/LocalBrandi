import 'package:flutter/material.dart';
import 'package:local_brand/widgets/EditUserScreenWidgets/edit_user_form.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w500_f16.dart';

class EditUserScreen extends StatelessWidget {
  const EditUserScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
          //title: Text("Your App Title"),
          // ... other app bar properties ,)
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 8*8,
              ),
              Column(
                children: [
                  Container(
                    width: 8*12,
                    height: 8*12,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: NetworkImage("https://via.placeholder.com/84x84"),
                        fit: BoxFit.cover,
                      ),
                      shape: OvalBorder(),
                    ),
                  ),SizedBox(
                    height: 8*2,
                  ),TextW500F16(text: 'Edit', link: false, color: Color(0xFF767676)),
                ],
              ),
              SizedBox(
                height: 24,
              ),
              EditUserForm(),
              SizedBox(
                height: 42,
              ),
            ],
          ),
        ),
      ),
    );;
  }
}
