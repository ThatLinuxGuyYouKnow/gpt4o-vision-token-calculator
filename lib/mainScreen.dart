import 'package:flutter/material.dart';
import 'package:gpt4_image_token_count/logic/getDimensions.dart';
import 'package:gpt4_image_token_count/logic/pickFile.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({super.key});

  @override
  State<Mainscreen> createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen> {
  bool isHovered = false;

  Future<void> handleImageUpload() async {
    final imageFile = await pickImageFile();
    if (imageFile == null) return; // Add null check

    final calculator = TokenCalculator(imageFile: imageFile);
    final dimensions = await calculator.resizeAndCalculate();
    // TODO: Handle the dimensions result
    print('Resized dimensions: ${dimensions['width']}x${dimensions['height']}');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmallScreenHeight = size.height < 600;
    final isSmallScreenWidth = size.width < 600;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(width: 20),
            const Icon(Icons.seven_k),
            SizedBox(width: isSmallScreenWidth ? 20 : 40),
            const Text('GP4o Vision Tokens'),
          ],
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(4.0),
          child: Divider(color: Colors.black),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: handleImageUpload,
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            onEnter: (_) => setState(() => isHovered = true),
            onExit: (_) => setState(() => isHovered = false),
            child: Container(
              height: 400,
              width: isSmallScreenHeight ? 200 : 400,
              decoration: BoxDecoration(
                border: Border.all(
                  color: isHovered ? Colors.grey : Colors.black87,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file),
                    Text('Upload your Image'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
