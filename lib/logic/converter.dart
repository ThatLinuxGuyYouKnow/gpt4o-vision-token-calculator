import 'dart:async';
import 'dart:html' as html;

Future<Map<String, int>> getDimensions(html.File imageFile) async {
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
