import 'package:flutter/material.dart';
import 'package:local_brand/screens/sign_up_screen.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f24.dart';
import 'package:local_brand/widgets/global/secondry_title.dart';
import 'package:local_brand/widgets/logInWidgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 36, vertical: 40),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: [

              TextW400F24(text: 'Welcome Back',link: false,color: Colors.black,),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  TextW400F16(text: "or you can ",link: false,color: Color(0xFF767676),),
                  GestureDetector(
                      onTap: () =>{Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUpScreen()),
                      )}, child: TextW400F16(text: "join us!!",link: true,color: Colors.black,))
                ],
              ),
              SizedBox(
                height: 24,
              ),
              LoginForm(),
              //FormNextButton()
            ],
          ),
        ),
      ),
    );
  }
}
