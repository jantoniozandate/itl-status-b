import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final Function press;
  final Color color, textColor;
  final bool disabled;
  const RoundedButton(
      {Key key,
      this.text,
      this.press,
      this.color = Colors.blue,
      this.disabled = false,
      this.textColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: /* ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: */ TextButton(
          style: TextButton.styleFrom(
            backgroundColor: this.color,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            padding: EdgeInsets.all(20),
            elevation: 2,
            shadowColor: this.color,
            // side: BorderSide(color: Colors.white, width: 1)
          ),
          onPressed: this.disabled ? null : this.press,
          child: Text(this.text, style: TextStyle(color: this.textColor)),
        ),
      // ),
    );
  }
}
