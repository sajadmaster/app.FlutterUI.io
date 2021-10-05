import 'package:flutter/material.dart';



class View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UnknownRoute'),

      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Text("there is not Page",style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),),
            ),

          ],
        ),
      ),

    );
  }
}
