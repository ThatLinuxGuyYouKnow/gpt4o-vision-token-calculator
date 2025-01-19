import 'package:flutter/material.dart';

class Mainscreen extends StatelessWidget {
  Mainscreen({super.key});

  Widget build(BuildContext context) {
    bool isSmallScreenHeight = MediaQuery.of(context).size.height < 600;
    bool isSmallScreenWidth = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.seven_k),
            SizedBox(
              width: isSmallScreenWidth ? 20 : 40,
            ),
            Text('GP4o Vision Tokens')
          ],
        ),
        backgroundColor: Colors.white,
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Divider(
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                color: Colors.black87, borderRadius: BorderRadius.circular(20)),
            width: isSmallScreenHeight ? 200 : 400,
            child: Center(
              child: Icon(Icons.upload_file),
            ),
          )
        ],
      ),
    );
  }
}
