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
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const ChildPage()));
      },
    ));
  }
}

class ChildPage extends StatelessWidget {
  const ChildPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Child')),
      body: const ChildPageContent(),
    );
  }
}

class ChildPageContent extends StatelessWidget {
  const ChildPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      child: const Text('Go back'),
      onPressed: () {
        Navigator.pop(context);
      },
    ));
  }
}
