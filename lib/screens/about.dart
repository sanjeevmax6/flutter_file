
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 1, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) =>
          <Widget>[
            SliverAppBar(
                flexibleSpace: FlexibleSpaceBar(),
                title: Container(child: Text('About')),
                forceElevated: innerBoxIsScrolled,
                bottom: PreferredSize(
                    preferredSize: Size.fromHeight(25),
                    child: TabBar(
                      tabs: <Tab>[
                        new Tab(
                          text: "About",
                        ),
                      ],
                      controller: _tabController,
                    ))),
          ],
          body: TabBarView(controller: _tabController, children: [Donate()]),
        ));
  }
}

class Donate extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              "Mail ID for Support", style: TextStyle( fontSize: 15.0),
            ),
            subtitle: Column(children: [
              Text("sanvegas2001@gmail.com"),
              IconButton(
                onPressed: () {
                  Clipboard.setData(new ClipboardData(text: "Gmail"));

                  Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("Copied email address: sanveagas2001@gmail.com")));
                },
                icon: Icon(Icons.content_copy),
              )
            ]),
          ),
        ],
      ),
    );
  }

}
