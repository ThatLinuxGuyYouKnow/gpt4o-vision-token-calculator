import 'dart:async';
import 'dart:html' as html;

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

  Future<Map<String, int>> resizeAndCalculate() async {
    final dimensions = await getDimensions();
    var (imgWidth, imgHeight) =
        (dimensions['width'] ?? 0, dimensions['height'] ?? 0);
    double resizedHeight = 0;
    double resizedWidth = 0;
    // Calculate new dimensions
    if (imgWidth > 2048 || imgHeight > 2048) {
      double aspectRatio = imgWidth / imgHeight;
      if (aspectRatio > 1) {
        (resizedHeight, resizedWidth) = (2048 / aspectRatio, 2048);
      } else {
        (resizedHeight, resizedWidth) = (2048, 2048 * aspectRatio);
      }
    }
    double areaWithResized = resizedWidth * resizedHeight;
    print(dimensions);
    return dimensions;
  }
}
