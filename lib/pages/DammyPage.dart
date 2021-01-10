import 'dart:ui';

import 'package:ExampleBottomNavigation/services/NavigationService.dart';
import 'package:ExampleBottomNavigation/settings/ScreenArguments.dart';
import 'package:flutter/material.dart';

class DammyPage extends StatefulWidget {
  DammyPage({
    Key key,
    this.title,
    this.arguments,
  }) : super(key: key);

  final String title;
  final ScreenArguments arguments;

  @override
  _DammyPageState createState() => _DammyPageState();
}

class _DammyPageState extends State<DammyPage> {
  @override
  Widget build(BuildContext context) {
    if (ModalRoute.of(context).settings.arguments != null) {
      print("arguments");
      print(ModalRoute.of(context).settings.arguments);
    }
    if (widget.arguments != null) {
      print("widget.arguments");
      print(widget.arguments);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              widget.title,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            (widget.arguments != null)
                ? Text(
                    "arguments: " + widget.arguments.message,
                    style: TextStyle(
                      fontSize: 10,
                    ),
                  )
                : SizedBox(),
            SizedBox(
              height: 20,
            ),
            (widget.arguments != null && widget.arguments.message == 'in full screen')
                ? FlatButton(
                    onPressed: () => {
                      //フルスクリーン内で遷移
                      NavigationService.pushNamedRoot(
                        "/detail",
                        arguments: ScreenArguments(
                          'in full screen',
                        ),
                      )
                    },
                    child: Text('/detail in fullscreen'),
                  )
                : FlatButton(
                    onPressed: () => {
                      //タブ内に遷移
                      NavigationService.pushInTab(
                        "/detail",
                        arguments: ScreenArguments(
                          DateTime.now().toIso8601String(),
                        ),
                      )
                    },
                    child: Text('/detail in tab'),
                  ),
            FlatButton(
              onPressed: () => {
                //フルスクリーンで遷移
                NavigationService.pushNamedRoot(
                  "/fullscreen",
                  arguments: ScreenArguments(
                    'in full screen',
                    fullscreenDialog: true,
                  ),
                )
              },
              child: Text('/fullscreen'),
            )
          ],
        ),
      ),
    );
  }
}
