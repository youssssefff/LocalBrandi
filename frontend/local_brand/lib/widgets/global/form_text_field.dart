import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  FormTextField({
    Key? key,
    required this.label,
    this.controller,
  }) : super(key: key);
  String label;
  final TextEditingController? controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 54,
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
            borderSide: const BorderSide(color: Color(0xFF767676), width: 2.0),
            borderRadius: BorderRadius.circular(8),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Color(0xFF767676)),
          focusColor: Color(0xFF767676),
          border: OutlineInputBorder(
            // This defines the default border
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(
              width: 2.0,
              color: Color(0xFF767676),
            ),
          ),
        ),
      ),
    );
  }
}
