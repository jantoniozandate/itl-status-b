import 'package:flutter/material.dart';
import 'package:itlstatusb/src/components/text_field_container.dart';
import 'package:itlstatusb/constants.dart';

class RoundedInputForm extends StatelessWidget {
  final String hintText;
  final String labelText;
  final String initialValue;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputForm({
    Key key,
    this.initialValue,
    this.labelText,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        initialValue: initialValue,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: kPrimaryColor,
          ),
          hintText: hintText,
          border: InputBorder.none,
          labelText: labelText
        ),
      ),
    );
  }
}