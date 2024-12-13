import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/user.dart';
import 'package:local_brand/providers/userProvider.dart';
import 'package:local_brand/screens/home_screen.dart';
import 'package:local_brand/screens/tabs.dart';
import 'package:local_brand/widgets/global/Buttons/big_button.dart';
import 'package:local_brand/widgets/global/form_text_field.dart';
import 'package:local_brand/widgets/global/secondry_title.dart';
import 'package:local_brand/widgets/global/small_form_text_field.dart';
import 'package:http/http.dart' as http;

class SignUpForm extends ConsumerStatefulWidget {
  SignUpForm({Key? key}) : super(key: key);

  @override
  ConsumerState<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ConsumerState<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();

  void submitForm()  {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Tabs(), // Replace with your widget
        ));
    /*final email = _emailController
        .text; // Assuming you have TextEditingControllers for each field
    final password = _passwordController.text;
    final firstName = _firstNameController.text;
    final lastName = _lastNameController.text;
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.8:8080/api/users/addUser'),
        body: {
          "firstName": firstName,
          "lastName": lastName,
          "email": email,
          "password": password
        },
      );
      if (response.statusCode == 200) {
        final userFromBody = response.body;
        final userMap = json.decode(userFromBody);
        final user = User.fromJson(userMap);
        ref.read(userProvider.notifier).addUser(user);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(), // Replace with your widget
            )
        );
      } else {
        print(response.body);
      }
      return {
        'statusCode': response.statusCode,
        'body': response.body,
      };
    } catch (error) {
      return {
        'statusCode': -1, // or any other appropriate error status code
        'body': 'Error during sign-in: $error',
      };
    }*/
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          FormTextField(
            label: 'E-Mail',
            controller: _emailController,
          ),
          SizedBox(height: 24),
          FormTextField(
            label: 'Password',
            controller: _passwordController,
          ),
          SizedBox(height: 24),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: SmallFormTextField(
                  label: 'First Name',
                  controller: _firstNameController,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: SmallFormTextField(
                  label: 'Last Name',
                  controller: _lastNameController,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          SecondryTitle(
              text:
                  'By continuing, I agree to your Privacy Policy and Terms of use',
              link: false),
          SizedBox(
            height: 24,
          ),
          BigButton(onPressedFunction: submitForm,color: Colors.black,textColor: Colors.white,title: "Sign Up",)
        ],
      ),
    );
  }
}
