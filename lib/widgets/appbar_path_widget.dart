
import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as pathlib;
import 'package:flutter_file/helpers/filesystem_utils.dart' as filesystem;

class AppBarPathWidget extends StatelessWidget {

  final String path;


  final Function(Directory) onDirectorySelected;

  const AppBarPathWidget(
      {@required this.path, @required this.onDirectorySelected});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(4.0),
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: Row(
          children: filesystem.splitPathToDirectories(path).map((splittedPath) {
            if (splittedPath.absolute.path == pathlib.separator) {
              return PathBarItem(
                  onTap: () {
                    onDirectorySelected(Directory("/"));
                    print(splittedPath);
                  },
                  path: pathlib.separator);
            } else {
              return PathBarItem(
                onTap: () {
                  onDirectorySelected(splittedPath);
                  print(splittedPath);
                },
                path:
                "${pathlib.basename(splittedPath.absolute.path)}${pathlib.separator}",
              );
            }
          }).toList()),
    );
  }
}

class PathBarItem extends StatefulWidget {
  final String path;
  final TextStyle style;
  final onTap;

  const PathBarItem({Key key, @required this.path, this.style, this.onTap})
      : super(key: key);

  @override
  _PathBarItemState createState() => _PathBarItemState();
}

class _PathBarItemState extends State<PathBarItem> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        child: Text(
          widget.path,
          style: widget.style ?? TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
