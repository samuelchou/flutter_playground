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

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: const Text('Go to Page Child'),
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const ChildPage(intVal: 365)));
      },
    ));
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
            Navigator.pop(context);
          },
        ),
      ],
    ));
  }
}
