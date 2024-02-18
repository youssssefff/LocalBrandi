import 'package:flutter/material.dart';

class EditUserFormField extends StatelessWidget {
  const EditUserFormField({
    Key? key,
    required this.label,
    this.controller,
  }) : super(key: key);
  final String label;

  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 8*7,
      child: TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter your name.';
          }
          return null; // No error message if valid
        },
        onSaved: (value) => {},
        controller: controller,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFF767676)),
          ),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          labelStyle: TextStyle(color: Color(0xFF767676)),
          focusColor: Color(0xFF767676),
          border: OutlineInputBorder(
            // This defines the default border
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              color: Color(0xFF767676),
            ),
          ),
        ),
      ),
    );
  }
  }
