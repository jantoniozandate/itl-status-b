import 'package:flutter/material.dart';
import 'package:itlstatusb/src/components/text_field_container.dart';
import 'package:itlstatusb/constants.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanged;
  final String hint;

  const RoundedPasswordField({
    Key key,
    this.onChanged,
    this.hint,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isObscureText = true;


  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: isObscureText,
        onChanged: widget.onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: widget.hint ?? "Contraseña",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: IconButton(
            icon: isObscureText
                ? Icon(Icons.visibility_off, color: kPrimaryColor)
                : Icon(Icons.visibility, color: kPrimaryColor),
            // Icons.visibility,
            // color: kPrimaryColor,
            onPressed: () {
              setState(() {
                isObscureText = !isObscureText;
              });
            },
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
