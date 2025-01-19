// pickFile.dart
import 'package:file_picker/file_picker.dart';
import 'dart:html' as html;

Future<html.File?> pickImageFile() async {
  final result = await FilePicker.platform.pickFiles(
    type: FileType.image,
    allowMultiple: false,
  );

  if (result != null) {
    // Convert PlatformFile to html.File
    final platformFile = result.files.first;
    final blob = html.Blob([platformFile.bytes!]);
    return html.File([blob], platformFile.name);
  }

  return null;
}
