import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Home Screen',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}

