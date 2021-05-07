// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
/*
import 'package:flutter/material.dart';

// Pressing the PopupMenuButton on the right of this item shows
// a menu whose items have text labels and icons and a divider
// That separates the first three items from the last one.





























PopupMenuButton<WhyFarther>(
  onSelected: (WhyFarther result) { setState(() { _selection = result; }); },
  itemBuilder: (BuildContext context) => <PopupMenuEntry<WhyFarther>>[
    const PopupMenuItem<WhyFarther>(
      value: WhyFarther.harder,
      child: Text('Working a lot harder'),
    ),
    const PopupMenuItem<WhyFarther>(
      value: WhyFarther.smarter,
      child: Text('Being a lot smarter'),
    ),
    const PopupMenuItem<WhyFarther>(
      value: WhyFarther.selfStarter,
      child: Text('Being a self-starter'),
    ),
    const PopupMenuItem<WhyFarther>(
      value: WhyFarther.tradingCharter,
      child: Text('Placed in charge of trading charter'),
    ),
  ],
)


















class _SectionedMenuDemo extends StatelessWidget {
  const _SectionedMenuDemo({Key key, this.showInSnackBar}) : super(key: key);

  final void Function(String value) showInSnackBar;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
          GalleryLocalizations.of(context).demoMenuAnItemWithASectionedMenu),
      trailing: PopupMenuButton<String>(
        padding: EdgeInsets.zero,
        onSelected: (value) => showInSnackBar(
            GalleryLocalizations.of(context).demoMenuSelected(value)),
        itemBuilder: (context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: GalleryLocalizations.of(context).demoMenuPreview,
            child: ListTile(
              leading: const Icon(Icons.visibility),
              title: Text(
                GalleryLocalizations.of(context).demoMenuPreview,
              ),
            ),
          ),
          PopupMenuItem<String>(
            value: GalleryLocalizations.of(context).demoMenuShare,
            child: ListTile(
              leading: const Icon(Icons.person_add),
              title: Text(
                GalleryLocalizations.of(context).demoMenuShare,
              ),
            ),
          ),
          PopupMenuItem<String>(
            value: GalleryLocalizations.of(context).demoMenuGetLink,
            child: ListTile(
              leading: const Icon(Icons.link),
              title: Text(
                GalleryLocalizations.of(context).demoMenuGetLink,
              ),
            ),
          ),
          const PopupMenuDivider(),
          PopupMenuItem<String>(
            value: GalleryLocalizations.of(context).demoMenuRemove,
            child: ListTile(
              leading: const Icon(Icons.delete),
              title: Text(
                GalleryLocalizations.of(context).demoMenuRemove,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
















/// Flutter code sample for DropdownButton

// This sample shows a `DropdownButton` with a large arrow icon,
// purple text style, and bold purple underline, whose value is one of "One",
// "Two", "Free", or "Four".
//
// ![](https://flutter.github.io/assets-for-api-docs/assets/material/dropdown_button.png)


void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: const Center(
          child: MyStatefulWidget(),
        ),
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

/// This is the private State class that goes with MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  String dropdownValue = 'One';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
*/
