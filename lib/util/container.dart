import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final Widget child;
  const Box({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: CupertinoColors.systemGrey6,
        borderRadius: BorderRadius.circular(15.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            spreadRadius: 3.0,
            blurRadius: 15,
            offset: Offset(5, 5),
            blurStyle: BlurStyle.inner
          ),
          BoxShadow(
            color: Colors.white,
            spreadRadius: 3.0,
            blurRadius: 10.0,
            offset: Offset(-5, -5),
            blurStyle: BlurStyle.inner
          ),
        ],
      ),
      child: child,
    );
  }
}
