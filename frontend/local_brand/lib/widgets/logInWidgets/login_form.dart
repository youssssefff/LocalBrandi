import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_brand/models/user.dart';
import 'package:local_brand/providers/userProvider.dart';
import 'package:local_brand/screens/tabs.dart';
import 'package:local_brand/widgets/global/Buttons/big_button.dart';
import 'package:local_brand/widgets/global/form_text_field.dart';
import 'package:http/http.dart' as http;

class LoginForm extends ConsumerStatefulWidget {
  LoginForm({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends ConsumerState<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  Future<void> submitForm() async {
    final email = _emailController.text;
    final password = _passwordController.text;
    try {
      final response = await http.post(
        Uri.parse('http://192.168.1.8:8080/api/users/loginUser'),
        body: {"email": email, "password": password},
      );
      if (response.statusCode == 200) {
        final userFromBody = response.body;
        final userMap = json.decode(userFromBody);
        final user = User.fromJson(userMap);
        ref.read(userProvider.notifier).addUser(user);
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Tabs(), // Replace with your widget
            ));
      } else {
        print(response.body);
      }
    } catch (error) {
      print('Error during sign-in: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        FormTextField(
          label: "E-Mail",
          controller: _emailController,
        ),
        SizedBox(
          height: 20,
        ),
        FormTextField(
          label: "Password",
          controller: _passwordController,
        ),
        SizedBox(
          height: 32,
        ),
        BigButton(onPressedFunction: submitForm,color:Colors.black,textColor: Colors.white,title: "Log In",)
      ],
    ));
  }
}
