import 'package:flutter/material.dart';

class TemporaryPage extends StatelessWidget {
  static final String temporaryRoute = "/temporaryRoute";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text(
            "This is still a work in progress",
            style: TextStyle(
              color: Colors.black,
              fontSize: MediaQuery.of(context).size.height / 8,
              fontFamily: 'Electrolize'
            ),
          ),
        ),
      ),
    );
  }
}
