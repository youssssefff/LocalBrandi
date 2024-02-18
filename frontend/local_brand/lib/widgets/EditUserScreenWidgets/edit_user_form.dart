import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:local_brand/screens/home_screen.dart';
import 'package:local_brand/widgets/EditUserScreenWidgets/edit_user_form_field.dart';
import 'package:local_brand/widgets/global/Buttons/big_button.dart';
import 'package:local_brand/widgets/global/TextWidgets/text_w400_f16.dart';
import 'package:local_brand/widgets/global/form_text_field.dart';
import 'package:local_brand/widgets/global/secondry_title.dart';
import 'package:local_brand/widgets/global/small_form_text_field.dart';
import 'package:http/http.dart' as http;

class EditUserForm extends StatefulWidget {
  EditUserForm({Key? key}) : super(key: key);

  @override
  State<EditUserForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<EditUserForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _firstNameController = TextEditingController();

  final _lastNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextW400F16(text: "Name", link: false, color: Color(0xFF767676)),
          SizedBox(height: 8),
          EditUserFormField(
            label: 'First Name',
            controller: _emailController,
          ),
          EditUserFormField(
            label: 'Last Name',
            controller: _passwordController,
          ),
          SizedBox(height: 8*4),
          TextW400F16(text: 'Hometown', link: false, color: Color(0xFF767676)),
          SizedBox(height: 8),
          EditUserFormField(
            label: 'address',
            controller: _passwordController,
          ),
          SizedBox(height: 8*6),
          BigButton(onPressedFunction: (){}, title: "Save", color: Colors.black, textColor: Colors.white)
        ],
      ),
    );
  }
}
