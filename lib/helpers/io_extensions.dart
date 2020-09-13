
import 'dart:io';
import 'package:path/path.dart' as pathlib;

extension ExtendedFile on File {

  String extension() {
    return pathlib.extension(path);
  }

  String basename() {
    return pathlib.basename(path);
  }
}

extension ExtendedDirectory on Directory {
  String basename() {
    return pathlib.basename(this.path);
  }
}

extension ExtendedFileSystemEntity on FileSystemEntity {
  String basename() {
    return pathlib.basename(path);
  }
}
