import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Page Interaction"),
      ),
      body: const Center(
        child: HomePage(),
      ),
    ),
  );
  runApp(app);
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? result;

  @override
  Widget build(BuildContext context) {
    String showText;
    if (result != null) {
      showText = "current result: $result";
    } else {
      showText = "current result: none";
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('Go to Page Child'),
            onPressed: () async {
              int val = Random().nextInt(100);
              debugPrint("generated value: $val");
              // result = await Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => ChildPage(intVal: val)));
              result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ChildFulPage(intVal: val)));
              debugPrint("result now: $result");
              setState(() {});
            },
          ),
          Text(showText),
        ]);
  }
}

class ChildPage extends StatelessWidget {
  final int intVal;
  final String stringVal;

  const ChildPage(
      {Key? key, required this.intVal, this.stringVal = "Hello Page Child"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(stringVal)),
      body: ChildPageContent(intVal: intVal),
    );
  }
}

class ChildPageContent extends StatelessWidget {
  final int intVal;

  const ChildPageContent({Key? key, this.intVal = 0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Passed value $intVal"),
        ElevatedButton(
          child: const Text('Go back'),
          onPressed: () {
            Navigator.pop(context, intVal);
          },
        ),
      ],
    ));
  }
}

class ChildFulPage extends StatefulWidget {
  final int intVal;
  final String stringVal;

  const ChildFulPage(
      {Key? key, required this.intVal, this.stringVal = "Hello Page ChildFul"})
      : super(key: key);

  @override
  State<ChildFulPage> createState() => _ChildFulPageState();
}

class _ChildFulPageState extends State<ChildFulPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Passed value ${widget.intVal}"),
        ElevatedButton(
          child: const Text('Go back'),
          onPressed: () {
            Navigator.pop(context, widget.intVal);
          },
        ),
      ],
    ));
  }
}
