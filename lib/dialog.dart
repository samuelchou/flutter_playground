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
        spacing: 20,
        children: [
          ElevatedButton(
              onPressed: () => showMeTheDialog(context, "Hello Dialog"),
              child: const Text("A Dialog")),
          ElevatedButton(
              onPressed: () async {
                String? result = await inputDialog(context, "Input Text");
                showMeTheDialog(context, result ?? "null");
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

Future<String?> inputDialog(BuildContext context, [String? titleText]) async {
  String inputData = '';
  return showDialog<String>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: titleText != null ? Text(titleText) : null,
        content: Row(
          children: <Widget>[
            Expanded(
                child: TextField(
              autofocus: true,
              decoration: InputDecoration(
                  labelText: '測試可輸入資料對話視窗', hintText: '請輸入資料...'),
              onChanged: (value) {
                inputData = value ?? '';
              },
            ))
          ],
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Confirm'),
            onPressed: () {
              Navigator.of(context).pop(inputData ?? "");
            },
          ),
        ],
      );
    },
  );
}
