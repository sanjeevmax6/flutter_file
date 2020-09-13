
import 'package:flutter/material.dart';
import 'package:flutter_file/screens/folder_list_screen.dart';
import 'package:flutter_file/widgets/context_dialog.dart';
import 'package:flutter_file/notifiers/core.dart';
import 'package:provider/provider.dart';

class FolderWidget extends StatelessWidget {
  final String path;
  final String name;

  const FolderWidget({@required this.path, @required this.name});
  @override
  Widget build(BuildContext context) {
    var coreNotifier = Provider.of<CoreNotifier>(context, listen: false);
    return Container(
        child: InkWell(
          borderRadius: BorderRadius.circular(10.0),
          onTap: () {
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => FolderListScreen(path: path)));
            coreNotifier.navigateToDirectory(path);
          },
          onLongPress: () {
            showDialog(
                context: context,
                builder: (context) => FolderContextDialog(
                  path: path,
                  name: name,
                ));
          },
          child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Icon(
              Icons.folder_shared,
              size: 50.0,
              color: Colors.yellow[700],
            ),
            Text(
              name,
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.black45),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ]),
        ));
  }
}
