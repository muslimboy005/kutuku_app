import 'package:flutter/material.dart';

class MyButton extends StatefulWidget {
  final Function onTap;
  final Color? color;
  final BoxBorder? border;
  final String? title;
  final Color? textColol;
  const MyButton({
    this.textColol,
    super.key,
    this.border,
    this.color,
    required this.onTap,
    this.title,
  });

  @override
  State<MyButton> createState() => _MyButtonState();
}

class _MyButtonState extends State<MyButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        widget.onTap();
      },
      borderRadius: BorderRadius.circular(40),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          border: widget.border,
          borderRadius: BorderRadius.circular(40),
          color: widget.color,
        ),
        child: Center(
          child: Text(
            widget.title ?? "",
            style: TextStyle(
              fontSize: 20,
              color: widget.textColol ?? Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
