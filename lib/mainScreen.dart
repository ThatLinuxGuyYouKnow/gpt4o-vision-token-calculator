import 'package:flutter/material.dart';

class Mainscreen extends StatefulWidget {
  Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  bool isHovered = false;
  Widget build(BuildContext context) {
    bool isSmallScreenHeight = MediaQuery.of(context).size.height < 600;
    bool isSmallScreenWidth = MediaQuery.of(context).size.width < 600;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
            ),
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
      body: Center(
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          onEnter: (_) => setState(() => isHovered = true),
          onExit: (_) => setState(() => isHovered = false),
          child: Container(
            height: 400,
            decoration: BoxDecoration(
                border:
                    Border.all(color: isHovered ? Colors.grey : Colors.black87),
                borderRadius: BorderRadius.circular(20)),
            width: isSmallScreenHeight ? 200 : 400,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Icon(Icons.upload_file), Text('Upload your Image')],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
