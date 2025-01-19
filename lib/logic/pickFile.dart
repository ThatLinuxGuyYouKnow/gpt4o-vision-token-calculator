import 'package:file_picker/file_picker.dart';

pickImageFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    allowMultiple: true,
    type: FileType.custom,
    allowedExtensions: ['jpg', 'png', 'jpeg'],
  );
  return result;
}
