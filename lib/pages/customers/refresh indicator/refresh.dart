import 'package:flutter/cupertino.dart';

class Refresh extends StatefulWidget {
  Refresh({Key key}) : super(key: key);

  @override
  _RefreshState createState() => _RefreshState();
}

class _RefreshState extends State<Refresh> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: <Widget>[
          CupertinoSliverRefreshControl(
            refreshTriggerPullDistance: 100.0,
            refreshIndicatorExtent: 60.0,
            onRefresh: () async {
              await Future<void>.delayed(Duration(milliseconds: 100));
              setState(() {});
            },
          )
        ],
      ),
    );
  }
}
