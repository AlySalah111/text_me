import 'dart:io';

void main() {
  var files = Directory('lib').listSync(recursive: true);
  for (var file in files) {
    if (file is File && file.path.contains(',')) {
      print('Found comma in path: ${file.path}');
    }
  }
}
