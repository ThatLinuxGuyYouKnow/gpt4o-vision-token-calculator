import 'dart:async';
import 'dart:html' as html;
import 'dart:math';

import 'package:flutter/material.dart';

class TokenCalculator {
  final html.File imageFile;

  TokenCalculator({required this.imageFile});

  Future<Map<String, int>> getDimensions() async {
    final completer = Completer<Map<String, int>>();
    final reader = html.FileReader();

    reader.onLoad.listen((event) {
      final img = html.ImageElement();
      img.src = reader.result as String;

      img.onLoad.listen((_) {
        completer
            .complete({'width': img.naturalWidth, 'height': img.naturalHeight});
      });
    });

    reader.readAsDataUrl(imageFile);
    return completer.future;
  }

  Future<void> resizeAndCalculate(BuildContext context) async {
    final dimensions = await getDimensions();
    double width = (dimensions['width'] ?? 0).toDouble();
    double height = (dimensions['height'] ?? 0).toDouble();

    // Scale to fit within 2048x2048
    if (width > 2048 || height > 2048) {
      double aspectRatio = width / height;
      if (aspectRatio > 1) {
        width = 2048;
        height = 2048 / aspectRatio;
      } else {
        width = 2048 * aspectRatio;
        height = 2048;
      }
    }

    // Scale shortest side to 768px
    if (width >= height && height > 768) {
      width = (768 / height) * width;
      height = 768;
    } else if (height > width && width > 768) {
      height = (768 / width) * height;
      width = 768;
    }

    // Calculate tiles needed
    int tilesWidth = (width / 512).ceil();
    int tilesHeight = (height / 512).ceil();
    int totalTiles = tilesWidth * tilesHeight;

    // Calculate tokens
    double totalTokens = 85 + 170 * totalTiles.toDouble();

    print('Final dimensions: ${width.round()}x${height.round()}');
    print('Tiles: $tilesWidth x $tilesHeight = $totalTiles');
    print('Total tokens: $totalTokens');

    // Show results in a dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Image Calculation Results'),
          content: Text(
            'Final dimensions: ${width.round()}x${height.round()}\n'
            'Tiles: $tilesWidth x $tilesHeight = $totalTiles\n'
            'Total tokens: $totalTokens',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
