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
      child: Wrap(
        direction: Axis.vertical,
        crossAxisAlignment: WrapCrossAlignment.center,
        spacing: 20,
        children: [
          ElevatedButton(
              onPressed: () => showMeTheDialog(context, "Hello Dialog"),
              child: const Text("A Dialog")),
          ElevatedButton(
              onPressed: () async {
                String? result = await inputDialog(context,
                    titleText: "Input Text",
                    labelText: "Input a message",
                    hintText: "Hello");
                showMeTheDialog(context, result?.isNotEmpty ?? false ? result! : "no words");
              },
              child: const Text("Input something")),
        ],
      ),
    );
  }

  void showMeTheDialog(BuildContext context, String messageText,
      [String? titleText]) {
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

Future<String?> inputDialog(BuildContext context,
    {String? titleText, String? labelText, String? hintText}) async {
  return showDialog<String>(
    context: context,
    barrierDismissible: false, // to prevent from accidental closing.
    builder: (BuildContext context) {
      String inputData = '';
      return AlertDialog(
        title: titleText != null ? Text(titleText) : null,
        content: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: labelText ?? '', hintText: hintText ?? ''),
              onChanged: (value) {
                inputData = value;
              },
            ))
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              Navigator.of(context).pop(inputData);
            },
          ),
        ],
      );
    },
  );
}
