import 'package:flutter/material.dart';

class MyCustomButton extends StatefulWidget {
  final VoidCallback onPressed;
  final String? title;
  final Icon? icon;
  final Color? color;

  const MyCustomButton(
      {super.key, required this.onPressed, this.title, this.icon, this.color});

  @override
  MyCustomButtonState createState() => MyCustomButtonState();
}

class MyCustomButtonState extends State<MyCustomButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(8),
      color: widget.color ?? Theme.of(context).primaryColor.withOpacity(0.4),
      child: InkWell(
        onTap: widget.onPressed,
        borderRadius: BorderRadius.circular(8),
        splashColor: Colors.white.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.icon != null) widget.icon!,
              if (widget.title != null && widget.icon != null)
                const SizedBox(width: 8),
              if (widget.title != null)
                Text(
                  widget.title!,
                  style: const TextStyle(color: Colors.white),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
