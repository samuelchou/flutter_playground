import 'package:flutter/material.dart';

void main() {
  var app = MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title: const Text("Lab Code"),
      ),
      body: const Center(
        child: HomePage(),
      ),
    ),
  );
  runApp(app);
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: 0.234,
      child: ElevatedButton(
          onPressed: () => showMeTheDialog(
              context, "Hello Dialog"
          ),
          child: const Text("A Dialog")),
    );
  }

  void showMeTheDialog(
      BuildContext context, String messageText, [String? titleText]
    ) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: titleText != null ? Text(titleText) : null,
            content: Text(messageText),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(24.0))),
            actions: <Widget>[
              TextButton(
                child: const Text('Confirm'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
