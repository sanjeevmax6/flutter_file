
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_file/screens/about.dart';
import 'package:flutter_file/screens/settings.dart';
import 'package:flutter_file/notifiers/core.dart';
import 'package:flutter_file/widgets/create_dialog.dart';
import 'package:flutter_file/helpers/filesystem_utils.dart' as filesystem;

class AppBarPopupMenu extends StatelessWidget {
  final String path;
  const AppBarPopupMenu({Key key, this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("AppBarPopupMenu(path): $path");
    return Consumer<CoreNotifier>(
      builder: (context, model, child) => PopupMenuButton<String>(
          onSelected: (value) {
            if (value == "refresh") {
              model.reload();
            } else if (value == "folder") {
              showDialog(
                  context: context,
                  builder: (context) => CreateDialog(
                    onCreate: (path) {
                      filesystem.createFolderByPath(path);
                      // leaving dialog
                      model.reload();
                    },
                    path: path,
                    title: Text("Create new folder"),
                  ));
            } else if (value == "settings") {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Settings()));
            } else if (value == "about") {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutScreen()));
            } else if (value == "paste") {
              model.pasteByPath(path);
            }
            //...
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<String>>[
            PopupMenuItem<String>(
                enabled: model.copyList.isNotEmpty,
                value: 'paste',
                child: Text('Paste Here')),

            const PopupMenuItem<String>(
                value: 'refresh', child: Text('Refresh')),
//            const PopupMenuItem<String>(
//                value: 'sort', child: Text('Sort By')),
            const PopupMenuItem<String>(
                value: 'folder', child: Text('New Folder')),
//            const PopupMenuItem<String>(
//                value: 'settings', child: Text('Settings')),
            const PopupMenuItem<String>(
                value: 'about', child: Text('About')),
            //...
          ]),
    );
  }
}
